import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ustore/common/error_handling.dart';
import 'package:ustore/common/pending_user_action.dart';
import 'package:ustore/common/user_action_manager.dart';
import 'package:ustore/featuers/auth/presentation/screens/sign_in_screen.dart';
import 'package:ustore/featuers/details/cubit/details_data_status.dart';
import 'package:ustore/featuers/details/usecase/details_usecase.dart';
import 'package:ustore/data/models/product.dart';
import 'package:ustore/featuers/main_wrapper/presentation/cubit/main_wrapper_cubit.dart';
import 'package:ustore/locator.dart';

part 'details_state.dart';

// lib/featuers/details/cubit/details_cubit.dart
class DetailsCubit extends Cubit<DetailsState> {
  final DetailsUsecase detailsUsecase;

  DetailsCubit(this.detailsUsecase)
      : super(DetailsState(status: DetailsDataInitial(), isFavorite: false));

  // Check whether the user is logged in
  Future<void> checkLoginAndToggleFavorite(
      Product product, BuildContext context) async {
    try {
      final user = await detailsUsecase.getCurrentUserId();

      if (user.isNotEmpty) {
        await toggleFavorite(product, user, context);
      } else {
        emit(DetailsState(
          status: DetailsDataError(
              ErrorHandling.getErrorMessage(ErrorHandling.SHOULD_BE_LOGIN)),
          isFavorite: false,
        ));
        final userActionManager = locator<UserActionManager>();
        userActionManager.setPendingAction(
          PendingUserAction(
            actionType: PendingActionType.addToFavorites,
            product: product,
          ),
        );
        Navigator.pushNamed(context, SignInScreen.signIn);
      }
    } catch (e) {
      // Hier landet man nur bei echten, unerwarteten Fehlern
      emit(DetailsState(
        status: DetailsDataError('Error checking login status'),
        isFavorite: false,
      ));
    }
  }

  // Add or remove product to/from favorites
  Future<void> toggleFavorite(
      Product product, String userId, BuildContext context) async {
    try {
      if (state.isFavorite) {
        await detailsUsecase.removeProductFromFavorites(product, userId);
        emit(DetailsState(
            status: RemoveProductFromFavoritesSuccess(), isFavorite: false));
      } else {
        await detailsUsecase.addProductToFavorites(product, userId);
        emit(DetailsState(
            status: AddProductToFavoritesSuccess(), isFavorite: true));
      }

      final updatedCount = await detailsUsecase.getFavoritesCount(userId);
      context.read<MainWrapperCubit>().updateFavoritesCount(updatedCount);
    } catch (e) {
      emit(DetailsState(
          status: DetailsDataError('Error toggling favorite status'),
          isFavorite: false));
    }
  }
}
