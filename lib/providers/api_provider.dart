import 'package:dio/dio.dart';
import 'package:fikri_compasia_assesment/models/data_model.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'https://jsonplaceholder.typicode.com/albums';

  Future<List<Data>> fetchDataList() async {
    try {
      Response response = await _dio.get(_url);
      List<Data>? result = <Data>[];

      response.data.forEach((element) {
        result.add(Data.fromJson(element));
      });

      return result;
    } catch (error) {
      return <Data>[];
    }
  }
}