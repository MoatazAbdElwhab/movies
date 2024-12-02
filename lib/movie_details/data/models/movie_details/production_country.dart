class ProductionCountries {
  final String? iso31661;
  final String? name;

  const ProductionCountries({this.iso31661, this.name});

  factory ProductionCountries.fromJson(Map<String, dynamic> json) {
    return ProductionCountries(
      iso31661: json['iso_3166_1'] as String?,
      name: json['name'] as String?,
    );
  }
}
