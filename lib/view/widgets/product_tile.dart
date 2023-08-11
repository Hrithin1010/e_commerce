import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:e_commerce/provider/dataProvider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;
  ProductTile(this.product); //data from api  through model & controller

  @override
  Widget build(BuildContext context) {
    var cartList = context.watch<dataProvider>().carts;
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: product.image!,
                    fit: BoxFit.cover,
                  ),
                ),
                // Positioned(child: Obx(()=>CircleAvatar(backgroundColor: Colors.white, child: IconButton(icon: product.,),)))
              ],
            ),
            const SizedBox(height: 8),
            Text(
              product.title!,
              maxLines: 2,
              style: const TextStyle(
                  fontFamily: 'avenir', fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            if (product.rating != null)
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      product.rating!.rate.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 8),
            Wrap(
              children: [
                Text('\$${product.price}',
                    style: const TextStyle(fontSize: 32, fontFamily: 'avenir')),
                ElevatedButton(
                  onPressed: () {
                    if (cartList.contains(product)) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Item already in the cart...")));
                    } else {
                      Provider.of<dataProvider>(context, listen: false)
                          .addToCart(product);
                    }

                    //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Cart()));
                  },
                  child: Text("Add to cart"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 10, 59, 99),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}






// return Card(
//   child: Container(
//       height: 200,
//       width: double.infinity,
//       clipBehavior: Clip.antiAlias,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5)
//       ),
//     child: Stack(
//         children: [
//           Positioned(
//             left: 50,
//             child: Container(
//               height: 100,
//               child: CachedNetworkImage(imageUrl: product.image!,fit: BoxFit.cover,),
//             ),
//           ),
//           Positioned(
//             top: 100,
//             child: Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: Column(
//                 children: [
//                   Text(product.title!,maxLines: 2,style: TextStyle(
//                       fontWeight: FontWeight.bold,fontSize: 15),),
//                   Text(product.description!,maxLines: 2,style: TextStyle(
//                       fontWeight: FontWeight.bold,fontSize: 10),),
//                   Text(product.category!,maxLines: 2,style: TextStyle(
//                       fontWeight: FontWeight.bold,fontSize: 10),),
//                   Text(product.rating!.rate.toString(),maxLines: 2, //Rating class object is rating so rate and count
//                     style: TextStyle(                               //can be accessed
//                       fontWeight: FontWeight.bold,fontSize: 15),),
//                 ],
//               ),
//             ),
//           ),
//
//         ],
//       )
//   ),
// );

