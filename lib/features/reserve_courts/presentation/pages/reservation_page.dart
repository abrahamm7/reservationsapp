import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservationsapp/core/providers/reservation_provider.dart';
import 'package:reservationsapp/features/reserve_courts/data/models/reservation_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:reservationsapp/features/reserve_courts/domain/entities/reservation.dart';

class ReservationPage extends StatefulWidget {
  ReservationPage({Key? key}) : super(key: key);

  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  var courtSelected;
  var currentDateTime = DateTime.now();
  final userName = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDateTime,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDateTime)
      setState(() {
        currentDateTime = pickedDate;
      });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReservationProvider>(
        create: (context) => ReservationProvider(),
        child:
            Consumer<ReservationProvider>(builder: (context, provider, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Agendar cancha'),
            ),
            body: Container(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: ListView(children: <Widget>[
                  Text('Cancha a reservar'),
                  DropdownButton<String>(
                    hint: Text('Seleccione una cancha'),
                    items: <String>['Cancha A', 'Cancha B', 'Cancha C']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        courtSelected = newValue;
                      });
                      Fluttertoast.showToast(
                          msg: "Ha seleccionado la $courtSelected",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    },
                  ),
                  SizedBox(),
                  Text('Fecha de reservación'),
                  ElevatedButton(
                      child: Text('Elegir fecha'),
                      onPressed: () {
                        _selectDate(context);
                      }),
                  SizedBox(),
                  Text('A nombre de'),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Jhon Doe'),
                    controller: userName,
                  ),
                  ElevatedButton(
                      child: Text('Reservar'),
                      onPressed: () {
                        ReservationProvider().createReservation(userName.text,
                            1, courtSelected, currentDateTime, 3.5);
                        Navigator.pop(context);
                        Fluttertoast.showToast(
                            msg: "Cancha reservada: $courtSelected",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }),
                ]),
              ),
            ),
          );
        }));
  }
}
