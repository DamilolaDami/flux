import 'package:flutter/material.dart';
import 'package:fluxstore/constants/images.dart';
import 'package:fluxstore/widgets/recent_explore.dart';

class RecentExplore {
  final String? image;
  final String? name;
  final String? price;
  final String? cents;

  RecentExplore({this.image, this.name, this.price, this.cents});
}

List<RecentExplore> recentExplore = [
  RecentExplore(
    cents: '.19',
    image: dessert,
    name: 'Ice Cream Gellatto',
    price: '\$9',
  ),
  RecentExplore(
    cents: '.19',
    image: diss,
    name: 'Ice Cream Mousse',
    price: '\$11',
  ),
  RecentExplore(
    cents: '.24',
    image: shawarma,
    name: 'Shawarma Sandwich',
    price: '\$76',
  ),
  RecentExplore(
    cents: '.19',
    image: hamburger,
    name: 'Hamburger Sandwich',
    price: '\$91',
  ),
  RecentExplore(
    cents: '.19',
    image: diss,
    name: 'Ice Cream Mousse',
    price: '\$11',
  ),
  RecentExplore(
    cents: '.19',
    image: diss,
    name: 'Ice Cream Mousse',
    price: '\$11',
  ),
  RecentExplore(
    cents: '.19',
    image: diss,
    name: 'Ice Cream Mousse',
    price: '\$11',
  ),
];
