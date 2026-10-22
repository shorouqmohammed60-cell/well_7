import 'package:flutter/material.dart';

import 'hex_color.dart';

class AppColors {
  static Color primary = HexColor('#FCC806');
  static Color secondPrimary = HexColor('#F4E07D');
  static Color darkGrey = HexColor('#DADADA');
  static Color lightGrey = HexColor('#F5F5F5');
  
  static Color textFieldColorFilled = HexColor('#F8F8F8');
  static Color hintColor = HexColor(' #747474');


  


  static Color red = HexColor('#FF0000');
  static Color black = Colors.black;
  static Color blackLite = Colors.black12;
  static Color success = Colors.green;
  static Color white = Colors.white;
  static Color error = Colors.red;
  static Color transparent = Colors.transparent;

  static Color gray = Colors.grey;
  static Color grey = HexColor('#8EA3AC');

  Color darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lightens(String color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(HexColor(color));
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}
