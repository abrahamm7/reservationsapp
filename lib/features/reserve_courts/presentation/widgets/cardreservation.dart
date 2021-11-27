import 'package:flutter/material.dart';

class CardReservation extends StatelessWidget {
  final String? nameCourts;
  final String? userName;
  final String? dateReservation;
  CardReservation(
      {Key? key,
      required this.nameCourts,
      required this.userName,
      required this.dateReservation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Card(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Text('Nombre: $nameCourts'),
                Text('Fecha de reservación: $dateReservation'),
                Text('Reservada por: $userName'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
