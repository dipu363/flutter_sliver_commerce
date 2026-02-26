import 'package:flutter/material.dart';
import 'package:flutter_sliver_commerce/modules/home/widgets/banner_widget.dart';
import 'package:flutter_sliver_commerce/modules/home/widgets/product_grid_widget.dart';
import 'package:flutter_sliver_commerce/modules/home/widgets/productlist.dart';
import 'package:flutter_sliver_commerce/modules/home/widgets/search_ber_widget.dart';
import 'package:flutter_sliver_commerce/modules/home/widgets/tab_bar_delegate.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child:RefreshIndicator(
          onRefresh: controller.loadProducts,
          child: NestedScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  pinned: true,
                  floating: false,
                  title: HomeSearchBar(),
                ),
                // Banner
                SliverToBoxAdapter(child: BannerWidget()),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: TabBarDelegate(
                    const TabBar(
                      tabs: [
                        Tab(text: "For You"),
                        Tab(text: "Hot Deals"),
                        Tab(text: "Free Delivery"),
                      ],
                    ),
                  ),
                ),
              ];
            },

            body: const TabBarView(
              children: [
                ProductGrid(),
                ProductGrid(),
                ProductGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}