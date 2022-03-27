import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_ripples_code_tut/projects/basics/controllers/product_controller.dart';

class ProductListView extends StatelessWidget {
  ProductListView({Key? key}) : super(key: key);

  static String routeName = '/products';

  final ProductController _productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: Obx(() {
        if (_productController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
              itemCount: _productController.productList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          margin: EdgeInsets.fromLTRB(16, 8, 8, 8),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                _productController.productList[index].imageLink,
                                width: 150,
                                height: 100,
                                fit: BoxFit.fill,
                              )),
                        ),
                        Column(
                          children: [
                            Text(_productController.productList[index].name),
                            Text(_productController.productList[index].brand),
                          ],
                        )
                      ],
                    ),
                  ],
                );
              });
        }
      }),
    );
  }
}
