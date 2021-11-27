import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:reservationsapp/core/providers/reservation_provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
    return ChangeNotifierProvider<ReservationProvider>(
      create: (context) => ReservationProvider(),
      child: Consumer<ReservationProvider>(builder: (context, provider, child) {
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
              Alert(
                context: context,
                type: AlertType.info,
                title: "Eliminar reservación",
                desc:
                    "Se va a eliminar esta reservación con fecha: ${widget.dateReservation} a nombre de ${widget.userName}",
                buttons: [
                  DialogButton(
                    child: Text(
                      "Si",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () => Navigator.pop(context),
                    color: Colors.red,
                  ),
                  DialogButton(
                    child: Text(
                      "No",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () => Navigator.pop(context),
                    color: Colors.grey,
                  )
                ],
              ).show();
              //context.read<ReservationProvider>().deleteReservation(1);
            },
          ),
        );
      }),
    );
  }
}
