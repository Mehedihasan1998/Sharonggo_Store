import 'package:cached_network_image/cached_network_image.dart';
import 'package:fake_store/constants/constants.dart';
import 'package:fake_store/custom_widget/custom_cart.dart';
import 'package:fake_store/custom_widget/floating_action_button.dart';
import 'package:fake_store/model/product_model.dart';
import 'package:fake_store/ui_pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key, required this.product}) : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: appBarColor,
            title: Text("Product Page", style: myStyle1(22, Colors.white),),
            centerTitle: true,
            leading: IconButton(
                onPressed: (){
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_ios_sharp, size: 25, color: Colors.white,)),
            actions: [
              InkWell(
                  onTap: (){
                    Get.to(CartPage(), transition: Transition.rightToLeft);
                  },
                  child: CustomCart()
              ),
              const SizedBox(width: 8,)
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Hero(
                  tag: "product${product.id}",
                  child: CachedNetworkImage(
                    height: MediaQuery.of(context).size.height*0.4,
                    width:  MediaQuery.of(context).size.width*1,
                    imageUrl: product.image,
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        CircularProgressIndicator(value: downloadProgress.progress),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.withOpacity(0.2),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      )
                      // borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                      // padding: const EdgeInsets.all(20),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(("${product.title}"),style: myStyle(22, Colors.black, FontWeight.bold),),
                            const SizedBox(height: 8,),
                            Text(("\$ ${product.price}"),style: myStyle(20, Colors.green, FontWeight.bold),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.category_outlined, color: Colors.redAccent,),
                                    Text((" ${product.category}".toUpperCase()),style: myStyle(18, Colors.black, FontWeight.bold),),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.deepOrange, size: 30,),
                                    Text((" ${product.rating.rate}"),style: myStyle(18, Colors.black, FontWeight.bold),),
                                  ],
                                ),
                              ],
                            ),
                            
                            const SizedBox(height: 15,),
                            Text(("${product.description}"),style: myStyle(16, Colors.black, ),),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: CustomFloatingActionButton(),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    ));
  }
}
