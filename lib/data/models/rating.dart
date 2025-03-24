import 'package:equatable/equatable.dart';

class Rating extends Equatable {
  final double? rate;
  final int? count;

  const Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json)
      : rate = (json['rate'] is int)
            ? (json['rate'] as int).toDouble()
            : json['rate'],
        count = json['count'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rate'] = rate;
    data['count'] = count;
    return data;
  }

  @override
  List<Object?> get props => [
        rate,
        count,
      ];
}
