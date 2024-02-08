import 'dart:convert';

LifeStylesDto LifeStylesDtoFromJson(String str) =>
    LifeStylesDto.fromJson(json.decode(str));

String LifeStylesDtoToJson(LifeStylesDto data) => json.encode(data.toJson());

class LifeStylesDto {
  int? id;
  String? title;
  String? error;
  bool isChosen = false;

  LifeStylesDto({
    this.id,
    this.title,
  });

  LifeStylesDto.withError(String errorMessage) {
    error = errorMessage;
  }

  LifeStylesDto copyWith({
    int? id,
    String? title,
  }) {
    return LifeStylesDto(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  factory LifeStylesDto.fromJson(Map<String, dynamic> json) => LifeStylesDto(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };

  @override
  String toString() {
    return 'User(id: $id, title: $title)';
  }
}
