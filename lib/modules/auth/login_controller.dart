import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/repository/api_repository.dart';
import '../../core/routes/app_routes.dart';
import '../../utils/app_snackbear.dart';

class LoginController extends GetxController {

  final repo = ApiRepository();

  var loading = false.obs;

  Future login( String user, String pass) async {

    try {
      loading.value = true;
      await repo.login(user, pass);
      AppSnackbar.success("Login Successful");
      Get.offAllNamed(Routes.home);

    } catch (e) {
      AppSnackbar.error("Login Failed");
    } finally {
      loading.value = false;
    }

  }
}