import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:get_well/core/models/privacy_policy_dto.dart';
import 'package:get_well/core/providers/authorization/authorization_provider.dart';
part 'privacy_event.dart';
part 'privacy_state.dart';

class PrivacyBloc extends Bloc<PrivacyEvent, PrivacySate> {
  final AuthorizationProvider _provider;

  PrivacyBloc(this._provider) : super(PrivacySateLoading()) {
    on<GetPrivacyEvent>(
      (event, emit) async {
        emit(PrivacySateLoading());
        try {
          final mList = await _provider.getPrivacyPolicy();
          final privacyText = await _provider.getDataFromUrl(mList);
          emit(PrivacySateLoaded(mList, privacyText));
        } catch (e) {
          emit(PrivacySateError(e.toString()));
        }
      },
    );
  }
}
