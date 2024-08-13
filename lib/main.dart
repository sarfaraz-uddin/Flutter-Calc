import 'package:calculator/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.purple,

        titleTextStyle: TextStyle(
            fontSize: 24,
            color: Colors.white
        )
    ),

  ),
  initialRoute: '/',
  routes: {
    '/' : (context) => Home(),
  },
));



