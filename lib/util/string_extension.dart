import 'dart:ui';

extension HexColor on String{
  String invertHexColor(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    int colorInt = int.parse(hexColor, radix: 16);
    int invertedColorInt = 0xFFFFFFFF - colorInt;
    String invertedColor = invertedColorInt.toRadixString(16).toUpperCase();
    return "#" + invertedColor;
  }
  //color from hex string

}