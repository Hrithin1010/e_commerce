import 'package:e_commerce/service/http_service.dart';

import 'package:get/get.dart';

class ProductController extends GetxController {
  var isLoading =true.obs;
  var productlist = [].obs;
  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async{
    try{
      isLoading(true);
      var products = await httpService.fetchProduct();
      if(products != null){
        productlist.value=products;
      }
    }catch(e){
      print(e);
    }finally{
      isLoading(false);
    }
  }
}