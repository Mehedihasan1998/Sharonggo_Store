import 'package:cached_network_image/cached_network_image.dart';
import 'package:fake_store/constants/constants.dart';
import 'package:fake_store/custom_widget/custom_toast.dart';
import 'package:fake_store/model/product_model.dart';
import 'package:fake_store/ui_pages/product_details.dart';
import 'package:flutter/material.dart';

class ProductCardWidget extends StatefulWidget {
  const ProductCardWidget({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  bool addFav = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 5),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetails(product: widget.product)));
        },
        child: Card(
          elevation: 5,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image.network(product.image, width: 100, height: 100,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(""),
                    InkWell(
                        onTap: (){
                          if(!addFav){
                            addFav = true;
                            setState(() {

                            });
                          }
                          else{
                            addFav = false;
                            setState(() {

                            });
                          }
                        },
                        child: addFav ? Icon(Icons.favorite, size: 28, color: buttonColor,) : Icon(Icons.favorite_outline, size: 28, color: buttonColor,)
                    )
                  ],
                ),
                Hero(
                  tag: "product${widget.product.id}",
                  child: CachedNetworkImage(
                    width: 100, height: 100,
                    imageUrl: widget.product.image,
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        CircularProgressIndicator(value: downloadProgress.progress),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                const SizedBox(height: 10,),
                Text("${widget.product.title}", maxLines: 2,),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$${widget.product.price}", style: myStyle(18, Colors.green, FontWeight.bold),),
                    InkWell(
                        onTap: (){
                          cartCount++;
                          showToast(context);
                        },
                        child: Icon(Icons.add_shopping_cart, size: 28, color: Color(0xffc1121f),)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}