import 'package:flutter/widgets.dart';
import 'package:reservationsapp/features/reserve_courts/data/datasources/reservations_local_datasource.dart';
import 'package:reservationsapp/features/reserve_courts/data/models/reservation_model.dart';

class ReservationProvider with ChangeNotifier {
  ReservationProvider();

  static const String INSERTED = 'INSERTED';
  static const String NOT_INSERTED = 'NOT_INSERTED';

  Future<String> createReservation(String username, String courtName,
      String dateTime, String precipitation) {
    var reservation = ReservationModel(
        nameCourts: courtName,
        userName: username,
        dateReservation: dateTime,
        precipitationPercentage: precipitation);
    notifyListeners();
    return writeReservations(reservation);
  }

  Future<List<ReservationModel>> getReservations() async {
    ReservationLocalDataSourceImpl reservationLocalDataSourceImpl =
        ReservationLocalDataSourceImpl();
    return await reservationLocalDataSourceImpl.getReservations();
  }

  Future<String> writeReservations(ReservationModel reservationModel) async {
    ReservationLocalDataSourceImpl reservationLocalDataSourceImpl =
        ReservationLocalDataSourceImpl();
    var resrverdCourts = await getReservations();
    if (resrverdCourts
            .where((element) =>
                element.nameCourts == reservationModel.nameCourts &&
                element.dateReservation == reservationModel.dateReservation)
            .toList()
            .length ==
        3) {
      return NOT_INSERTED;
    } else {
      reservationLocalDataSourceImpl.writeReservations(reservationModel);
      return INSERTED;
    }
  }

  void deleteReservation(int id) {
    ReservationLocalDataSourceImpl reservationLocalDataSourceImpl =
        ReservationLocalDataSourceImpl();
    reservationLocalDataSourceImpl.deleteReservations(id);
  }
}
