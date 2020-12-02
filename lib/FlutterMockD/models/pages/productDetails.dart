import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final String name;
  final String picture;
  final double price;
  final String description;

  const ProductDetails({Key key, this.name, this.picture, this.price, this.description}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Description")),
      body: Column(
        children: <Widget>[
          // name picture price priduct Description
          Text(
            name,
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w700,
            ),
          ),
          //Image.asset("blabla"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Price"),
                Text(price.toString())
              ],
            ),
          ),
          Text("Product Description", 
           style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(description),
          /// Add to cart
          MaterialButton(
            child: Text("Add to Cart", style: TextStyle(
              color: Colors.white
            ),),
            onPressed: (){

            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              
            ),
            color: Colors.orange,
            )
        ],
      ),
    );
  }
}
