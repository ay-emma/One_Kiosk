import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  String _selectedItem =  '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: "Close",
            );
          },
        ),
        elevation: debugDefaultTargetPlatformOverride == TargetPlatform.android
            ? 0.0
            : 5.0,
        title:
            Text("Stores", style: TextStyle(color: Colors.white, fontSize: 25)),
        actions: <Widget>[
          Icon(Icons.shopping_cart, color: Colors.white),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 45.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            Text(
              "Fashion",
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.grey,
              ),
            ),
            Divider(),
            Text(
              "Grocries",
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.grey,
              ),
            ),
            Divider(),
            Text(
              "Shoes",
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.grey,
              ),
            ),
            Divider(),
            Text(
              "Clothes",
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.grey,
              ),
            ),
            Divider(),
            Text(
              "Electronic",
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.grey,
              ),
            ),
            Divider(),
            RaisedButton(
              onPressed: () => _onButtonPressed(),
              child: Text("Show"),
              
               ),
               Text(
                 _selectedItem,
                 style: TextStyle( fontSize: 30 ),
               )
          ],
        ),
      ),
    );
  }

  void _onButtonPressed() {
    showModalBottomSheet(context: context, builder: (context){
      return Container(
        color: Colors.transparent,
        height: 180,
              child: Container(
          child:_buildbottomNavMenu(),
          decoration: BoxDecoration(

            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(20),
              topRight: const Radius.circular(20),
            )
          )
        ),
      );
    } );
  }

  Column _buildbottomNavMenu() {
    return Column(
      children: <Widget>[
        ListTile(
          leading : Icon(Icons.ac_unit),
          title:  Text("coding"),
          onTap: () => _selectItem("Cooling"),
        ),
        ListTile(
          leading : Icon(Icons.hot_tub),
          title:  Text("coding"),
          onTap: () => _selectItem("Hot"),
        )
      ],
    );
  }

  void _selectItem( String name ) {
    Navigator.pop(context);
    setState(() {
      _selectedItem = name;
    });
  }
}
