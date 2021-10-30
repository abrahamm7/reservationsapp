import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:reservationsapp/features/reserve_courts/data/models/reservation_model.dart';
import 'package:reservationsapp/features/reserve_courts/presentation/bloc/reservations_bloc.dart';

class MockCreateReservations extends Mock implements CreateReservation {}

class MockRemoveReservations extends Mock implements DeleteReservation {}

class MockGetReservations extends Mock implements GetReservations {}

class MockShowModalAlert extends Mock implements ShowModalAlert {}

void main() {
  late ReservationsBloc reservationsBloc;
  MockCreateReservations mockCreateReservations;
  MockRemoveReservations mockRemoveReservations;
  MockGetReservations mockGetReservations;
  MockShowModalAlert mockShowModalAlert;

  setUp(() {
    mockCreateReservations = MockCreateReservations();
    mockRemoveReservations = MockRemoveReservations();
    mockGetReservations = MockGetReservations();
    mockShowModalAlert = MockShowModalAlert();

    reservationsBloc = ReservationsBloc(
        newReservation: mockCreateReservations,
        fetchReservation: mockGetReservations,
        showModalAlert: mockShowModalAlert,
        removeReservation: mockRemoveReservations);
  });

  test('Initial state of bloc should be empty', () async {
    expect(reservationsBloc.initialState, equals(Empty()));
  });

  group('CreateReservation', () async {
    final reservation = ReservationModel(
        id: 1,
        nameCourts: 'Cancha A',
        userName: 'Abraham',
        dateReservation: DateTime.now(),
        precipitationPercentage: 3.4);
  });
}
