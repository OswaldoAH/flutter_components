part of 'preferences_bloc.dart';

abstract class PreferencesState extends Equatable {
  const PreferencesState();
  @override
  List<Object> get props => [];
}

class PreferencesInitial extends PreferencesState {}

class InProgress extends PreferencesState{}

class GetData extends PreferencesState {
  final PreferencesModel model;

  GetData(this.model);

  List<Object> get props => [model];
}
