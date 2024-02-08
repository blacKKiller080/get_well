part of 'user_bloc.dart';

class UserState {
  final User? user;
  final bool isLoading;

  const UserState({this.user, this.isLoading = false});

  bool get isAuthorized => user?.token?.isNotEmpty ?? false;

  UserState copyWith({User? user, bool? isLoading}) {
    return UserState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  String toString() => 'UserState(user: $user, isLoading: $isLoading)';
}

class UserLogout extends UserState {
  UserLogout({
    super.user,
  });
}
