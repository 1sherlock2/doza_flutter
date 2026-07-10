class AdditionalOrderInfoUiModel {
  final String secondName;
  final String firstName;
  final int city;
  final String street;
  final String house;
  final String? apartment;

  AdditionalOrderInfoUiModel({
    required this.secondName,
    required this.firstName,
    required this.city,
    required this.street,
    required this.house,
    this.apartment,
  });

  Map<String, dynamic> toJson() => {
        'secondName': secondName,
        'firstName': firstName,
        'city': city,
        'street': street,
        'house': house,
        'apartment': apartment,
      };
}
