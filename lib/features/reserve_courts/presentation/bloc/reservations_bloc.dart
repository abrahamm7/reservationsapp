import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reservationsapp/features/reserve_courts/data/models/reservation_model.dart';
import 'package:reservationsapp/features/reserve_courts/domain/usecases/write_reservation.dart';

part 'reservations_event.dart';
part 'reservations_state.dart';

const String EMPTY_LIST = 'There are nothing to show';

class ReservationsBloc extends Bloc<ReservationsEvent, ReservationsState> {
  final CreateReservation createReservation;
  final GetReservations getReservations;
  final ShowModalAlert showModalAlert;
  final DeleteReservation deleteReservation;

  ReservationsBloc(
      {required CreateReservation newReservation,
      required GetReservations fetchReservation,
      required this.showModalAlert,
      required DeleteReservation removeReservation})
      : assert(newReservation != null),
        assert(fetchReservation != null),
        assert(removeReservation != null),
        createReservation = newReservation,
        getReservations = fetchReservation,
        deleteReservation = removeReservation;

  @override
  // TODO: implement initialState
  ReservationsState get initialState => Empty();

  @override
  Stream<ReservationsState> mapEventToState(ReservationsEvent event) async* {
    List<ReservationModel> reservationsList;
    if (event is GetReservations) {
      //reservationsList
    }
  }
}
