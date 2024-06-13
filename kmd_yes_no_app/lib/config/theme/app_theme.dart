import 'package:flutter/material.dart';

//Un tema a partir de un color hexadecimal

const Color _customColor = Color(0xFF3F0049);


//Lista de temas predefinidos
const List<Color> _colorThemes = [
  _customColor,
  Colors.pinkAccent,
  Colors.blueAccent,
  Colors.greenAccent,
  Colors.purpleAccent,
  Colors.orangeAccent,
  Colors.blueGrey
];

class AppTheme{

  final int selectedColor;

  AppTheme({
    this.selectedColor = 0,
  }) : assert (
    selectedColor >= 0 && selectedColor < _colorThemes.length -1,
    'El color se debe encontrar entre 0 y ${_colorThemes.length -1}'
  );

  ThemeData theme() {
    return ThemeData(
      colorSchemeSeed: _colorThemes[selectedColor],
      //brightness: Brightness.dark
    );
  }


}