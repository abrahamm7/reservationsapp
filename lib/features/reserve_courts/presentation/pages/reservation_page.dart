import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservationsapp/features/reserve_courts/data/models/reservation_model.dart';

class ReservationPage extends StatefulWidget {
  ReservationPage({Key? key}) : super(key: key);

  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agendar cancha'),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: ListView(children: <Widget>[
            Text('Cancha a reservar'),
            DropdownButton(
              items: <String>['Cancha A', 'Cancha B', 'Cancha C']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(),
            Text('Fecha de reservación'),
            DatePickerDialog(
                initialDate: DateTime.now(),
                firstDate: DateTime(2010),
                lastDate: DateTime(2030)),
            SizedBox(),
            Text('A nombre de'),
            TextFormField(
              decoration: InputDecoration(hintText: 'Jhon Doe'),
            ),
            ElevatedButton(
              child: Text('Reservar'),
              onPressed: () {},
            )
          ]),
        ),
      ),
    );
  }
}

//Model Provider//

// class _ReservationPageState extends State<ReservationPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Provider(
//         create: (context) => ReservationModel,
//         child: Consumer<ReservationModel>(builder: (context, provider, child) {
//           Provider.of<ReservationModel>(context).insertPreferences();
//           return Scaffold(
//             appBar: AppBar(
//               title: Text('Agendar cancha'),
//             ),
//             body: Container(
//               child: Padding(
//                 padding: EdgeInsets.all(10),
//                 child: Column(children: <Widget>[
//                   Text('Cancha a reservar'),
//                   DropdownButton(
//                     items: <String>['Cancha A', 'Cancha B', 'Cancha C']
//                         .map<DropdownMenuItem<String>>((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                   ),
//                   SizedBox(),
//                   Text('Fecha de reservación'),
//                   DatePickerDialog(
//                       initialDate: DateTime.now(),
//                       firstDate: DateTime(2010),
//                       lastDate: DateTime(2030)),
//                   SizedBox(),
//                   Text('A nombre de'),
//                   TextFormField(
//                     decoration: InputDecoration(hintText: 'Jhon Doe'),
//                   ),
//                   ElevatedButton(
//                     child: Text('Reservar'),
//                     onPressed: () {},
//                   )
//                 ]),
//               ),
//             ),
//           );
//         }));
//   }
// }
