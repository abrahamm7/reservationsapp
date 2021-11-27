import 'package:flutter/material.dart';
import 'package:reservationsapp/features/reserve_courts/data/datasources/reservations_local_datasource.dart';
import 'package:reservationsapp/features/reserve_courts/data/models/reservation_model.dart';
import 'package:lottie/lottie.dart';
import 'package:reservationsapp/features/reserve_courts/presentation/pages/reservation_page.dart';
import 'package:reservationsapp/features/reserve_courts/presentation/widgets/cardreservation.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ReservationModel> listReservations = [];
  final ReservationLocalDataSourceImpl reservationLocalDataSourceImpl =
      ReservationLocalDataSourceImpl();

  @override
  void initState() {
    super.initState();
    _getListReservations();
  }

  void _getListReservations() async {
    listReservations = await reservationLocalDataSourceImpl.getReservations();
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
        body: listReservations.isEmpty
            ? Lottie.network(
                'https://assets7.lottiefiles.com/packages/lf20_GlZGOi.json',
                height: 500,
                width: 500)
            : ListView(
                children: <Widget>[
                  for (var item in listReservations)
                    CardReservation(
                        nameCourts: item.nameCourts,
                        userName: item.userName,
                        dateReservation: item.dateReservation)
                ],
              ));
  }
}
