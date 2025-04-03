import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final String? street;
  final String? city;
  final String? state;
  final String? country;
  final String? zipCode;

  const Address({
    this.street,
    this.city,
    this.state,
    this.country,
    this.zipCode,
  });

  Address copyWith({
    String? street,
    String? city,
    String? state,
    String? country,
    String? zipCode,
  }) {
    return Address(
      street: street ?? this.street,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      zipCode: zipCode ?? this.zipCode,
    );
  }

  toJson() {
    return {
      'street': street,
      'city': city,
      'state': state,
      'country': country,
      'zipCode': zipCode,
    };
  }

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      zipCode: json['zipCode'] as String?,
    );
  }

  @override
  List<Object?> get props => [street, city, state, country, zipCode];
}
