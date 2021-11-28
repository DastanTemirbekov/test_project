import 'package:dio/dio.dart';

class ApiRequester {
  static String url = "https://jsonplaceholder.typicode.com/todos/1";

  Future<Dio> initDio() async {
    return Dio(BaseOptions(
      baseUrl: url,
      responseType: ResponseType.json,
      receiveTimeout: 10000,
      connectTimeout: 10000,
    ));
  }

  Future<Response> toGet(String url, {Map<String, dynamic>? param}) async {
    Dio dio = await initDio();
    try {
      return dio.get(url, queryParameters: param);
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
