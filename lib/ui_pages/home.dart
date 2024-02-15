import 'dart:convert';
import 'package:fake_store/custom_widget/product_card_widget.dart';
import 'package:fake_store/helper/connection_helper.dart';
import 'package:fake_store/model/product_model.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<ProductModel>> _fetchdata;
  late Future<List<String>> _fetchCategory;
  FocusNode focusNode1 = FocusNode();
  String _searchKeyword = "";
  final TextEditingController searchController = TextEditingController();
  List<ProductModel> listProducts = [];

  @override
  void initState() {
    _fetchdata = CustomHttpReqest.getProducts(context);
    _fetchCategory = CustomHttpReqest.getProductsCategory(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body:  listProduct(),
        ));
  }
  Widget listProduct(){
    searchController.value = TextEditingValue(
      text: _searchKeyword,
      selection: TextSelection.collapsed(offset: _searchKeyword.length),
    );
    focusNode1.requestFocus();
    return FutureBuilder<List>(
      future: Future.wait([_fetchdata, _fetchCategory]),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if(snapshot.data == null){
          return Center(
            child: Text("No Data."),
          );
        }
        if(snapshot.data!.isEmpty){
          return Center(
            child: Text("Empty."),
          );
        }
        listProducts = snapshot.data![0];
        return Column(
          children: [
            Expanded(child: GridView.builder(
              itemCount: snapshot.data![0].length,
              itemBuilder: (context, index){
                final product =  snapshot.data![0][index];
                return ProductCardWidget(product: product);
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
              ),
            ),
            ),
          ],
        );
      },
    );
  }
}


