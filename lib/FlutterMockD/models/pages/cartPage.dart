import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cartModel.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Cart"),
        
      ),

      body: Column(
          children: <Widget>[
             SizedBox(
        height: 20,
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
                      Text(
                        "54 Demuring St. Ketu Lagos",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
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
            SizedBox(
        height: 8,
      ),
            Expanded(
              flex: 2,
      child: Consumer<CartProvider>(
            builder: (context, cart, child){
              return  ListView.builder(
               itemBuilder: (BuildContext context, index){
              return Container(
              color:Colors.white,
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.grey.shade100,
                    child: Padding(
                      padding: const EdgeInsets.symmetric( horizontal: 10, vertical:6  ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(cart.cartSTList[index].nameOfStore,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 24,
                            color: Colors.blueGrey,
                          ),
                          ),
                          Chip(label: Text("Price"))
                          //total price for a store should be a func
                          
                        ],
          
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      for ( var i in cart.cartSTList[index].storeCartProduct)
                          Container(
                            child: Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                               Padding(
                                 padding: const EdgeInsets.symmetric( vertical: 10, horizontal: 10  ),
                                 child: Text(i.noOfQantity.toString() + "pc"),
                               ),
                               
                                Container(
                                  decoration: BoxDecoration(
                                    border: BorderDirectional(
                                      start: BorderSide(
                                        color: Colors.grey,
                                        width: 4,
                                      )
                                    
                                    )
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                    
                                      Padding(
                                        padding: const EdgeInsets.only(left:15.0),
                                        child: Column(  
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                           Container(
                                             width: 250,
                                             child: Row(
                                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                               children: <Widget>[
                                                 Text("Qunatiyt: "+"${i.noOfQantity}"),
                                              Text( "x "+ '\u{020A6}' +i.nameOfProductPrice.toString(),style:TextStyle( 
                                              color: Colors.grey,
                                         ) ,
                                         ),
                                          ],
                                             ),
                                           ),
                                        
                                           Text(i.nameOfProduct, style:TextStyle( 
                                             fontWeight: FontWeight.bold,
                                           ),
                                           ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                
                              ],
                            ),
                          )
                    ],
                  )
                ],
              ),
            );
          },
          itemCount:cart.cartSTList.length,
          );
            }

      ),

      ),
      Expanded(
        flex: 1,
        child: Container(
          color: Colors.white38,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Consumer<CartProvider>(
              builder: (context, cart, children){
                return  Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                    Text("SubTotal", style: TextStyle( fontSize: 18, fontWeight: FontWeight.w400 ), ),

                    Text('\u{020A6}' +"${cart.subTotal}", style: TextStyle( fontSize: 18, fontWeight: FontWeight.w400 ), ),

                  ],),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                    Text("Shippng",  style: TextStyle( fontSize: 18, fontWeight: FontWeight.w400 ), ),

                    Text('\u{020A6}' +"${cart.shipping}", style: TextStyle( fontSize: 18, fontWeight: FontWeight.w400 ), ),

                  ],),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                    Text("Total", style: TextStyle( fontSize: 26, fontWeight: FontWeight.w600 ),),

                    Text('\u{020A6}' +"${cart.shipping + cart.subTotal }", style: TextStyle( fontSize: 26, fontWeight: FontWeight.w600 ), ),

                  ],),
                  
                  MaterialButton(
                    color: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      width: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text("Next", style: TextStyle( color: Colors.white), ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.arrow_forward, color: Colors.white,)
                        ],
                      ),
                    ),
                    onPressed: (){

                    }),
                  
                ],
              );
              },
                     
            ),
          ),
        ) 
      )

          ],
        ),
    );
  }
}