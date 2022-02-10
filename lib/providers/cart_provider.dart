import 'package:flutter/material.dart';
import 'package:fluxstore/constants/images.dart';
import 'package:fluxstore/models/card_items.dart';
import 'package:fluxstore/theme/colors.dart';

class Cartprovider extends ChangeNotifier {
  List cartItems = [];
  get cartItemsname => cartItems;
  get cartItemsCount => cartItems.length;

  int _cartcount = 0;
  get cartlength => cartItems.length;
  int get cartcount => _cartcount;
  void increment() {
    _cartcount++;
    notifyListeners();
  }

  void decrement() {
    _cartcount--;
    notifyListeners();
  }

  void addtoCart(int count) {
    _cartcount += count;
    notifyListeners();
  }

  double get discount {
    double discount = 0;
    if (cartItems.isNotEmpty) {
      discount = cartItems.fold(0, (previousValue, element) {
        return previousValue + element.discount;
      });
    }
    return discount;
  }

  // double get cartdiscount {
  //   double discount = 0;
  //   for (var i = 0; i < cardItems.length; i++) {
  //     discount += discountt(cardItems[i].discount ?? 0);
  //   }
  //   return discount;
  // }

  void removeItem(int index) {
    cartItems.removeAt(index);
    notifyListeners();
  }

  void removeItemwithId(CardItems item) {
    cardItems.remove(item);
    notifyListeners();
  }

  addToCart(CardItems cardItem) {
    return Future.delayed(const Duration(seconds: 1), () {
      cartItems.add(cardItem);
      notifyListeners();
    });
  }

  void getCartSattus(String status) {
    if (cartItems.isEmpty) {
      status = 'Cart is Empty';
    }
  }

  sortListbyname() {
    cartItems.sort((a, b) {
      return a.title.compareTo(b.title);
    });
  }

  double get totalPrice {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.price;
    }
    return total - discount;
  }

  void clearCart() {
    cartItems.clear();
    notifyListeners();
  }

  int get count => cartItems.length;

  bool get isEmpty => cartItems.isEmpty;

  bool get isNotEmpty => cartItems.isNotEmpty;

  bool isincart(CardItems card) {
    return cartItems.contains(card);
  }
}

List<CardItems> cardItems = [
  CardItems(
    title: 'Salsa Verde - Medium',
    id: 1,
    count: 0,
    image: image3,
    color: AppColors.fbBlue,
    discount: 10,
    ingredients: [pepper, beans, orange, pepper, orange],
    about:
        'Salsa Verde is a Mexican dish made with green chilies, onions, and tomatoes. It is often served with rice, beans, or corn. It is often eaten with meat, fish, or vegetables. It is often served with rice, beans, or corn. It is often eaten with meat, fish, or vegetables.',
    cents: '.14',
    description: 'the most delicious \nsalsa verde in town',
    price: 67,
  ),
  CardItems(
    title: 'Burritto - Medium',
    discount: 15,
    id: 2,
    ingredients: [pepper, beans, orange, pepper, orange],
    description: 'the most delicious \nburrito in town',
    count: 0,
    about:
        'Burritos are a dish of corn-based stew, often mixed with beans, beans, or beans, and often topped with cheese, chili, or salsa. They are often served with rice, corn, or beans. They are often eaten with meat, fish, or vegetables. They are often served with rice, beans, or corn. They are often eaten with meat, fish, or vegetables. ',
    image: image1,
    cents: '.12',
    color: AppColors.darkBlue,
    price: 35,
  ),
  CardItems(
    title: 'Mashed Potato- Medium',
    discount: 30,
    count: 0,
    id: 3,
    ingredients: [pepper, beans, orange, pepper, orange],
    image: image2,
    description: 'the most delicious\nmashed potato in town',
    about:
        'Mashed potatoes are a dish of mashed potato, often mixed with beans, beans, or beans, and often topped with cheese, chili, or salsa. They are often served with rice, corn, or beans. They are often eaten with meat, fish, or vegetables. They are often served with rice, beans, or corn. They are often eaten with meat, fish, or vegetables. ',
    color: AppColors.lightBlue,
    cents: '.10',
    price: 56,
  ),
  CardItems(
    title: 'Rice Pudding- Medium',
    discount: 30,
    count: 0,
    id: 3,
    ingredients: [pepper, beans, orange, pepper, orange],
    image: image2,
    description: 'the most delicious\nmashed potato in town',
    about:
        'Mashed potatoes are a dish of mashed potato, often mixed with beans, beans, or beans, and often topped with cheese, chili, or salsa. They are often served with rice, corn, or beans. They are often eaten with meat, fish, or vegetables. They are often served with rice, beans, or corn. They are often eaten with meat, fish, or vegetables. ',
    color: AppColors.lightBlue,
    cents: '.10',
    price: 56,
  ),
];
