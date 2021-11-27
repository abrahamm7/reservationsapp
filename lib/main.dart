import 'package:flutter/material.dart';
import 'package:reservationsapp/features/reserve_courts/presentation/pages/homePage.dart';
import 'package:reservationsapp/features/reserve_courts/presentation/pages/reservation_page.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(color: Colors.red),
          brightness: Brightness.light,
          primaryColor: Colors.blueGrey),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/reservations': (context) => ReservationPage()
      }));
}
