import 'package:get/get.dart';
import 'package:get_x_ripples_code_tut/projects/basics/models/product.dart';
import 'package:get_x_ripples_code_tut/projects/basics/services/api_service.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await ApiService.fetchProducts();
      if (products != null) {
        productList.assignAll(products);
      }
    } finally {
      isLoading(false);
    }
  }
}
