
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_controller.dart';
class ProductList extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {

    return Obx(() => ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: controller.filteredProducts.length,
      itemBuilder: (_, i) {

        final p = controller.filteredProducts[i];

        return ListTile(
          leading: Image.network(p['image'], width: 40),
          title: Text(p['title']),
          subtitle: Text("\$${p['price']}"),
        );
      },
    ));
  }
}