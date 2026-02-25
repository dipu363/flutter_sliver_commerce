import 'package:dio/dio.dart';

class DioClient {

  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://fakestoreapi.com/",
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  );
}