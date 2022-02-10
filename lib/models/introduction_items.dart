import 'package:flutter/material.dart';
import 'package:fluxstore/constants/images.dart';

class IntoductionItem {
  final String title;
  final String description;
  final bool isLast;
  final String imageUrl;
  final Color color;

  IntoductionItem(
      {required this.color,
      required this.title,
      required this.isLast,
      required this.description,
      required this.imageUrl});
}

List<IntoductionItem> introductionItem = [
  IntoductionItem(
      title: 'Get Reccommend',
      color: Colors.blue,
      isLast: false,
      description:
          'Get the best food reccomendations according to your preferences',
      imageUrl: image2),
  IntoductionItem(
      color: Colors.cyanAccent,
      title: 'Worry Less',
      isLast: false,
      description:
          'We will not send you notifications if you are not in the mood',
      imageUrl: image1),
  IntoductionItem(
      color: Colors.pink,
      title: 'Get Started',
      isLast: true,
      description:
          'Get started by adding your preferences and enjoy the best food',
      imageUrl: image3),
];
