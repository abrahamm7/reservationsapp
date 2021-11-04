import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservationsapp/features/reserve_courts/data/models/reservation_model.dart';

class ReservationPage extends StatefulWidget {
  ReservationPage({Key? key}) : super(key: key);

  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (context) => ReservationModel,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Agendar cancha'),
          ),
          body: Container(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(children: <Widget>[]),
            ),
          ),
        ));
  }
}
