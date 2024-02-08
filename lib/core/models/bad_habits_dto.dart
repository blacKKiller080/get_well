import 'dart:convert';

BadHabitsDto BadHabitsDtoFromJson(String str) =>
    BadHabitsDto.fromJson(json.decode(str));

String BadHabitsDtoToJson(BadHabitsDto data) => json.encode(data.toJson());

class BadHabitsDto {
  int? id;
  String? title;
  String? error;
  bool isChosen = false;

  BadHabitsDto({
    this.id,
    this.title,
  });

  BadHabitsDto.withError(String errorMessage) {
    error = errorMessage;
  }

  BadHabitsDto copyWith({
    int? id,
    String? title,
  }) {
    return BadHabitsDto(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  factory BadHabitsDto.fromJson(Map<String, dynamic> json) => BadHabitsDto(
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
