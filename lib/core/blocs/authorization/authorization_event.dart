part of 'authorization_bloc.dart';

@immutable
abstract class AuthorizationEvent {}

class LoginEvent extends AuthorizationEvent {
  final String login;
  final String password;
  LoginEvent(this.login, this.password);
}

class RegistrationEvent extends AuthorizationEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String city;
  final String birthDate;
  // final XFile image;
  final String nickname;
  final String password;
  final String height;
  final String weight;
  final String gender;
  final List<String> badHabits;
  final List<String> lifeStyles;
  final bool officeWorker;
  final bool physicalWorker;

  RegistrationEvent(
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.city,
    this.birthDate,
    //this.image,
    this.nickname,
    this.password,
    this.height,
    this.weight,
    this.gender,
    this.badHabits,
    this.lifeStyles,
    this.officeWorker,
    this.physicalWorker,
  );
}
