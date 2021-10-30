import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reservationsapp/features/reserve_courts/data/models/reservation_model.dart';

part 'reservations_event.dart';
part 'reservations_state.dart';

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
  ReservationsState get initialState => throw UnimplementedError();

  @override
  Stream<ReservationsState> mapEventToState(ReservationsEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}
