import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:examples/src/routes/routes.dart';
import 'package:examples/src/bloc/preferences_bloc.dart';
import 'package:examples/src/data/model/preferences_model.dart';
import 'package:examples/src/data/repositories/preferences_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final _preferences = PreferencesRepository();
  await _preferences.initPreferences();
  runApp(
    BlocProvider(
      create: (_) => PreferencesBloc(
        model: _preferences.data,
        repo: _preferences,
      ),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PreferencesModel model = context.bloc<PreferencesBloc>().model;
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      builder: (context, state) {
        if (state is GetData) {
          model = state.model;
        }
        print(state);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: model.isDark ? ThemeData.dark() : ThemeData.light(),
          title: 'App Flutter',
          initialRoute: '/',
          routes: getApplicationRoutes(),
        );
      },
    );
  }
}
