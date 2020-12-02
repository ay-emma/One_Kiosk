

class ProductList {
  final int productListId;
  final List<Product> productList;

  ProductList({this.productListId, this.productList});
}

class Product {
  final int id;
  final String name;
  final double price;
  final String description;
  final String picture;

  Product({this.id, this.name, this.price, this.description, this.picture});
}




List<ProductList> categoriesProduct = [
  ProductList(
    productListId: 250,
    productList: [
      //Accessories
      Product(
        id: 1,
        name: "Infinix Charger",
        price: 800.0,
        description: "A 4000mh infinix charger with the capability of charging 2 different phones at the same time",
        picture: "assets/images/productImg/infinix-charger.jpg",
      ),
      Product(
        id: 2,
        name: "Head phone",
        price: 7500.0,
        description: "A sony head phone with the support for radio, bluthoot, memory card and a wire jack. It has a long lasting battery of 6 hours non stop listening to music. It can also be used to recieve incoming calls",
        picture : "assets/images/productImg/headphne.jpg",
      ),
      Product(
        id: 3,
        name: "Power Bank",
        price: 4800.0,
        description: "A 12000mh mediatic power bank with the capability of charging 4 different phones at the same time and also has a touch light which can last for 5 hours"
        ,picture : "assets/images/productImg/powerbank.jpg",
      ),
      Product(
        id: 4,
        name: "Ear Pods",
        price: 5000.0,
        description: " Thrub's light weight ear pods are the best ear pods which have a long lasting bat " 
        ,picture : "",
      ),
      Product(
        id: 5,
        name: "Ear Piece",
        price: 1000.0,
        description: " Thrub's light weight ear piece are the best ear piece which are tough to destroy " 
        ,picture : "assets/images/productImg/ear piece.jpg",
      ),
      Product(
        id: 6,
        name: "500Gb Hard Drive",
        price: 15000.0,
        description: " Seagate's 500Gb hard drive strong lasting hard drive which have a low latance time. ", 
        picture : "",
      ),
      Product(
        id: 7,
        name: "16 Gb Flash Drive",
        price: 1000.0,
        description: " Thrub's light weight ear piece are the best ear piece which are tough to destroy " 
        ,picture : "assets/images/productImg/flash drive.jpg",
      ),
    
    ]
  ),
//###################################################
  ProductList(
    productListId: 3888,
    productList: [
      //Drinks
      Product(
        id: 1,
        name: "Fanta",
        price: 100.0,
        description: "A very sweet yellow drink made by fanta company"
        ,picture : "assets/images/productImg/fanta.png",
      ),
      Product(
        id: 2,
        name: "Coke Zero",
        price: 100.0,
        description: " A sweet black coke made by coca-cola company Ltd. Best served chiled",
        picture : "",
      ),
      Product(
        id: 3,
        name: "Peppsi",
        price: 100.0,
        description: " A sweet black Peppsi made by coca-cola company Ltd. Best served chiled",
        picture : "assets/images/productImg/pepsi.jpg",
      ),
      Product(
        id: 4,
        name: "La' Casera",
        price: 100.0,
        description: " A sweet orang color drink made by La' Casera company Ltd. Best served chiled",
        picture : "",
      ),
      Product(
        id: 5,
        name: "Bigi Cola",
        price: 100.0,
        description: " A sweet black Bigi drink made by Bigi company Ltd. Best served chiled",
        picture : "assets/images/productImg/bigi_drink.png",
      ),
      Product(
        id: 6,
        name: "Bigi orange",
        price: 100.0,
        description: " A sweet orange Bigi drink made by Bigi company Ltd. Best served chiled",
        picture : "assets/images/productImg/bigi_drink.png",
      ),
      Product(
        id: 7,
        name: "Bigi appel",
        price: 100.0,
        description: " A sweet  Bigi drink made by Bigi company Ltd. Best served chiled",
        picture : "assets/images/productImg/bigi_drink.png",
      ),
      Product(
        id: 8,
        name: "Bigi Appinapel",
        price: 100.0,
        description: " A sweet Bigi drink made by Bigi company Ltd. Best served chiled",
        picture : "assets/images/productImg/bigi_drink.png",
      ),
      Product(
        id: 9,
        name: "Monstar",
        price: 800.0,
        description: " A sweet Monster drink made by Brownee company Ltd. Best served chiled",
        picture : "assets/images/productImg/monstar.jpg",
      ),
      Product(
        id: 10,
        name: "Vi-Ju",
        price: 200.0,
        description: " A sweet Vi-Ju drink made by Brownee company Ltd. Best served chiled",
        picture : "",
      ),
       Product(
        id: 11,
        name: "Chi-Vita",
        price: 600.0,
        description: " A sweet Chi-Vita drink made by Chi Ltd. Best served chiled",
        picture : "assets/images/productImg/chivita.jpg",
      ),
      
      
      
    ]
  ),

  
//###################################################
  ProductList(
    productListId: 309,
    productList: [
      //Groceries
      Product(
        id: 1,
        name: "Semovita",
        price: 450.0,
        description: "A very sweet yellow drink made by dangote company"
        ,picture : "",
      ),
      Product(
        id: 2,
        name: "Indomie",
        price: 80.0,
        description: " A good product",
        picture : "assets/images/productImg/indomie.jpg",
      ),
      Product(
        id: 3,
        name: "Golden Morn",
        price: 900.0,
        description: " A good products",
        picture : "",
        //"assets/images/productImg/golden-morn.jpg",
      ),
      Product(
        id: 4,
        name: "Conflaks",
        price: 750.0,
        description: " A good product",
        picture : "assets/images/productImg/conflakes.jpg",
      ),
      Product(
        id: 5,
        name: "Dangote Sugar",
        price: 400.0,
        description: " A good product",
        picture : "",
      ),
      Product(
        id: 6,
        name: "Salt",
        price: 70.0,
        description: " A good product",
        picture : "",
      ),
      Product(
        id: 7,
        name: "Peak Milk",
        price: 250.0,
        description: " A sweet  Bigi drink made by Bigi company Ltd. Best served chiled",
        picture : "assets/images/productImg/peak_milk.jpg",
      ),
      Product(
        id: 8,
        name: "Milo",
        price: 50.0,
        description: " A good product",
        picture : "assets/images/productImg/milo.jpg",
      ),
      Product(
        id: 9,
        name: "chocolate",
        price: 800.0,
        description: " A good product",
        picture : "",
      ),
      Product(
        id: 10,
        name: "Sardine",
        price: 300.0,
        description: "A good product",
        picture : "assets/images/productImg/sardin.jpg",
      ),
       Product(
        id: 11,
        name: "Tin Tomatoes",
        price: 200.0,
        description: "  A good product",
        picture : "assets/images/productImg/gino-tin-tomatoes-.jpg",
      ),
      Product(
        id: 12,
        name: "Curstard",
        price: 600.0,
        description: " A good product",
        picture : "",
      ),
      
      
      
    ]
  ),

    
//###################################################
  ProductList(
    productListId: 88,
    productList: [
      //toiletres
      Product(
        id: 1,
        name: "Hapic",
        price: 450.0,
        description: "A very sweet yellow drink made by fanta company"
        ,picture : "assets/images/productImg/hapic.jpg",
      ),
      Product(
        id: 2,
        name: "Hypo",
        price: 80.0,
        description: " A good product",

        picture : "assets/images/productImg/hypo.jpg",
      ),
      Product(
        id: 3,
        name: "Tissue Paper",
        price: 200.0,
        description: " A good product",

        picture : "assets/images/productImg/tissue paper.jpg",
      ),
      Product(
        id: 4,
        name: "Air Freshner",
        price: 750.0,
        description: " A good product",

        picture :"assets/images/productImg/air freshner.jpg",
      ),
      
    ]
  ),

  
//###################################################
  ProductList(
    productListId: 580,
    productList: [
      //Costmetics
      Product(
        id: 1,
        name: "Damatol",
        price: 350.0,
        description: "A very sweet yellow drink made by fanta company"
        ,picture : "assets/images/productImg/damatol.jpg",
      ),
      Product(
        id: 2,
        name: "Deodorant",
        price: 1000.0,
        description: " A good product",

        picture : "assets/images/productImg/deodorant.jpg",
      ),
      Product(
        id: 3,
        name: "Face Powder",
        price: 600.0,
        description: " A good product",

        picture : "assets/images/productImg/face powder.jpg",
      ),
      
    ]
  ),

  
//###################################################
  ProductList(
    productListId: 299,
    productList: [
      //Shoes
      Product(
        id: 1,
        name: "Air max",
        price: 12000.0,
        description: "A very good product"
        ,picture : "assets/images/productImg/air max.jpg",
      ),
      Product(
        id: 2,
        name: "Addidas",
        price: 9000.0,
        description: " A good product",

        picture : "assets/images/productImg/adidas shoe.jpg",
      ),
      Product(
        id: 3,
        name: "Lambda",
        price: 6700.0,
        description: " A good product",

        picture : "",
      ),
      Product(
        id: 4,
        name: "Fendi",
        price: 8000.0,
        description: " A good product",

        picture : "assets/images/productImg/fendi shoe.jpg",
      ),
    ]
  )



];
