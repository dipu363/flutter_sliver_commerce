
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_controller.dart';
class ProductGrid extends GetView<HomeController> {

  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {

    return Obx(() => GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(8),

      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: .7,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),

      itemCount: controller.filteredProducts.length,

      itemBuilder: (_, i) {

        final p = controller.filteredProducts[i];

        return Card(
          child: Column(
            children: [

              Expanded(
                child: Image.network(p['image']),
              ),

              Padding(
                padding: const EdgeInsets.all(6),
                child: Text(
                  p['title'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              Text(
                "\$${p['price']}",
                style: const TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    ));
  }
}

