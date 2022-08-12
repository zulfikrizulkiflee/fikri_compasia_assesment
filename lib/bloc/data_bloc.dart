// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fikri_compasia_assesment/models/data_model.dart';
import 'package:fikri_compasia_assesment/repository/api_repository.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(DataInitial()) {
    final ApiRepository apiRepository = ApiRepository();

    on<LoadData>((event, emit) async {
      final response = await apiRepository.fetchDataList();
      if (response.isEmpty) {
        emit(const DataError(message: 'Something went wrong!'));
      } else {
        emit(DataLoaded(data: response));
      }
    });
  }
}
