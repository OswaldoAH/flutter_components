import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:examples/src/data/model/preferences_model.dart';
import 'package:examples/src/data/repositories/preferences_repository.dart';
import 'package:flutter/foundation.dart';

part 'preferences_event.dart';
part 'preferences_state.dart';

class PreferencesBloc extends Bloc<PreferencesEvent, PreferencesState> {
  PreferencesModel model;
  PreferencesRepository repo;
  PreferencesBloc({
    @required this.model,
    @required this.repo,
  }) : super(PreferencesInitial());

  @override
  Stream<PreferencesState> mapEventToState(
    PreferencesEvent event,
  ) async* {
    if (event is ChangeTheme) {
      yield InProgress();
      model.isDark = event.isDark;
      await repo.changeTheme(event.isDark);
      yield GetData(model);
    }
  }
}
