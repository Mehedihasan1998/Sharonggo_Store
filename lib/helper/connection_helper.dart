import 'dart:convert';

import 'package:fake_store/constants/constants.dart';
import 'package:fake_store/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:quickalert/quickalert.dart';
import 'package:http/http.dart' as http;

class CustomHttpReqest{
  static Future<List<ProductModel>> getProducts(BuildContext context) async{
    try{
      var url = Uri.parse(kProducts);
      final response = await http.get(url);
      final data = jsonDecode(response.body);
      print("Data: $data");
      return data.map<ProductModel>((e) => ProductModel.fromJson(e)).toList();
    }catch(e){
      print("Error: $e");
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Oops...',
        text: 'Error. $e',
      );
      rethrow;
    }
  }
  static Future<List<String>> getProductsCategory(BuildContext context) async{
    try{
      String url = "https://fakestoreapi.com/products/categories";
      final response = await http.get(Uri.parse(url));
      final data = jsonDecode(response.body);
      print("Data: $data");
      return data.map<String>((e) => e.toString()).toList();
    }catch(e){
      print("Error: $e");
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Oops...',
        text: 'Error. $e',
      );
      rethrow;
    }
  }

  static Future<List<ProductModel>> getProductsByCategory(BuildContext context, String categoryName) async{
    try{
      String url = "https://fakestoreapi.com/products/category/$categoryName";
      final response = await http.get(Uri.parse(url));
      final data = jsonDecode(response.body);
      print("Data: $data");
      return data.map<ProductModel>((e) => ProductModel.fromJson(e)).toList();
    }catch(e){
      print("Error: $e");
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Oops...',
        text: 'Error. $e',
      );
      rethrow;
    }
  }
}