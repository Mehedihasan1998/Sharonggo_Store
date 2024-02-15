import 'package:fake_store/constants/constants.dart';
import 'package:fake_store/custom_widget/custom_toast.dart';
import 'package:flutter/material.dart';
class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.06,
      width: MediaQuery.of(context).size.width*0.5,
      child: FloatingActionButton(
        backgroundColor: buttonColor,
        elevation: 5,
        onPressed: (){
          print("Floating Action Button is pressed!!!!!!!!");
          cartCount++;
          showToast(context);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_shopping_cart_outlined, size: 25, color: Colors.white,),
            Text(" Add to Cart ", style: myStyle(20, Colors.white, FontWeight.bold),),
            // Icon(Icons.add_shopping_cart_outlined, size: 25, color: Colors.white,),
          ],
        ),
      ),
    );
  }

}
