import 'dart:convert';

CountryDto CountryDtoFromJson(String str) =>
    CountryDto.fromJson(json.decode(str));

String CountryDtoToJson(CountryDto data) => json.encode(data.toJson());

class CountryDto {
  int? id;
  String? title;
  List<City>? cities;
  String? error;

  CountryDto({
    this.id,
    this.title,
    this.cities,
  });

  CountryDto.withError(String errorMessage) {
    error = errorMessage;
  }

  CountryDto copyWith({
    int? id,
    String? title,
    List<City>? cities,
  }) {
    return CountryDto(
      id: id ?? this.id,
      title: title ?? this.title,
      cities: cities ?? this.cities,
    );
  }

  factory CountryDto.fromJson(Map<String, dynamic> json) {
    var citiesList = json['cities'] as List;
    print(citiesList.runtimeType);
    List<City> cityList = citiesList.map((i) => City.fromJson(i)).toList();
    return CountryDto(
      id: json["id"],
      title: json["title"],
      cities: cityList,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "cities": cities,
      };

  @override
  String toString() {
    return 'User(id: $id, title: $title, $cities)';
  }
}

class City {
  int? id;
  String? title;
  int? country_id;

  City({
    this.id,
    this.title,
    this.country_id,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        title: json["title"],
        country_id: json["country_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "country_id": country_id,
      };
}
