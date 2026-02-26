
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final user = TextEditingController(text: "mor_2314");
    final pass = TextEditingController(text: "83r5^_");

    Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(title: Text('Login'), centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: user,
              decoration: InputDecoration(label: Text('User Name',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: pass,
              decoration: InputDecoration(label: Text('Password',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
            ),
            const SizedBox(height: 10),
            Obx(() =>
                ElevatedButton(
                  onPressed: (){
                    controller.login(user.text,pass.text);
                  },
                  child: controller.loading.value
                      ? CircularProgressIndicator()
                      : Text("Login"),
                )),
          ],

        ),
      ),
    );
  }
}