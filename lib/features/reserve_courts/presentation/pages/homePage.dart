import 'package:flutter/material.dart';
import 'package:reservationsapp/core/providers/reservation_provider.dart';
import 'package:reservationsapp/features/reserve_courts/data/datasources/reservations_local_datasource.dart';
import 'package:reservationsapp/features/reserve_courts/data/models/reservation_model.dart';
import 'package:reservationsapp/features/reserve_courts/data/repositories/reservation_repository_impl.dart';
import 'package:reservationsapp/features/reserve_courts/domain/repositories/reservation_repository.dart';
import 'package:reservationsapp/features/reserve_courts/presentation/pages/reservation_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ReservationPage()),
              );
            },
            child: const Icon(Icons.add),
            backgroundColor: Colors.green),
        body: ListView(
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
