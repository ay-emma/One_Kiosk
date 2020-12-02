import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../cartModel.dart';
import '../storeModel.dart';
import '../storeModel2.dart';
import 'cartPage.dart';
import 'productDetails.dart';

class StoreCategoriesList extends StatefulWidget {
  final String name;
  final List<Map<String, int>> categoriesTags;

  // getCategoriesProduct(){

  // }

  const StoreCategoriesList(
      {Key key, @required this.name, @required this.categoriesTags})
      : super(key: key);

  @override
  _StoreCategoriesListState createState() => _StoreCategoriesListState();
}

class _StoreCategoriesListState extends State<StoreCategoriesList> {
  ///This func gets the categoreis id
  getCategoriesId() {
    List<String> a =
        widget.categoriesTags.map((e) => e.values.toString()).toList();
    //var b = a[1].substring(1, a[1].length-1 );
    //print(b);
    List b = [];
    for (var i in a) {
      b.add(int.parse(i.substring(1, i.length - 1)));
    }
    return b;
  }

  List<Categories> storeCategories4disStore() {
    List<Categories> catData = [];
    for (var i in getCategoriesId()) {
      for (var j in storeCategories) {
        if (j.id == i) {
          catData.add(j);
        }
      }
    }
    return catData;
  }

  ///gets a product list under a categoreis based on producListId
  List<Product> catProduct(int kProductListId) {
    List<Product> listOfProduct = [];
    for (var i in categoriesProduct) {
      if (i.productListId == kProductListId) {
        listOfProduct = [...i.productList];
      }
    }

    return listOfProduct;
  }

  @override
  void initState() {
    super.initState();
    print("the value" + "${getCategoriesId()}");
    // print("Store storeCategories4disStore under" + "${storeCategories4disStore()}");
    //storeCategories4disStore();
  }

  //String naira = '\u{020A6}';

  @override
  Widget build(BuildContext context) {
    //print(storeCategories4disStore().length);
    //print(storeCategories4disStore());

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.orange,
            actions: <Widget>[
              IconButton(icon: Icon(Icons.search), onPressed: () {}),
              IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartPage()));
                  }),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 20,
                  width: 30,
                  child: Consumer<CartProvider>(
                    builder: (context, cp, child) {
                      return Center(
                        child: Text("${cp.noOfProduct}"),
                      );
                    },
                  ),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.orange,
                  ),
                ),
              )
            ],
            pinned: true,
            expandedHeight: 160,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.name),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, inTdex) {
              return Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 9),
                        child: Text(
                          storeCategories4disStore()[inTdex].name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    child: GridView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(5),
                        primary: false,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 6,
                          // childAspectRatio: 1.0,
                          crossAxisSpacing: 6,
                        ),
                        itemCount: catProduct(storeCategories4disStore()[inTdex]
                                .productListId)
                            .length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 230,
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductDetails(
                                                    name: catProduct(
                                                            storeCategories4disStore()[
                                                                    inTdex]
                                                                .productListId)[index]
                                                        .name,
                                                    price: catProduct(
                                                            storeCategories4disStore()[
                                                                    inTdex]
                                                                .productListId)[index]
                                                        .price,
                                                    picture: catProduct(
                                                            storeCategories4disStore()[
                                                                    inTdex]
                                                                .productListId)[index]
                                                        .picture,
                                                    description: catProduct(
                                                            storeCategories4disStore()[
                                                                    inTdex]
                                                                .productListId)[index]
                                                        .description,
                                                  )));
                                    },
                                    child: Container(
                                        child: Image.asset(
                                      "${catProduct(storeCategories4disStore()[inTdex].productListId)[index].picture}" ==
                                              ""
                                          ? "assets/images/productImg/errorimg.png"
                                          : "${catProduct(storeCategories4disStore()[inTdex].productListId)[index].picture}",
                                      width: 200,
                                      height: 180,
                                    )),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 4, bottom: 2),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  catProduct(storeCategories4disStore()[
                                                                          inTdex]
                                                                      .productListId)[
                                                                  index]
                                                              .name
                                                              .length >=
                                                          10
                                                      ? catProduct(storeCategories4disStore()[
                                                                          inTdex]
                                                                      .productListId)[
                                                                  index]
                                                              .name
                                                              .substring(
                                                                  0, 10) +
                                                          ".."
                                                      : catProduct(storeCategories4disStore()[
                                                                      inTdex]
                                                                  .productListId)[
                                                              index]
                                                          .name,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                // Spacer(),
                                                Text(
                                                  '\u{020A6}' +
                                                      catProduct(storeCategories4disStore()[
                                                                      inTdex]
                                                                  .productListId)[
                                                              index]
                                                          .price
                                                          .toString(),
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              final CartProvider cartProvider =
                                                  Provider.of<CartProvider>(
                                                      context,
                                                      listen: false);
                                              var storeItem = StoreCartProduct(
                                                nameOfStore: widget.name,
                                                nameOfProduct: catProduct(
                                                        storeCategories4disStore()[
                                                                inTdex]
                                                            .productListId)[index]
                                                    .name,
                                                nameOfProductPrice: catProduct(
                                                        storeCategories4disStore()[
                                                                inTdex]
                                                            .productListId)[index]
                                                    .price,
                                                nameOfProductId: catProduct(
                                                        storeCategories4disStore()[
                                                                inTdex]
                                                            .productListId)[index]
                                                    .id,
                                              );
                                              cartProvider.addItem(storeItem);
                                              print("Something has been added");
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                  right: 3),
                                              height: 25,
                                              width: 25,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.orange),
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 18,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                //borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  width: 0.6,
                                  style: BorderStyle.solid,
                                  color: Colors.black12,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 1.5,
                                    offset: Offset(1, 3),
                                    spreadRadius: 0.5,
                                  )
                                ]),
                          );
                        }),
                  )
                ],
              );
            }, childCount: storeCategories4disStore().length),
          )
        ],
      ),
    );
  }
}
