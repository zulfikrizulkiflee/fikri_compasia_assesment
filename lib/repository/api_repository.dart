import 'package:fikri_compasia_assesment/models/data_model.dart';
import 'package:fikri_compasia_assesment/providers/api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<List<Data>> fetchDataList() {
    return _provider.fetchDataList();
  }
}

class NetworkError extends Error {}