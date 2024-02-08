part of 'country_bloc.dart';

@immutable
abstract class CountryState {
  const CountryState();
}

class CountryStateInitial extends CountryState {}

class CountryStateLoading extends CountryState {
  @override
  List<Object?> get props => [];
}

class CountryStateLoaded extends CountryState {
  const CountryStateLoaded(this.country_dto);
  final List<CountryDto> country_dto;
}

class CountryStateError extends CountryState {
  final String? message;
  const CountryStateError(this.message);
}