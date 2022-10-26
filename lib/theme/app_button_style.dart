import 'package:flutter/material.dart';

/*
Тут мы создали 2 абстрактных класса, хранящие настройки стиля кнопки.
Это очень удобно, ведь можно просто так вызвать нужный стил и работать чисто.
*/
abstract class AppButtonTextStyle {
  static const Color themeColor = Color(0xFF01b4e4);
  //-----------------------------------------------------------separated--------
  static final ButtonStyle textStyle = ButtonStyle(
    foregroundColor: MaterialStateProperty.all(themeColor),
    textStyle: MaterialStateProperty.all(
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    ),
    padding:
        MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 16.0)),
  );
}

abstract class AppButtonElevatedStyle {
  static const Color themeColor = Color(0xFF01b4e4);
  //-----------------------------------------------------------separated--------
  static final ButtonStyle elevatedStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(themeColor),
    foregroundColor: MaterialStateProperty.all(Colors.white),
    textStyle: MaterialStateProperty.all(
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    ),
    padding:
        MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 16.0)),
  );
}
