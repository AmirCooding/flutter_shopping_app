import 'package:ustore/common/pending_user_action.dart';

// Singelto Service handel Pending Action
class UserActionManager {
  static final UserActionManager _instance = UserActionManager._internal();

  factory UserActionManager() => _instance;

  UserActionManager._internal();

  PendingUserAction? _pendingAction;

  void setPendingAction(PendingUserAction action) {
    _pendingAction = action;
  }

  PendingUserAction? get pendingAction => _pendingAction;

  void clear() {
    _pendingAction = null;
  }

  getPendingAction() {
    if (_pendingAction != null) {
      final action = _pendingAction;
      clear();
      return action;
    }
    return null;
  }
}
