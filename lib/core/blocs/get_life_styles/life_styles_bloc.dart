import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:get_well/core/providers/authorization/authorization_provider.dart';
import '../../models/lifestyles_dto.dart';

part 'life_styles_event.dart';
part 'life_styles_state.dart';

class LifeStylesBloc extends Bloc<LifeStylesEvent, LifeStylesState> {
  final AuthorizationProvider _provider;

  LifeStylesBloc(this._provider) : super(LifeStylesLoading()) {
    on<GetLifeStylesEvent>(
      (event, emit) async {
        emit(LifeStylesLoading());
        try {
          final mList = await _provider.getLifeStyles();
          emit(LifeStylesLoaded(mList));
        } catch (e) {
          emit(LifeStylesError(e.toString()));
        }
      },
    );
  }
}
