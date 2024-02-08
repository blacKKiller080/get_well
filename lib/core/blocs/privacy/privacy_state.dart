part of 'privacy_bloc.dart';

@immutable
abstract class PrivacySate {
  const PrivacySate();
}

class PrivacySateInitial extends PrivacySate {}

class PrivacySateLoading extends PrivacySate {
  @override
  List<Object?> get props => [];
}

class PrivacySateLoaded extends PrivacySate {
  const PrivacySateLoaded(this.privacy_policy_dto, this.privacyText);
  final PrivacyDto privacy_policy_dto;
  final String privacyText;
}

class PrivacySateError extends PrivacySate {
  final String? message;
  const PrivacySateError(this.message);
}
