import 'package:e_commerce/service/http_service.dart';
import 'package:get/get.dart';

///this is the statemanagment class
class ProductController extends GetxController {
  //.obs is for monitoring the changes in the list and loading state
  var isLoading = true.obs;
  var productlist = [].obs;
//getting data from api and load the datas
  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await httpService.fetchProduct();
      if (products != null) {
        //here product list is observable.it is initially empty.
        productlist.value =
            products; //to add our list.value-for it is observable
      }
    } catch (e) {
      print(e);
    } finally {
      //it must be work(enthayalum work cheyyendath)
      isLoading(false); //if data loading is successful
    }
  }
}
