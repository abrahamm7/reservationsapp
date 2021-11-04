import 'package:flutter/material.dart';
import 'package:reservationsapp/features/reserve_courts/presentation/pages/homePage.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(color: Colors.red),
          brightness: Brightness.dark,
          primaryColor: Colors.blueGrey),
      home: HomePage()));
}
