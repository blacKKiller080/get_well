import 'dart:convert';

RegisterData registerApiRequestFromJson(String str) =>
    RegisterData.fromJson(json.decode(str));

String registerApiRequestToJson(RegisterData data) =>
    json.encode(data.toJson());

class RegisterData {
  RegisterData({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.city,
    required this.birthDate,
    //required this.image,
    required this.nickname,
    required this.password,
    required this.height,
    required this.weight,
    required this.gender,
    required this.badHabits,
    required this.lifeStyles,
    required this.officeWorker,
    required this.physicalWorker,
  });

  String firstName;
  String lastName;
  String email;
  String phone;
  String city;
  String birthDate;
  // XFile image;
  String nickname;
  String password;
  String height;
  String weight;
  String gender;
  List<String> badHabits;
  List<String> lifeStyles;
  bool officeWorker;
  bool physicalWorker;

  factory RegisterData.fromJson(Map<String, dynamic> json) => RegisterData(
        firstName: json["name"],
        lastName: json["surname"],
        email: json["login"],
        phone: json["contact"],
        city: json["city_id"],
        birthDate: json["birthday"],
        // image: json["image"],
        nickname: json["nickname"],
        password: json["password"],
        height: json["height"],
        weight: json["weight"],
        gender: json["gender"],
        badHabits: json["bad_habits[]"],
        lifeStyles: json["lifestyles[]"],
        officeWorker: json["office_worker"],
        physicalWorker: json["physical_worker"],
      );

  Map<String, dynamic> toJson() => {
        "name": firstName,
        "surname": lastName,
        "login": email,
        "contact": phone,
        "city_id": city,
        "birthday": birthDate,
        // "image" : image;
        "nickname": nickname,
        "password": password,
        "height": height,
        "weight": weight,
        "gender": gender,
        "bad_habits[]": badHabits,
        "lifestyles[]": lifeStyles,
        "office_worker": officeWorker,
        "physical_worker": physicalWorker,
      };

  @override
  String toString() {
    return 'RegisterApiRequest{name: $firstName, surname: $lastName, login: $email, contact: $phone, city_id: $city, birthday: $birthDate, nickname: $nickname, password: $password, height: $height, weight: $weight, gender: $gender, bad_habits[]: $badHabits, lifestyles[]: $lifeStyles, office_worker: $officeWorker, physical_worker: $physicalWorker}';
  }
}
