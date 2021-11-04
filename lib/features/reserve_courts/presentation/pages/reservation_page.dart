import 'package:flutter/material.dart';

class ReservationPage extends StatefulWidget {
  ReservationPage({Key? key}) : super(key: key);

  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agendar cancha'),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(children: <Widget>[]),
        ),
      ),
    );
  }
}
