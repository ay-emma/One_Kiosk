import 'package:flutter/cupertino.dart';

class CartStore {

  final String nameOfStore;
  final List<StoreCartProduct> storeCartProduct;
  CartStore({this.nameOfStore, this.storeCartProduct});
}
class  StoreCartProduct {
   String nameOfStore;
   String nameOfProduct;
   String nameOfPicture;
   double nameOfProductPrice;
   int nameOfProductId;
   int noOfQantity;

  StoreCartProduct({this.nameOfStore,this.nameOfPicture,  this.nameOfProduct, this.nameOfProductPrice, this.nameOfProductId, this.noOfQantity = 1});
}

class CartProvider with ChangeNotifier {
  
  List<CartStore> _cartSTList = [];

  int noOfProduct = 0;
  double subTotal = 00.0;
  double shipping = 100.0;

  //getter
  List<CartStore> get cartSTList => _cartSTList;

  void addItem( StoreCartProduct storeCartProduct ) {
    //checks the cartList
    if(_cartSTList.isEmpty){
      subTotal = subTotal + storeCartProduct.nameOfProductPrice;
      _cartSTList.add(CartStore(nameOfStore: storeCartProduct.nameOfStore, storeCartProduct: [storeCartProduct] ));
      noOfProduct = noOfProduct + 1;
    }
    else{
    for( var i in _cartSTList){
      //check if the store exiest
      if(i.nameOfStore == storeCartProduct.nameOfStore){

        //if the store exiest checks if product exist
        for( var v=0;  v<i.storeCartProduct.length; v++){

          //checks if the product have been added before
          if(storeCartProduct.nameOfProductId == i.storeCartProduct[v].nameOfProductId ){
            // if it has been there before all web do is to increase the no. of quantity

            increaseQuantity(cst:i, v:v );
            subTotal = subTotal + i.storeCartProduct[v].nameOfProductPrice;
            
            notifyListeners();
          }
          else{
            // Since there is no matching name of product we then
            // add the product in the store List [storeCartProduct]jkj
            i.storeCartProduct.add(storeCartProduct);
            subTotal = subTotal + storeCartProduct.nameOfProductPrice;
            noOfProduct = noOfProduct + 1;
            notifyListeners();

          }
        }
      }
      else{
        // The Store hasn't been created so a store will
        // be created and the product will be add to the new store
        _cartSTList.add(CartStore(nameOfStore: storeCartProduct.nameOfStore, storeCartProduct: [storeCartProduct] ));
       noOfProduct = noOfProduct + 1;
       subTotal = subTotal + storeCartProduct.nameOfProductPrice;
      }

     }

    }

    notifyListeners();
    //if(storeCartProduct.nameOfProductId )
  }

  increaseQuantity({ CartStore cst, int v  } ){
      
      cst.storeCartProduct[v].noOfQantity +=1;     
      noOfProduct = noOfProduct + 1;
      subTotal = subTotal +  cst.storeCartProduct[v].nameOfProductPrice;
      notifyListeners();
  }

  // double subTotal(){
  //   double money;

  //   for(var i in _cartSTList){

  //   }

  //   return 
  // }


  void deleteItem(StoreCartProduct storeCartProduct ){
    // CONSTRAINTS
    // # delete a product in a cart store List
    // # delete a product and the store if it is the only item in the  store list
    // # delete by substracting 1 if a product has more than two qantity

    for(var i in _cartSTList ){
      if(i.nameOfStore == storeCartProduct.nameOfStore){
        // checks if there is a matching store name

        if(i.storeCartProduct.length == 1){
         // check if the list of product is only one

          if(i.storeCartProduct.first.noOfQantity > 1 ){
            //checks if a product qantity is more than one
            // And if more than one the qantity should be reduced by one
            

            i.storeCartProduct.first.noOfQantity = i.storeCartProduct.first.noOfQantity -1;
          }
          else{
            // Else we remove the store since it has no more products in its list.
            _cartSTList.remove(i);
          }
        }
        else{
          // checks for the name of product and delete it
          for(var v in i.storeCartProduct){

            if(v.nameOfProduct == storeCartProduct.nameOfProduct){

              if(v.noOfQantity > 1){
                
                v.noOfQantity = v.noOfQantity-1;
              }
              else{
                i.storeCartProduct.remove(v);
              }
            }
          }
         
        }
      }
    }


  }

}