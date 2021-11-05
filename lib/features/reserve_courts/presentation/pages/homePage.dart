import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Canchas'),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReservationPage()),
              );
            },
            child: const Icon(Icons.add),
            backgroundColor: Colors.green),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(5),
              child: Card(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        Text('Nombre: Cancha A'),
                        Text('Reservada para: 1/1/2022'),
                        Text('Reservada por: Abraham Morillo')
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
