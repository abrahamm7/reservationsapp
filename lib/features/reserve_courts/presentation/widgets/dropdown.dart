import 'package:flutter/material.dart';

class DropdownCourts extends StatefulWidget {
  DropdownCourts({Key? key}) : super(key: key);

  @override
  _DropdownCourtsState createState() => _DropdownCourtsState();
}

class _DropdownCourtsState extends State<DropdownCourts> {
  var courtSelected;
  List<String> options = [];
  @override
  void initState() {
    super.initState();
    options = ['Cancha A', 'Cancha B', 'Cancha C'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: DropdownButtonFormField<String>(
            hint: Text('Seleccione una cancha'),
            items: options.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                courtSelected = value;
              });
            },
            validator: (value) =>
                value == null ? 'Este campo es obligatorio' : null));
  }
}
