import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.black,
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Colors.purple,
  Colors.orange,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;

  AppTheme({
    this.selectedColor = 0,
  })  : assert(selectedColor >= 0, 'Invalid color index'),
        assert(selectedColor < colorList.length,
            'el ultimo color es ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
      colorSchemeSeed: colorList[selectedColor],
      appBarTheme: AppBarTheme(
        centerTitle: false,
      ));
}
