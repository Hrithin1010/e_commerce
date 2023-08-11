import 'package:device_preview/device_preview.dart';
import 'package:e_commerce/controller/controller.dart';
import 'package:e_commerce/provider/dataProvider.dart';
import 'package:e_commerce/view/cartPage.dart';
import 'package:e_commerce/view/widgets/product_tile.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:provider/provider.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context) => dataProvider(),
        child: GetMaterialApp(
          useInheritedMediaQuery: true,
          home: HomeApi(),
          debugShowCheckedModeBanner: false,
        )),
  );
}


class HomeApi extends StatelessWidget {
//object of GetX
  ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    var cartList = context.watch<dataProvider>().carts;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Products List",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 10, 61, 103),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Cart()));
            },
            child: Badge(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('${cartList.length}'),
                  Icon(Icons.shopping_cart)
                ],
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "ShopMe",
                      style: TextStyle(
                          fontFamily: "avenir",
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(
                () {
                  if (productController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return StaggeredGridView.countBuilder(
                      crossAxisCount: 2,
                      itemCount: productController.productlist.length,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      itemBuilder: (context, index) {
                        return ProductTile(
                            productController.productlist[index]);
                      },
                      staggeredTileBuilder: (index) =>
                          const StaggeredTile.fit(1),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
