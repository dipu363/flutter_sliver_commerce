import '../../core/network/dio_client.dart';

class ApiRepository {

  Future<List> getProducts() async {
    final res = await DioClient.dio.get("products");
    return res.data;
  }

  Future login(String user, String pass) async {
    final res = await DioClient.dio.post(
      "auth/login",
      data: {
        "username": user,
        "password": pass,
      },
    );

    return res.data;
  }

  Future getUser(id) async {
    final res = await DioClient.dio.get("users/$id");
    return res.data;
  }
}