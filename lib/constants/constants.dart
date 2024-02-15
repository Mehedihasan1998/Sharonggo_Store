import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// API URL
const kBaseUrl = "https://fakestoreapi.com";
const kProducts = "$kBaseUrl/products";

// Text Styles
myStyle(double fs, [Color ?clr, FontWeight ?fw,]){
  return GoogleFonts.nunito(
    fontSize: fs,
    color: clr,
    fontWeight: fw
  );
}
myStyle1(double fs, [Color ?clr, FontWeight ?fw,]){
  return GoogleFonts.lobster(
    fontSize: fs,
    color: clr,
    fontWeight: fw
  );
}

// Images
String maleAvaterImage = "https://w7.pngwing.com/pngs/7/618/png-transparent-man-illustration-avatar-icon-fashion-men-avatar-face-fashion-girl-heroes-thumbnail.png";
String shoppingImage = "https://st4.depositphotos.com/13193658/30137/i/450/depositphotos_301375510-stock-illustration-young-woman-holding-credit-card.jpg";

// Constants variables
var cartCount = 0.obs;

Color appBarColor = Colors.teal;
Color bottomNavBarColor = Colors.teal.shade500;
Color buttonColor = Color(0xffc1121f);
