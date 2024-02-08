import 'dart:convert';

PrivacyDto PrivacyDtoFromJson(String str) =>
    PrivacyDto.fromJson(json.decode(str));

String PrivacyDtoToJson(PrivacyDto data) => json.encode(data.toJson());

class PrivacyDto {
  int? id;
  String? path;
  String? slug;
  String? error;

  PrivacyDto({
    this.id,
    this.path,
    this.slug,
  });

  PrivacyDto.withError(String errorMessage) {
    error = errorMessage;
  }

  PrivacyDto copyWith({
    int? id,
    String? title,
    String? description,
  }) {
    return PrivacyDto(
      id: id ?? this.id,
      path: title ?? this.path,
      slug: description ?? this.slug,
    );
  }

  factory PrivacyDto.fromJson(Map<String, dynamic> json) => PrivacyDto(
        id: json["id"],
        path: json["path"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "path": path,
        "slug": slug,
      };

  @override
  String toString() {
    return 'User(id: $id, title: $path)';
  }
}
