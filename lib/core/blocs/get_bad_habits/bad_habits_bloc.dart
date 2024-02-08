import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:get_well/core/providers/authorization/authorization_provider.dart';
import '../../models/bad_habits_dto.dart';
part 'bad_habits_event.dart';
part 'bad_habits_state.dart';

class BadHabitsBloc extends Bloc<BadHabitsEvent, BadHabitsState> {
  final AuthorizationProvider _provider;

  BadHabitsBloc(this._provider) : super(BadHabitsLoading()) {
    on<GetBadHabitsEvent>(
      (event, emit) async {
        emit(BadHabitsLoading());
        try {
          final mList = await _provider.getBadHabits();
          emit(BadHabitsLoaded(mList));
        } catch (e) {
          emit(BadHabitsError(e.toString()));
        }
      },
    );
  }
}
