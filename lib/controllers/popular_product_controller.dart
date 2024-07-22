import 'package:flutter/cupertino.dart';
import 'package:fooddelivery/controllers/cart_controller.dart';
import 'package:fooddelivery/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';
import 'package:fooddelivery/models/products_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItems = 0;

  int get intCartItems{
    return _inCartItems + _quantity;
  }

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();

    if (response.statusCode == 200) {
      // print("got products");
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      //  print(_popularProductList);
      //update é tipo um setState(), pra UI saber quando mudar.
      _isLoaded = true;
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(quantity - 1);
    }

    update();
  }

  int checkQuantity(int quantity) {
    if (quantity < 0) {
      Get.snackbar('Item count', "You can't reduce more!",
          backgroundColor: Color.fromARGB(185, 32, 44, 223),
          colorText: Color.fromARGB(255, 255, 255, 255));
      return 0;
    } else if (quantity > 20) {
        Get.snackbar('Item count', "You can't reduce more!",
          backgroundColor: Color.fromARGB(185, 32, 44, 223),
          colorText: Color.fromARGB(255, 255, 255, 255));
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(CartController cart,){
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
      //get from storage _inCartItems 



  }

  void addItem(ProductModel product){
      if(_quantity>0){
      _cart.addItem(product, _quantity);
      _quantity = 0;
      _cart.items.forEach((key, value) {

        print("The id is: " + value.id.toString() + " The quantity is " + value.quantity.toString());

      });

      }else{
          Get.snackbar('Item count', "You should add at least one item",
          backgroundColor: Color.fromARGB(185, 32, 44, 223),
          colorText: Color.fromARGB(255, 255, 255, 255));
      }
  }

}
