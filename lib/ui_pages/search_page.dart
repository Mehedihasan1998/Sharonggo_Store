import 'package:fake_store/constants/constants.dart';
import 'package:fake_store/custom_widget/product_card_widget.dart';
import 'package:fake_store/helper/connection_helper.dart';
import 'package:fake_store/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late Future<List<ProductModel>> _fetchdata;
  late Future<List<String>> _fetchCategory;
  FocusNode focusNode = FocusNode();
  FocusNode focusNode1 = FocusNode();
  bool _isSearch = false;
  String _searchKeyword = "";
  final TextEditingController searchController = TextEditingController();
  List<ProductModel> _listSearchProducts = [];
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
          body: _isSearch ? listSearchProducts() : listProduct(),
        ));
  }
  Widget listProduct(){
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
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      focusNode: focusNode1,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search,),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),),
                        filled: true,
                        hintText: "Search Product",
                        fillColor: Colors.white,
                        hintStyle: myStyle(16, Colors.grey[800]),
                      ),
                      onChanged: (keyword){
                        if(keyword.isEmpty){
                          _isSearch = false;
                          setState(() {

                          });
                        }
                        if(keyword.isNotEmpty){
                          _searchKeyword = keyword;
                          _isSearch = true;
                          setState(() {

                          });
                        }
                        _listSearchProducts = listProducts
                            .where((product) => product.title.toLowerCase().contains(keyword))
                            .toList();
                      },

                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white
                    ),
                    child: IconButton(
                      onPressed: (){
                        _show(context, snapshot.data![1]);
                      },
                      icon: Icon(Icons.filter_list, size: 28, color: Color(0xff512DA8),),),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10,),
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
  Widget listSearchProducts(){
    // searchController.text = _searchKeyword;
    searchController.value = TextEditingValue(
      text: _searchKeyword,
      selection: TextSelection.collapsed(offset: _searchKeyword.length),
    );
    focusNode.requestFocus();
    return Column(
      children: [
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  focusNode: focusNode,
                  controller: searchController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),),
                    filled: true,
                    hintText: "Search Product",
                    fillColor: Colors.white,
                    hintStyle: myStyle(16, Colors.grey[800]),
                  ),
                  onChanged: (keyword){
                    if(keyword.isEmpty){
                      _isSearch = false;
                      setState(() {

                      });
                    }
                    _searchKeyword = keyword;
                    _listSearchProducts = listProducts
                        .where((product) => product.title.toLowerCase().contains(keyword))
                        .toList();
                    setState(() {

                    });
                  },

                ),
              ),
              // Container(
              //   margin: EdgeInsets.all(8),
              //   decoration: BoxDecoration(
              //       shape: BoxShape.circle,
              //       color: Colors.white
              //   ),
              //   child: IconButton(
              //     onPressed: (){
              //       _show(context, snapshot.data![1]);
              //     },
              //     icon: Icon(Icons.filter_list, size: 28, color: Colors.deepOrange,),),
              // )
            ],
          ),
        ),
        _listSearchProducts.isNotEmpty ?
        Expanded(
          child: GridView.builder(
            itemCount: _listSearchProducts.length,
            itemBuilder: (context, index){
              final product =  _listSearchProducts[index];
              return ProductCardWidget(product: product);
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
            ),
          ),
        ): Center(child: Text("No products found!!!", style: myStyle(18, Colors.white),),),
      ],
    );
  }
  void _show(BuildContext ctx, List<String> listCategory) {
    showModalBottomSheet(
        elevation: 10,
        backgroundColor: Color(0xff512DA8),
        context: ctx,
        builder: (ctx) => Container(
          alignment: Alignment.center,
          child:  ListView.builder(
            itemCount: listCategory.length,
            itemBuilder: (context, index){
              String categoryName = listCategory[index];
              return ListTile(
                onTap: () async{
                  _fetchdata =  CustomHttpReqest.getProductsByCategory(context, categoryName);
                  setState(() {
                    Get.back();
                  });
                },
                leading: Icon(Icons.category_outlined, color: Colors.redAccent, size: 30,),
                title: Text(listCategory[index].toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 20),),
              );
            },
          ),
        ));
  }
}


