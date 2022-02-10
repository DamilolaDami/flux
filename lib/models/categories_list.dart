import 'package:flutter/material.dart';
import 'package:fluxstore/constants/images.dart';

class CategoriesList {
  final String title;
  final String imageUrl;
  final Color color;
  final bool isAll;

  CategoriesList({
    required this.title,
    required this.color,
    this.isAll = false,
    required this.imageUrl,
  });
}

List<CategoriesList> categories = [
  CategoriesList(
    title: 'All',
    color: Colors.white,
    isAll: true,
    imageUrl: pepper,
  ),
  CategoriesList(
    title: 'Junk Food',
    color: Colors.blue,
    isAll: false,
    imageUrl: beans,
  ),
  CategoriesList(
    title: 'Fruits',
    color: Colors.red,
    isAll: false,
    imageUrl: orange,
  ),
  CategoriesList(
    title: 'Vegetables',
    color: Colors.green,
    isAll: false,
    imageUrl: beans,
  ),
  CategoriesList(
    title: 'Dairy',
    color: Colors.yellow,
    isAll: false,
    imageUrl: pepper,
  ),
  CategoriesList(
    title: 'Beverages',
    color: Colors.orange,
    isAll: false,
    imageUrl: beans,
  ),
  CategoriesList(
    title: 'Bread',
    color: Colors.pink,
    isAll: false,
    imageUrl: beans,
  ),
  CategoriesList(
    title: 'Meat',
    color: Colors.purple,
    isAll: false,
    imageUrl: beans,
  ),
];
