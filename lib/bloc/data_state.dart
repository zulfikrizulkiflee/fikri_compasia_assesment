part of 'data_bloc.dart';

abstract class DataState extends Equatable {
  const DataState();

  @override
  List<Object> get props => [];
}

class DataInitial extends DataState {}

class DataLoaded extends DataState {
  final List<Data> data;

  const DataLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

class DataError extends DataState {
  final String? message;

  const DataError({required this.message});
}
