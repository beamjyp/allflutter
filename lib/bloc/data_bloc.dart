import 'package:allflutter/repo/data_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'data_event.dart';
part 'data_states.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  final DataRepository dataRepository;

  DataBloc(this.dataRepository) : super(DataInitialState()) {
    on<FetchDataEvent>((event, emit) async {
      try {
        final data = await dataRepository.fetchData();
        emit(DataLoadedState(data));
      } catch (e) {
        emit(DataErrorState("Failed to fetch data"));
      }
    });
  }
}
