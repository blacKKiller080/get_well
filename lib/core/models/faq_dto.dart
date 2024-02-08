import 'dart:convert';

FAQsDto FAQsDtoFromJson(String str) => FAQsDto.fromJson(json.decode(str));

String FAQsDtoToJson(FAQsDto data) => json.encode(data.toJson());

class FAQsDto {
  int? id;
  String? title;
  String? description;
  String? error;

  FAQsDto({
    this.id,
    this.title,
    this.description,
  });

  FAQsDto.withError(String errorMessage) {
    error = errorMessage;
  }

  FAQsDto copyWith({
    int? id,
    String? title,
    String? description,
  }) {
    return FAQsDto(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  factory FAQsDto.fromJson(Map<String, dynamic> json) => FAQsDto(
        id: json["id"],
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
      };

  @override
  String toString() {
    return 'User(id: $id, title: $title)';
  }
}
