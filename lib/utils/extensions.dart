import 'package:flutter/material.dart';

extension TextStyleExt on BuildContext {
  TextTheme style() {
    return Theme.of(this).textTheme;
  }

  TextStyle? h1() {
    return style().headline1;
  }

  TextStyle? h2() {
    return style().headline2;
  }

  TextStyle? h3() {
    return style().headline3;
  }

  TextStyle? h4() {
    return style().headline4;
  }

  TextStyle? h5() {
    return style().headline5;
  }

  TextStyle? bodyText1() {
    return style().bodyText1;
  }

  TextStyle? bodyText2() {
    return style().bodyText2;
  }

  TextStyle? subtitle1() {
    return style().subtitle1;
  }

  TextStyle? subtitle2() {
    return style().subtitle2;
  }
}
