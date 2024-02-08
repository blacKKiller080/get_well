import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:get_well/core/providers/authorization/authorization_provider.dart';
import '../../models/country_dto.dart';
part 'country_event.dart';
part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final AuthorizationProvider _provider;

  CountryBloc(this._provider) : super(CountryStateLoading()) {
    on<GetCountryEvent>(
      (event, emit) async {
        emit(CountryStateLoading());
        try {
          final mList = await _provider.getCountry();
          emit(CountryStateLoaded(mList));
        } catch (e) {
          emit(CountryStateError(e.toString()));
        }
      },
    );
  }
}
