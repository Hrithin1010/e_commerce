import 'package:e_commerce/model/product_model.dart';

import 'package:http/http.dart' as http;

class httpService {

  static Future<List<ProductModel>> fetchProduct()async {
    var responce = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    
    if(responce.statusCode == 200){
      var data = responce.body;   
      return productModelFromJson(data);
    }else{
      throw Exception();
    }
  }
}