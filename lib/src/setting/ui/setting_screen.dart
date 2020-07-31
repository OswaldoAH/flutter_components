import 'package:examples/src/bloc/preferences_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool stateSwitch;

  @override
  void initState() {
    super.initState();
    stateSwitch = BlocProvider.of<PreferencesBloc>(context).model.isDark;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _theme(),
        ],
      ),
    );
  }

  Widget _theme() {
    return ListTile(
      title: Text('Dark Mode'),
      trailing: Switch(
        value: stateSwitch,
        onChanged: (value) {
            BlocProvider.of<PreferencesBloc>(context)
                .add(ChangeTheme(isDark: value));
          setState(() {
            stateSwitch = value;
          });
        },
      ),
      onTap: () {
          BlocProvider.of<PreferencesBloc>(context)
              .add(ChangeTheme(isDark: !stateSwitch));
        setState(() {
          stateSwitch = !stateSwitch;
        });
      },
    );
  }
}
