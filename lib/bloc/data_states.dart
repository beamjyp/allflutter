part of 'data_bloc.dart';

abstract class DataState {}

class DataInitialState extends DataState {}

class DataLoadedState extends DataState {
  final dynamic data;

  DataLoadedState(this.data);
}

class DataErrorState extends DataState {
  final String message;

  DataErrorState(this.message);
}
