import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:one_kiosk/authentication/categories_page.dart';
import 'package:one_kiosk/screens/account_page.dart';
import 'package:one_kiosk/screens/storeProduct.dart';
import 'package:one_kiosk/screens/verifyAccout.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'enterYourLocation.dart';
//ketboard arrow down
//Expand more
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String storeUrl = "http://onekiosk-api.herokuapp.com/api/v1/stores";
  List data;

  @override
  void initState() {
    this.getJsonData();
    super.initState();
  }

  Future<dynamic> getJsonData() async {
    var response = await http
        .get(Uri.encodeFull(storeUrl), headers: {"Accept": "application/json"});

    print(response.body);

    setState(() {
      var converDataToJson = json.decode(response.body);
      data = converDataToJson["data"];
    });

    return "success";
    //compute(parseData, response.body);
  }

  final GoogleSignIn googleSignIn = GoogleSignIn();

  void _signOut() {
    googleSignIn.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        elevation: debugDefaultTargetPlatformOverride == TargetPlatform.android
            ? 0.0
            : 5.0,
        title:
            Text("Stores", style: TextStyle(color: Colors.white, fontSize: 25)),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              }),
          Icon(Icons.shopping_cart, color: Colors.white),

          SizedBox(
            width: 15,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                //gradient: LinearGradient(
                //   colors: [Color(0xFFd84801), Color(0xFFfe8b14)]
                gradient: LinearGradient(
                    colors: [Color(0xFFd84801), Color(0xFFffbe7c)]),
              ),
              accountName: Text(
                "Kanye West",
                style: TextStyle(color: Colors.white),
              ),
              accountEmail: Text(
                "kanyewest120@gmail.ng",
                style: TextStyle(color: Colors.white),
              ),
              currentAccountPicture: CircleAvatar(
                child: Icon(
                  Icons.account_circle,
                  size: 70.0,
                  color: Colors.grey,
                ),
              ),
            ),
            ListTile(
              onTap: (() {}),
              title: Row(
                children: <Widget>[
                  SizedBox(
                    width: 5.0,
                  ),
                  Icon(
                    Icons.store,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Stores",
                    style: TextStyle(fontSize: 20.0),
                  )
                ],
              ),
            ),
            ListTile(
              onTap: (() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Categories()));
              }),
              title: Row(
                children: <Widget>[
                  SizedBox(
                    width: 5.0,
                  ),
                  Icon(
                    Icons.category,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Categories",
                    style: TextStyle(fontSize: 20.0),
                  )
                ],
              ),
            ),
            ListTile(
              onTap: (() {}),
              title: Row(
                children: <Widget>[
                  SizedBox(
                    width: 5.0,
                  ),
                  Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Explore",
                    style: TextStyle(fontSize: 20.0),
                  )
                ],
              ),
            ),
            ListTile(
              onTap: (() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AccountPage()));
              }),
              title: Row(
                children: <Widget>[
                  SizedBox(
                    width: 5.0,
                  ),
                  Icon(
                    Icons.account_circle,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Account",
                    style: TextStyle(fontSize: 20.0),
                  )
                ],
              ),
            ),
            Divider(),
            ListTile(
              onTap: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EnterYourLocationPage()));
              }),
              title: Row(
                children: <Widget>[
                  SizedBox(
                    width: 5.0,
                  ),
                  Icon(
                    Icons.share,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Share",
                    style: TextStyle(fontSize: 20.0),
                  )
                ],
              ),
            ),
            ListTile(
              onTap: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => VerifyUser()));
                });
              },
              title: Row(
                children: <Widget>[
                  SizedBox(
                    width: 5.0,
                  ),
                  Icon(
                    Icons.feedback,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Send Feedback",
                    style: TextStyle(fontSize: 20.0),
                  )
                ],
              ),
            ),
            ListTile(
              onTap: () {
                setState(() {
                  _signOut();
                });
              },
              title: Row(
                children: <Widget>[
                  SizedBox(
                    width: 5.0,
                  ),
                  Icon(
                    Icons.all_out,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Log out",
                    style: TextStyle(fontSize: 20.0),
                  )
                ],
              ),
            ),
            ListTile(
              onTap: (() {}),
              title: Row(
                children: <Widget>[
                  SizedBox(
                    width: 45.0,
                  ),
                  //Icon(Icons.album, color: Colors.grey,),

                  Text(
                    "About OneKiosk",
                    style: TextStyle(fontSize: 20.0),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 15.0,
              ),
              child: Row(
                children: <Widget>[
                  Material(
                    child: InkWell(
                        onTap: (() {}),
                        child: Container(
                          padding: const EdgeInsets.all(11.0),
                          child: Text("Recently added stores"),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.grey[200],
                          ),
                        )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Material(
                    child: InkWell(
                        onTap: (() {}),
                        child: Container(
                          padding: const EdgeInsets.all(11.0),
                          child: Text("Top stores"),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.grey[200],
                          ),
                        )),
                  ),
                ],
              ),
            ),
            InkWell(
              child: Card(
                child: Row(
                  children: <Widget>[
                    Image.asset("images/address.png"),
                    Column(
                      children: <Widget>[
                        Text("Home"),
                        Text("54 Demuring Str. Ketu Lagos",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                         ),
                      ],
                    ),
                    Icon(Icons.expand_more)
                  ],
                ),
              ),
            ),
            // Expanded(
            //   flex: 1,
            //   child: ListView.builder(
            //       itemCount: data == null ? 0 : data.length,
            //       itemBuilder: (BuildContext context, int index) {
            //         return Container(
            //             child: Center(
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.stretch,
            //             children: <Widget>[
            //               Card(
            //                   child: Container(
            //                       child: Text(data[index]['storeName'])))
            //             ],
            //           ),
            //         ));
            //       }),
            // ),
            Expanded(

              flex: 2,
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(data.length == null ? 0 : data.length, (index) {
                  return  Container(
                    color: Colors.white,
                    height: 550,
                    child: StoreCards(
                          imagePath: data[index]["image_url"],
                          storeName: data[index]["storeName"],  //storeName
                          storeCategories: data[index]["category"],
                          openedOrclosed: data[index]["status"],
                          storePage: (){
                            print("${data[index]["vendorId"]}" );
                          }),
                  );
                 
                }),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final stores = [
    "justrigt",
    "julius Berger",
    "chi Limited",
    "chivita",
    "obasis store",
    "chees Balls",
    "dominos Pizzer",
    "devines Provicings",
    "chicken Republic",
    "oasis",
    "macdonals",
    "shoprite",
    "payless ketu",
    "payless ikorodu",
    "Mr. Bigges",
    "Olive Supermate",
    "Mendeleve Pharmacy",
    "Foto Electronics",
    "MatKey supermarket",
    "Silver and Gold supermate",
  ];

  final recentStores = [
    "Justrigt",
    "Chi Limited",
    "Dominos Pizzer",
    "Chicken Republic",
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // actions for app bar

    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Leading icon on the left of the app bar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result based on the selection
    return Container(
      height: 100,
      width: 100,
      child: Card(
        color: Colors.red,
        child: Center(child: Text(query)),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    final suggestionList = query.isEmpty
        ? recentStores
        : stores.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (contex, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.store),
        title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: [
              TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey))
            ])),
      ),
      itemCount: suggestionList.length,
    );
  }
}

