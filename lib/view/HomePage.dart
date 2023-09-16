import 'package:e_commerce/controller/controller.dart';
import 'package:e_commerce/email&pass_auth/firebaseHelper.dart';
import 'package:e_commerce/provider/dataProvider.dart';
import 'package:e_commerce/view/cartPage.dart';
import 'package:e_commerce/view/widgets/drawers.dart';
import 'package:e_commerce/view/widgets/product_tile.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:provider/provider.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

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
    var cartpage_list = context.watch<dataProvider>().carts;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF11334B),
        title: Text(
          "",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 7),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Cart()));
              },
              child: Badge(
                largeSize: 25,
                backgroundColor: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('${cartpage_list.length}'),
                    Icon(Icons.shopping_cart)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: Navdrawer(),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                //onChanged: ,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'Search',
                  prefixIcon: Icon(Icons.search),
                ),
              )),
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
                      return ProductTile(productController.productlist[index]);
                    },
                    staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
