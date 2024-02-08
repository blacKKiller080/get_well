import 'dart:convert';

class User {
  final int? id;
  final String? login;
  final String? gender;
  final int? city_id;
  final String? app;
  final String? token;

  User({
    this.id,
    this.login,
    this.gender,
    this.city_id,
    this.app,
    this.token,
  });

  User copyWith({
    int? id,
    String? login,
    String? gender,
    int? city_id,
    String? app,
    String? token,


  }) {
    return User(
      id: id ?? this.id,
      login: login ?? this.login,
      gender: gender ?? this.gender,
      city_id: city_id ?? this.city_id,
      app: app ?? this.app,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (login != null) {
      result.addAll({'login': login});
    }
    if (gender != null) {
      result.addAll({'gender': gender});
    }
    if (city_id != null) {
      result.addAll({'city_id': city_id});
    }

    if (app != null) {
      result.addAll({'app': app});
    }
    if (token != null) {
      result.addAll({'token': token});
    }

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt(),
      login: map['login'],
      gender: map['gender'],
      city_id: map['city_id'],
      app: map['app'],
      token: map['access_token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, login: $login, gender: $gender, city_id: $city_id, app: $app, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.login == login &&
        other.gender == gender &&
        other.city_id == city_id &&
        other.app == app &&
        other.token == token;
  }

  @override
  int get hashCode {
    return id.hashCode ^ login.hashCode ^ gender.hashCode ^ city_id.hashCode ^ app.hashCode ^ token.hashCode;
  }
}
