import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:reservationsapp/core/providers/reservation_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:reservationsapp/features/reserve_courts/presentation/pages/homePage.dart';
import 'package:intl/intl.dart';

class ReservationPage extends StatefulWidget {
  ReservationPage({Key? key}) : super(key: key);

  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  var courtSelected;
  var currentDateTime = "";
  var userNameEditingController;
  List<String> options = [];
  String result = "";
  TextEditingController userNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    options = ['Cancha A', 'Cancha B', 'Cancha C'];
  }

  final _reservationKeyForm = GlobalKey<FormState>();
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
                child: Form(
                    key: _reservationKeyForm,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: userNameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Este campo es obligatorio';
                            }
                          },
                          decoration:
                              InputDecoration(hintText: 'Ingrese su nombre'),
                        ),
                        DropdownButtonFormField<String>(
                            hint: Text('Seleccione una cancha'),
                            items: options.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                courtSelected = value;
                              });
                            },
                            validator: (value) => value == null
                                ? 'Este campo es obligatorio'
                                : null),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              DatePicker.showDatePicker(context,
                                  showTitleActions: true,
                                  minTime: DateTime(2018, 3, 5),
                                  maxTime: DateTime(2025, 6, 7),
                                  onChanged: (date) {
                                setState(() {
                                  var formatter = new DateFormat('yyyy-MM-dd');
                                  currentDateTime = formatter.format(date);
                                });
                              });
                            },
                            child: Text('Seleccionar fecha')),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: ElevatedButton(
                              onPressed: () async {
                                if (_reservationKeyForm.currentState!
                                        .validate() &&
                                    currentDateTime != null) {
                                  var result = await context
                                      .read<ReservationProvider>()
                                      .createReservation(
                                          userNameController.text,
                                          courtSelected,
                                          currentDateTime,
                                          '2.0');
                                  if (result.contains('NOT_INSERTED')) {
                                    Fluttertoast.showToast(
                                        msg:
                                            "La cancha $courtSelected ya ha sido reservada 3 veces este dia",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  } else {
                                    await Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()));
                                  }
                                }
                              },
                              child: Text('Reservar')),
                        ),
                      ],
                    )),
              ),
            ),
          );
        }));
  }
}