//   final String imagePath;
//   final String storeName;
//   final List storeCategories;
//   final bool openedOrclosed;

class StoreCards extends StatelessWidget {
  final String imagePath;
  final String storeName;
  final String storeCategories;
  final String openedOrclosed;
  final Function storePage;

  const StoreCards(
      {Key key,
      @required this.imagePath,
      @required this.storeName,
      @required this.storeCategories,
      @required this.openedOrclosed,
      @required this.storePage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      // elevation: 7.0,
      decoration: BoxDecoration(
        color: Colors.white,
        //borderRadius: BorderRadius.circular(16),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.white60,
        //     offset: Offset.fromDirection(12),
        //     blurRadius: 3.0,
        //     spreadRadius: 3.0,
        //    ),
        //     BoxShadow(
        //     color: Colors.white60,
        //     offset: Offset.fromDirection(12),
        //     blurRadius: 3.0,
        //     spreadRadius: 3.0,
        //    )
        // ]
      ),
      height: MediaQuery.of(context).size.height* 0.4,
      width: MediaQuery.of(context).size.width* 0.45,
      child: Card(
              child: Column(
          children: <Widget>[
            Expanded(flex: 3, child: Image.network(imagePath)),
            Expanded(
              flex: 3,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 6,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(storeName, style: TextStyle( fontSize: 12, fontWeight: FontWeight.bold  ),),
                      Row(
                        children: <Widget>[
                          Icon(Icons.star),
                          Icon(Icons.star),
                          
                          
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 7,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[

                     
                          wrapedChips( storeCategories),
                      

                      // ClipPath(
                      //   clipper: TripeziumButton(),
                      //   child: Container(
                      //     width: 65,
                      //     height: 30,
                      //     color: Colors.orange,
                      //     child: Center(child: Text("    open", style: TextStyle( color: Colors.white, fontWeight: FontWeight.w600 ),)),
                      //   ),
                      // )

                    ],
                      ),
                  ),
                  SizedBox(height: 3,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => StoreProducts()  ));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.orange,
                      child: Center(
                        child: Text(
                          "Open", style: TextStyle( color: Colors.white),
                        ),
                      )
                    )
                  )
                ],
              ))
          ],
        ),
      ),
    );
  }
}


Widget wrapedChips (var storeCategories ){
List categorie = storeCategories.split(" ");
print("$categorie");

  return Wrap(
    direction: Axis.horizontal,
    spacing: 2.0,
    runSpacing: 3.0,
    children: <Widget>[
      for ( String texts in categorie )
       Container(
         width: 48,
         height: 28,
         child: Center(child: Text(texts, style: TextStyle( fontSize:9  ),)),
         decoration: BoxDecoration(
           border:Border.all(
             style: BorderStyle.solid,
             color: Colors.grey,
           ),
           borderRadius: BorderRadius.circular(20.0),
         ),
       )
    ],
  );
}


class TripeziumButton extends CustomClipper<Path> {
  @override
  getClip(Size size) {
   
   Path path = Path();

   path.moveTo(size.width - (size.width * 0.7), 0.0 );
   path.lineTo(0, size.height);
   path.lineTo(size.width, size.height);
   path.lineTo(size.width, 0);
   path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    
    return false;
  }

}