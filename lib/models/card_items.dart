import 'package:flutter/material.dart';
import 'package:fluxstore/constants/images.dart';
import 'package:fluxstore/theme/colors.dart';

class CardItems {
  final String title;
  final String image;
  final String? about;
  final double? discount;
  final int id;
  late final int count;
  final Color? color;
  final String? description;
  final List<String> ingredients;
  final int price;
  final String? cents;

  CardItems(
      {required this.title,
      required this.image,
      required this.ingredients,
      this.count = 0,
      this.discount,
      required this.id,
      this.about,
      this.color,
      this.cents,
      this.description,
      required this.price});
}
