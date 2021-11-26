import 'package:flutter/material.dart';
import 'package:reservationsapp/features/reserve_courts/data/datasources/reservations_local_datasource.dart';
import 'package:reservationsapp/features/reserve_courts/data/models/reservation_model.dart';
import 'package:lottie/lottie.dart';
import 'package:reservationsapp/features/reserve_courts/presentation/pages/reservation_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ReservationModel> list_reservations = [];
  final ReservationLocalDataSourceImpl reservationLocalDataSourceImpl =
      ReservationLocalDataSourceImpl();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getListReservations();
  }

  void _getListReservations() async {
    list_reservations = await reservationLocalDataSourceImpl.getReservations();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Canchas'),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(
                      builder: (_) => new ReservationPage()))
                  .then((value) => value ? _getListReservations() : null);
            },
            child: const Icon(Icons.add),
            backgroundColor: Colors.green),
        body: list_reservations.isEmpty
            ? Lottie.network(
                'https://assets7.lottiefiles.com/packages/lf20_GlZGOi.json',
                height: 500,
                width: 500)
            : ListView(
                children: <Widget>[
                  for (var item in list_reservations)
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Card(
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: <Widget>[
                                Text('Nombre: ${item.nameCourts}'),
                                Text('Reservada para: ${item.dateReservation}'),
                                Text('Reservada por: ${item.userName}'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ));
  }
}
