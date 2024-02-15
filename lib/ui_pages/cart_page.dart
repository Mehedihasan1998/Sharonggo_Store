import 'package:fake_store/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("Cart Page", style: myStyle1(22, Colors.white, ),),
            centerTitle: true,
            backgroundColor: appBarColor,
            surfaceTintColor: Colors.transparent,
            leading: IconButton(
                onPressed: (){
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_ios_sharp, size: 25, color: Colors.white,),),
          ),
        body: Center(
          child: Text("Cart Page", style: TextStyle(fontSize: 20),),
        )

      ),
    );
  }
}
