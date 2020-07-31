part of 'preferences_bloc.dart';

abstract class PreferencesEvent extends Equatable {
  const PreferencesEvent();
  @override
  List<Object> get props => [];
}

class ChangeTheme extends PreferencesEvent {
  final bool isDark;
  ChangeTheme({@required this.isDark});
  @override
  List<Object> get props => [isDark];
}
