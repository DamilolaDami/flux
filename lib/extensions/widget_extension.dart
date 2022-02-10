import 'package:flutter/material.dart';

extension ColorExtension on Color {
  Color withOpacity(double opacity) {
    return Color.fromRGBO(
      red,
      green,
      blue,
      opacity,
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

extension StringExtension2 on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

extension BuildContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension ContainerExtension on Container {
  Container withDecoration(BoxDecoration decoration) {
    return Container(
      decoration: decoration,
      child: this,
    );
  }
}
