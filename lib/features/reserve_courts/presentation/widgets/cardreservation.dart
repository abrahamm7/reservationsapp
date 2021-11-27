import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardReservation extends StatefulWidget {
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
  _CardReservationState createState() => _CardReservationState();
}

class _CardReservationState extends State<CardReservation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: GestureDetector(
        child: Card(
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Text('Nombre: ${widget.nameCourts}'),
                  Text('Fecha de reservación: ${widget.dateReservation}'),
                  Text('Reservada por: ${widget.userName}'),
                ],
              ),
            ),
          ),
        ),
        onLongPress: () {
          HapticFeedback.vibrate();
        },
      ),
    );
  }
}
