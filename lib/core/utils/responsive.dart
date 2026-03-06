import 'package:flutter/material.dart';

class Responsive {
  final BuildContext context;
  late double _screenWidth;
  late double _screenHeight;
  late double _screenHorizontal;
  late double _screenVertical;

  // Figma design dimensions (update these with your actual Figma design size)
  static const double _designWidth = 430.0;
  static const double _designHeight = 932.0;

  Responsive(this.context) {
    _screenWidth = MediaQuery.sizeOf(context).width;
    _screenHeight = MediaQuery.sizeOf(context).height;
    _screenHorizontal = MediaQuery.paddingOf(context).horizontal;
    _screenVertical = MediaQuery.paddingOf(context).vertical;
  }

  /*
  * Figma Design Dimensions:
  * Design width = 430 px
  * Design height = 932 px
  * ------------------------
  * AppBar height = 80 px
  * ------------------------
  * */

  // Width percentage based on current screen
  double wp(double percent) {

    return _screenWidth * (percent / _designWidth);
  }

  // Height percentage based on current screen
  double hp(double percent) {
    return _screenHeight * percent / 100;
  }

  // Responsive width based on Figma design
  double w(double figmaWidth) => (_screenWidth / _designWidth) * figmaWidth;

  // Responsive height based on Figma design
  double h(double figmaHeight) => (_screenHeight / _designHeight) * figmaHeight;

  // Responsive font size based on Figma design width
  double sp(double figmaFontSize) => w(figmaFontSize);

  // Get scale factor for width
  double get scaleWidth => _screenWidth / _designWidth;

  // Get scale factor for height
  double get scaleHeight => _screenHeight / _designHeight;

  // Get minimum scale factor (useful for maintaining aspect ratio)
  double get scale => scaleWidth < scaleHeight ? scaleWidth : scaleHeight;

  @override
  String toString() {
    final mes =
        '----------- Responsive Data -----------\n'
        'Figma Design Dimensions => $_designWidth : $_designHeight \n'
        'Phone Screen Dimensions => $_screenWidth w : $_screenHeight h \n'
        'Get Scale Factor => $scaleWidth : $scaleHeight\n'
        'Phone Screen Aspect Ratio => ${_screenWidth / _screenHeight}';
    return mes;
  }
}
