import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:get_well/core/models/faq_dto.dart';
import 'package:get_well/core/providers/authorization/authorization_provider.dart';
part 'faq_event.dart';
part 'faq_state.dart';

class FAQBloc extends Bloc<FaqEvent, FaqState> {
  final AuthorizationProvider _provider;

  FAQBloc(this._provider) : super(FaqStateLoading()) {
    on<GetFaqEvent>(
      (event, emit) async {
        emit(FaqStateLoading());
        try {
          final mList = await _provider.getFAQ();
          emit(FaqStateLoaded(mList));
        } catch (e) {
          emit(FaqStateError(e.toString()));
        }
      },
    );
  }
}
