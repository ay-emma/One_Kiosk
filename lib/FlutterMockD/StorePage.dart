import 'package:flutter/material.dart';
import 'package:one_kiosk/models/loginUserModel.dart';
import 'package:one_kiosk/screens/account_page.dart';
import 'package:one_kiosk/screens/enterYourLocation.dart';
import 'package:one_kiosk/screens/login.dart';
import 'package:one_kiosk/screens/verifyAccout.dart';
import 'package:provider/provider.dart';
import 'models/pages/storeCategoriesList.dart';
import 'models/storeModel.dart';

class StorePage extends StatefulWidget {
  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  //Store greg = Store();
  var kStoreList = storesList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Consumer<LoginUserModel>(
              builder: (context, loginData, child) {
                return UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    //gradient: LinearGradient(
                    //   colors: [Color(0xFFd84801), Color(0xFFfe8b14)]
                    gradient: LinearGradient(
                        colors: [Color(0xFFd84801), Color(0xFFffbe7c)]),
                  ),
                  accountName: Text(
                    loginData.username ?? "new user",
                    style: TextStyle(color: Colors.white),
                  ),
                  accountEmail: Text(
                    loginData.password ?? "new pass",
                    style: TextStyle(color: Colors.white),
                  ),
                  currentAccountPicture: CircleAvatar(
                    child: Icon(
                      Icons.account_circle,
                      size: 70.0,
                      color: Colors.grey,
                    ),
                  ),
                );
              },
            ),
            ListTile(
              onTap: (() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              }),
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
                    width: 5.0,
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
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => CategoriesPage(),),);
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
                    width: 5.0,
                  ),
                  Text(
                    "Categories",
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
                    width: 5.0,
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
                    builder: (context) => EnterYourLocationPage(),
                  ),
                );
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
                    width: 5.0,
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
                    width: 5.0,
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
                  //_signOut();
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
                    width: 5.0,
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
                    width: 30.0,
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
            SizedBox(
              height: 45,
            ),
            InkWell(
              onTap: () {},
              child: Center(
                child: Container(
                  height: 50,
                  width: 245,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.location_city,
                          color: Colors.orange,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Home"),
                            Container(
                              child: Text(
                                "54 Demuring St.Ketu",
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(
                          Icons.expand_more,
                          color: Colors.orange,
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        width: 0.6,
                        style: BorderStyle.solid,
                        color: Colors.black12,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 1.5,
                          offset: Offset(0, 1),
                          spreadRadius: 0.5,
                        )
                      ]),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                  primary: true,
                  physics: BouncingScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  itemBuilder: (context, index) {
                    return storeCard(index);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: kStoreList.length),
            ),
          ],
        ),
      ),
    );
  }

  Container storeCard(int index) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 0.6,
            style: BorderStyle.solid,
            color: Colors.black12,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 1.5,
              offset: Offset(0, 1),
              spreadRadius: 0.5,
            )
          ]),
      child: Column(
        children: <Widget>[
          Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StoreCategoriesList(
                        name: kStoreList[index].name,
                        categoriesTags: kStoreList[index].categoriesTags,
                      ),
                    ),
                  );
                },
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.asset(
                      kStoreList[index].picture,
                      height: 100,
                      width: 450,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              )),
          Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            kStoreList[index].name,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          Spacer(),
                          for (var i = 1; i <= 5; i++)
                            i <= kStoreList[index].rateStars
                                ? Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 20,
                                  )
                                : Icon(
                                    Icons.star_border,
                                    color: Colors.orangeAccent,
                                    size: 20,
                                  ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 200,
                            child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: wrapedChips(
                                    kStoreList[index].categoriesTags)),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StoreCategoriesList(
                                            name: kStoreList[index].name,
                                            categoriesTags: kStoreList[index]
                                                .categoriesTags,
                                          )));
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(15)),
                              child: ClipPath(
                                clipper: TripeziumButton(),
                                child: Container(
                                  width: 100,
                                  height: 42,
                                  child: Center(
                                      child: Text(
                                    kStoreList[index].isOpen == true
                                        ? "    Open"
                                        : "    Closed",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  )),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                    kStoreList[index].isOpen == true
                                        ? Color(0xffFF9115)
                                        : Color(0xffFFFFFF),
                                    kStoreList[index].isOpen == true
                                        ? Color(0xffD44700)
                                        : Color(0xff808080),
                                    //Color(0xffFF9115),
                                    //Color(0xffD44700),
                                    //#FFFFFF
                                    //#808080
                                  ])),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Widget wrapedChips(List<Map<String, int>> tags) {
    List categories = tags.map((e) => e.keys).toList();

//String storeCategories = "Food Drinks Clothes Accessories Gadgets";
//List categorie = storeCategories.split(" ");
    // print("$categories");

    return Wrap(
      direction: Axis.horizontal,
      spacing: 2.0,
      runSpacing: 3.0,
      children: <Widget>[
        for (var texts in categories)
          Container(
            width: 49,
            height: 25,
            child: Center(
                child: Text(
              "$texts",

              ///8888888888888888
              style: TextStyle(fontSize: 9),
            )),
            decoration: BoxDecoration(
              border: Border.all(
                style: BorderStyle.solid,
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
          )
      ],
    );
  }
}

class TripeziumButton extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();

    path.moveTo(size.width - (size.width * 0.7), 0.0);
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
