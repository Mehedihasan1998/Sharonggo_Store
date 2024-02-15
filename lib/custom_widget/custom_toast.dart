import 'package:fake_store/constants/constants.dart';
import 'package:flutter/material.dart';
void showToast(BuildContext context) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: const Text('Added to Cart'),
      action: SnackBarAction(label: 'UNDO', onPressed: (){
        cartCount--;
        scaffold.hideCurrentSnackBar;
      }),
    ),
  );
}