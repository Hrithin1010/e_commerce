import 'package:e_commerce/model/product_model.dart';
import 'package:e_commerce/provider/dataProvider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  late final ProductModel product;

  @override
  Widget build(BuildContext context) {
    var cartList = context.watch<dataProvider>().carts;

    num totalamount = 0;
    for (var item in cartList) {
      totalamount += (item.price! * item.count);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Wrap(
              children: [
                Text(
                  "Total Products- ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
                Text(
                  "${cartList.length}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                )
              ],
            ),
          )
        ],
        backgroundColor: Color.fromARGB(255, 10, 59, 99),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 600,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: cartList.length,
                    itemBuilder: (context, index) {
                      var item = cartList[index];
                      totalamount = (item.price! * item.count) + totalamount;
                      //final cart_products = cartList[index];

                      return Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Wrap(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  height: 100,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(item.image!),
                                          fit: BoxFit.cover)),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: 150,
                                        child: Text(
                                          item.title!,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "\$${item.price.toString()}",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Wrap(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.brown,
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 3, right: 3, top: 5),
                                  child: Text(
                                    "1",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  
                                ),
                                GestureDetector(
                                  onTap: () {
                                    context.read<dataProvider>().addItem(product.id.toString(),product.title.toString());
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.brown,
                                    child: Icon(Icons.add,color: Colors.white,),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(width: 3,),
                            IconButton(
                              onPressed: () {
                                context
                                    .read<dataProvider>()
                                    .removefromCart(item);
                              },
                              icon: Icon(
                                Icons.delete,
                                size: 20,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 105, 172, 226),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Total Price",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            // ${totalamount.toString()}
                            Text(
                              "${totalamount.toString()}",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Pay Now"),
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Color.fromARGB(255, 77, 208, 82))),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
