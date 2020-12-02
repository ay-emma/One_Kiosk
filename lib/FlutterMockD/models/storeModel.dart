///What is means to be a store 
///####################
///store id
///Store name
///Store picture
///store rate stars
///store location
///store open or close
///Store has a list of Categoreis and also a filter tags of available categories
///store has a list of products within a categores
///
///what does it mean to be a categore
///###############################
///categore has name
///categore has a list of products
///
///what does it mean to be a product
///#############################
///product are under a particula categories
///product have an id
///product name
///product have a price
///product have a description
///
///What does it mean to be cart
///################################
///cart has a store from which selected products are from
///cart has a list of products under a store
///cart has products with name price picture and number of qantity
///cart has a list of stores from which products were selected
///cart has total things bought at a store level
///cart has total thing bought from each stores
///

class Store {
  final int id;
  final String name;
  final String picture;
  final int rateStars;
  final String location;
  final bool isOpen;
  final List<Map<String, int>> categoriesTags;
  // => [{"food": 4893892},{"clothes": 692}]
  Store({this.id, this.name, this.picture, this.rateStars, this.location, this.isOpen, this.categoriesTags});

}

class Categories {
  final int id;
  final String name;
  final productListId;

  Categories({this.id, this.name, this.productListId});

}


List<Store>  storesList = [
  Store(
    id: 1,
    name: "Payless",
    picture: "assets/images/storeimg/payless.png",
    rateStars: 4,
    location: "Behind Dominos pizza shangesha ketu lagos",
    isOpen: true,
    categoriesTags:[{"Drinks": 3888},{"Groceries": 309}, {"toiletres": 88},{"Costmetics": 580} ] 
  ),
  Store(
    id: 2,
    name: "Buy for Less",
    picture: "assets/images/storeimg/buy_for_less.png",
    rateStars: 3,
    location: "18th Demurin Street ketu lagos",
    isOpen: true,
    categoriesTags:[{"Drinks": 3888},{"Groceries": 309}, {"toiletres": 88},] 
  ),
  Store(
    id: 3,
    name: "Shoprite",
    picture: "assets/images/storeimg/shoprite.png",
    rateStars: 4,
    location: "18th Demurin Street ketu lagos",
    isOpen: true,
    categoriesTags:[{"Drinks": 3888},{"Groceries": 309}, {"toiletres": 88},{"Accessories": 250},{"Shoes": 299},{"Costmetics": 580}] 
  ),
  Store(
    id: 4,
    name: "Supermart",
    picture: "assets/images/storeimg/supermart.png",
    rateStars: 3,
    location: "18th Demurin Street ketu lagos",
    isOpen: true,
    categoriesTags:[{"Drinks": 3888},{"Groceries": 309}, {"toiletres": 88},{"Accessories": 250},{"Shoes": 299}] 
  ),
  Store(
    id: 5,
    name: "Supersaver",
    picture: "assets/images/storeimg/supersaver.png",
    rateStars: 2,
    location: "Behind Dominos pizza shangesha ketu lagos",
    isOpen: false,
    categoriesTags:[{"Drinks": 3888},{"Groceries": 309}, {"toiletres": 88},{"Costmetics": 580} ] 
  ),
];

List<Categories> storeCategories = [
  Categories(
    id: 309,
    name: "Groceries",
    productListId: 309,
  ),
  Categories(
    id: 3888,
    name: "Drinks",
    productListId: 3888,
  ),
  Categories(
    id: 88,
    name: "toiletres",
    productListId: 88,
  ),
  Categories(
    id: 580,
    name: "Costmetics",
    productListId: 580,
  ),
  Categories(
    id: 250,
    name: "Accessories",
    productListId: 250,
  ),
  
];
