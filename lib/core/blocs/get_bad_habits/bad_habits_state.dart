part of 'bad_habits_bloc.dart';

@immutable
abstract class BadHabitsState {
  const BadHabitsState();
}

class BadHabitsInitial extends BadHabitsState {}

class BadHabitsLoading extends BadHabitsState {
  @override
  List<Object?> get props => [];
}

class BadHabitsLoaded extends BadHabitsState {
  const BadHabitsLoaded(this.badHabitsDto);
  final List<BadHabitsDto> badHabitsDto;
}

class BadHabitsError extends BadHabitsState {
  final String? message;
  const BadHabitsError(this.message);
}
