import 'package:fake_store/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CustomCart extends StatefulWidget {
  const CustomCart({super.key});

  @override
  State<CustomCart> createState() => _CustomCartState();
}

class _CustomCartState extends State<CustomCart> {
  @override
  Widget build(BuildContext context) {
    return  Stack(
      clipBehavior: Clip.none,
      children: [
        Icon(Icons.shopping_cart_outlined, size: 28,),
        Positioned(
            top: -5,
            right: -5,
            child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.deepOrange,
                ),

                child: Center(
                  child: Obx(() => Text("${cartCount}", style: myStyle(15, Colors.white, FontWeight.bold),),),
                ),
            ),
        ),
      ],
    );
  }
}
