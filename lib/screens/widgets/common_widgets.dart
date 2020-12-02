import 'package:flutter/material.dart';
import 'package:one_kiosk/screens/storeProduct.dart';

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
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.white60,
              offset: Offset.fromDirection(12),
              blurRadius: 3.0,
              spreadRadius: 3.0,
            ),
            BoxShadow(
              color: Colors.white60,
              offset: Offset.fromDirection(12),
              blurRadius: 3.0,
              spreadRadius: 3.0,
            )
          ]),
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width * 0.45,
      child: Card(
        child: Column(
          children: <Widget>[
            Expanded(flex: 3, child: Image.network(imagePath)),
            Expanded(
                flex: 3,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          storeName,
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(Icons.star),
                            Icon(Icons.star),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          wrapedChips(storeCategories),

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
                    SizedBox(
                      height: 3,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StoreProducts()));
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.orange,
                            child: Center(
                              child: Text(
                                "Open",
                                style: TextStyle(color: Colors.white),
                              ),
                            )))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

Widget wrapedChips(var storeCategories) {
  List categorie = storeCategories.split(" ");
  print("$categorie");

  return Wrap(
    direction: Axis.horizontal,
    spacing: 2.0,
    runSpacing: 3.0,
    children: <Widget>[
      for (String texts in categorie)
        Container(
          width: 48,
          height: 28,
          child: Center(
              child: Text(
            texts,
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

class OrangeButton extends StatelessWidget {

  final String btnName;
  final Function onPressed;

  OrangeButton({this.btnName, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: InkWell(
      onTap: onPressed,

      child: Container(
        height: 50.0,
        width: 280.0,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey[100],
                offset: Offset(0, 6),
              ),
            ],
            gradient:
                LinearGradient(colors: [Color(0xFFd84801), Color(0xFFfe8b14)]),
            color: Colors.orange,
            borderRadius: BorderRadius.circular(
              10.0,
            )),
        child: Center(
          child: Text(
            btnName,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ));
  }
}


void showmybottomsheets(BuildContext context, String errMsg){
  showModalBottomSheet(context: context, builder: (context){
           return Container(
             height: 300,
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(20),
              topRight: const Radius.circular(20),
              ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Image.asset("images/exclamation-mark.png", 
                height: 120,
                width: 120,
                ),
                Text("!Oops", style: TextStyle(fontSize:30, fontWeight: FontWeight.bold) ),
                SizedBox(
                  height: 15,
                ),
                Text( errMsg, style: TextStyle(fontSize:20, fontWeight: FontWeight.w500))
            ],
                ),
              ),
            ),
           );
         }  );
}