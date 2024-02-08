import 'dart:core';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import '../../models/user.dart';
import '../../providers/authorization/authorization_provider.dart';

part 'authorization_event.dart';
part 'authorization_state.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  void login(String login, String password) => add(LoginEvent(login, password));
  void registration({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String city,
    required String birthDate,
    //required XFile image,
    required String nickname,
    required String password,
    required String height,
    required String weight,
    required String gender,
    required List<String> badHabits,
    required List<String> lifeStyles,
    required bool officeWorker,
    required bool physicalWorker,
  }) =>
      add(RegistrationEvent(
        firstName,
        lastName,
        email,
        phone,
        city,
        birthDate,
        //image,
        nickname,
        password,
        height,
        weight,
        gender,
        badHabits,
        lifeStyles,
        officeWorker,
        physicalWorker,
      ));

  AuthorizationBloc() : super(AuthorizationInitial()) {
    on<LoginEvent>(_login);
    on<RegistrationEvent>(_registration);
  }

  final _provider = AuthorizationProvider();

  void _login(LoginEvent event, Emitter<AuthorizationState> emit) async {
    if (event.login.isEmpty || event.password.isEmpty) {
      return emit(LoginErrorState('login_credentials_incorrect'));
    }

    emit(LoginLoadingState());
    try {
      final response = await _provider.login(event.login, event.password);

      if (response.isSuccess) {
        await _provider.storage.setToken(response.user!.token);
        emit(LoginLoadedState(response.user!));
        return;
      }
      emit(LoginErrorState(response.error ?? 'something_went_wrong'));
    } catch (e) {
      debugPrint('Login Bloc error: $e');
      emit(LoginErrorState('something_went_wrong'));
    }
  }

  void _registration(
      RegistrationEvent event, Emitter<AuthorizationState> emit) async {
    if (event.firstName.isEmpty) {
      print('name empty');
      emit(RegistrationErrorState('Username_empty'));
      return;
    }
    if (event.email.isEmpty) {
      // ||
      //     RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      //             .hasMatch(event.email) ==
      //         false) {
      emit(RegistrationErrorState('invalid_email'));
      return;
    }

    emit(RegistrationLoading());
    // return emit(RegistrationLoaded());
    try {
      final response = await _provider.registration(
        event.firstName,
        event.lastName,
        event.email,
        event.phone,
        event.city,
        event.birthDate,
        //event.image,
        event.nickname,
        event.password,
        event.height,
        event.weight,
        event.gender,
        event.badHabits,
        event.lifeStyles,
        event.officeWorker,
        event.physicalWorker,
      );
      if (response.statusCode == 201) {
        //await _provider.storage.setToken(response.user!.token);
        emit(RegistrationLoaded());
        return;
      }
      emit(RegistrationErrorState(response.error ?? 'something_went_wrong'));
    } catch (e) {
      debugPrint('RegistrationEvent error: $e');
      emit(RegistrationErrorState('something_went_wrong'));
    }
  }
}
