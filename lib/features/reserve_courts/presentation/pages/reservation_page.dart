import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:reservationsapp/core/platform/connectivity.dart';
import 'package:reservationsapp/core/providers/reservation_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:reservationsapp/features/reserve_courts/data/datasources/weather_cloud_datasource.dart';
import 'package:reservationsapp/features/reserve_courts/data/models/forecastWeather_model.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ReservationPage extends StatefulWidget {
  ReservationPage({Key? key}) : super(key: key);

  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  static const String VALIDATE_TEXT = 'Este campo es obligatorio';
  var courtSelected;
  var currentDateTime = "";
  var conditionDateTime = "";
  bool isOnline = false;
  num rainProbability = 0;
  List<String> options = [];
  List<ForecastWeatherModel> forecastList = [];
  TextEditingController userNameController = TextEditingController();
  final WeatherCloudDataSourceImpl weatherCloudDataSourceImpl =
      WeatherCloudDataSourceImpl();

  void _getForecast() async {
    forecastList = await weatherCloudDataSourceImpl.getWeatherFromCloud();
    setState(() {});
  }

  void _getForecastByDate(String dateTime) {
    for (var item in forecastList) {
      var forecast = item.forecast.forecastday
          .where((element) => element.date == dateTime)
          .toList();
      if (forecast.isNotEmpty) {
        rainProbability = forecast.map((e) => e.day.dailyChanceOfRain).single;
      } else {
        rainProbability = 0;
      }
    }
    setState(() {});
  }

  void _getInternet() async {
    isOnline = await CheckInternetConnection.check().then((value) => value);
  }

  void _showDialog(String title, String description, String option,
      BuildContext context) async {
    Alert(
      context: context,
      type: AlertType.info,
      title: title,
      desc: description,
      buttons: [
        DialogButton(
          child: Text(
            option,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.red,
        ),
      ],
    ).show();
  }

  void _showToast(String desc) {
    Fluttertoast.showToast(
        msg: desc,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  void initState() {
    super.initState();
    options = ['Cancha A', 'Cancha B', 'Cancha C'];
    _getInternet();
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
              child: ListView(
                children: <Widget>[
                  Lottie.asset('assets/lottieJSON/reserve-court.json',
                      height: 300, width: 300),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Form(
                        key: _reservationKeyForm,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: userNameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return VALIDATE_TEXT;
                                }
                              },
                              decoration: InputDecoration(
                                  hintText: 'Ingrese su nombre'),
                            ),
                            SizedBox(height: 60),
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
                                validator: (value) =>
                                    value == null ? VALIDATE_TEXT : null),
                            SizedBox(
                              height: 60,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  DatePicker.showDatePicker(context,
                                      showTitleActions: true,
                                      minTime: DateTime(2018, 3, 5),
                                      maxTime: DateTime(2025, 6, 7),
                                      onChanged: (date) {
                                    setState(() {
                                      var formatter =
                                          new DateFormat('yyyy-MM-dd');
                                      currentDateTime = formatter.format(date);
                                      if (isOnline == true) {
                                        _getForecastByDate(currentDateTime);
                                        _getForecast();
                                        _showToast(
                                            "Probabilidad de lluvia es $rainProbability %");
                                      } else {
                                        _showToast(
                                            "No hay conexión a internet para obtener las condiciones del tiempo");
                                      }
                                    });
                                  });
                                },
                                child: Text('Seleccionar fecha')),
                            currentDateTime.isEmpty
                                ? Text(
                                    'Fecha a reservar: $VALIDATE_TEXT',
                                  )
                                : Text('Fecha a reservar: $currentDateTime'),
                            SizedBox(height: 60),
                            Center(
                                child: ElevatedButton(
                                    onPressed: () async {
                                      if (_reservationKeyForm.currentState!
                                              .validate() &&
                                          currentDateTime.isNotEmpty) {
                                        var result = await context
                                            .read<ReservationProvider>()
                                            .createReservation(
                                                userNameController.text,
                                                courtSelected,
                                                currentDateTime,
                                                rainProbability.toString());
                                        if (result.contains('NOT_INSERTED')) {
                                          _showDialog(
                                              "Información",
                                              "La $courtSelected ya ha sido reservada 3 veces este dia",
                                              "Seleccionar otra fecha",
                                              context);
                                        } else {
                                          Navigator.pop(context, true);
                                        }
                                      }
                                    },
                                    child: Text('Reservar'))),
                          ],
                        )),
                  )
                ],
              ),
            ),
          );
        }));
  }
}
