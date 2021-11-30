import 'package:flutter/material.dart';
import 'package:reservationsapp/features/reserve_courts/data/datasources/reservations_local_datasource.dart';
import 'package:reservationsapp/features/reserve_courts/data/datasources/weather_cloud_datasource.dart';
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
  List<dynamic> listWeather = [];
  final ReservationLocalDataSourceImpl reservationLocalDataSourceImpl =
      ReservationLocalDataSourceImpl();
  final WeatherCloudDataSourceImpl weatherCloudDataSourceImpl =
      WeatherCloudDataSourceImpl();

  @override
  void initState() {
    super.initState();
    _getListReservations();
  }

  void _getListReservations() async {
    listReservations = await reservationLocalDataSourceImpl.getReservations();
    setState(() {});
  }

  Future<List<ReservationModel>> _refreshList() async {
    listReservations = await reservationLocalDataSourceImpl.getReservations();
    setState(() {});
    return listReservations;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Canchas'),
      ),
      body: listReservations.isEmpty
          ? Lottie.asset('assets/lottieJSON/empty-state.json',
              height: 500, width: 500)
          : RefreshIndicator(
              onRefresh: _refreshList,
              child: ListView(
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                children: <Widget>[
                  for (var item in listReservations)
                    CardReservation(
                        id: item.id,
                        nameCourts: item.nameCourts,
                        userName: item.userName,
                        dateReservation: item.dateReservation)
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(new MaterialPageRoute(
                    builder: (_) => new ReservationPage()))
                .then((value) => value ? _getListReservations() : null);
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.red),
    );
  }
}
