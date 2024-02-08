part of 'life_styles_bloc.dart';

@immutable
abstract class LifeStylesState {
  const LifeStylesState();
}

class LifeStylesInitial extends LifeStylesState {}

class LifeStylesLoading extends LifeStylesState {
  @override
  List<Object?> get props => [];
}

class LifeStylesLoaded extends LifeStylesState {
  const LifeStylesLoaded(this.lifeStylesDto);
  final List<LifeStylesDto> lifeStylesDto;
}

class LifeStylesError extends LifeStylesState {
  final String? message;
  const LifeStylesError(this.message);
}
