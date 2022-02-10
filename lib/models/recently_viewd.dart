import 'package:flutter/material.dart';
import 'package:fluxstore/constants/images.dart';

class RecentlyViewed {
  String image;
  String name;
  String price;
  String? discount;
  String rating;
  String description;
  String category;

  RecentlyViewed(
      {required this.image,
      required this.name,
      required this.price,
      this.discount,
      required this.rating,
      required this.description,
      required this.category});
}

List<RecentlyViewed> recentlyViewedList = [
  RecentlyViewed(
    image: taco,
    name: "Taco Taco",
    price: "100",
    discount: "20%",
    description: "Chicken, Tomato, Onion, Cheese, Lettuce, Pickle, Mayo, Salsa",
    rating: "4.5",
    category: "Chicken",
  ),
  RecentlyViewed(
    image: burrito,
    name: '8 Layers Veggie Burrito',
    price: '100',
    rating: '4.5',
    description: 'Chicken, Tomato, Onion, Cheese, Lettuce, Pickle, Mayo, Salsa',
    category: 'Chicken',
  ),
];
