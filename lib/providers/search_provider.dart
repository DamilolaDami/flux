import 'package:flutter/material.dart';

class SearchProvider with ChangeNotifier {
  String _searchText = '';

  String get searchText => _searchText;

  set searchText(String value) {
    _searchText = value;
    notifyListeners();
  }
}
