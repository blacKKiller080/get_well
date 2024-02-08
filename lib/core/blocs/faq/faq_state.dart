part of 'faq_bloc.dart';

@immutable
abstract class FaqState {
  const FaqState();
}

class FaqStateInitial extends FaqState {}

class FaqStateLoading extends FaqState {
  @override
  List<Object?> get props => [];
}

class FaqStateLoaded extends FaqState {
  const FaqStateLoaded(this.faq_dto);
  final List<FAQsDto> faq_dto;
}

class FaqStateError extends FaqState {
  final String? message;
  const FaqStateError(this.message);
}
