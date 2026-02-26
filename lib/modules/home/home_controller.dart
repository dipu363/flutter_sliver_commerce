import 'package:get/get.dart';
import '../../data/repository/api_repository.dart';

class HomeController extends GetxController {

  final repo = ApiRepository();
  /// Original products
  var products = [].obs;
  var loading = true.obs;
  /// Filtered list shown in UI
  var filteredProducts = [].obs;
  /// search text
  var searchQuery = "".obs;
  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  Future loadProducts() async {
    loading.value = true;

    final data = await repo.getProducts();

    products.value = data;
    filteredProducts.value = data;

    loading.value = false;
  }

  ///FILTER FUNCTION
  void filterProducts(String query) {

    searchQuery.value = query;

    if (query.isEmpty) {
      filteredProducts.value = products;
      return;
    }

    filteredProducts.value = products
        .where((p) =>
        p['title']
            .toString()
            .toLowerCase()
            .contains(query.toLowerCase()))
        .toList();
  }
}