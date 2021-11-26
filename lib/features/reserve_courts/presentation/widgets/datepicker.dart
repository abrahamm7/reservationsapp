import 'package:flutter/material.dart';

class CustomShowDatePicker extends StatefulWidget {
  CustomShowDatePicker({Key? key}) : super(key: key);

  @override
  _CustomShowDatePickerState createState() => _CustomShowDatePickerState();
}

class _CustomShowDatePickerState extends State<CustomShowDatePicker> {
  // var currentDateTime = DateTime.now();
  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? pickedDate = await showDatePicker(
  //       context: context,
  //       initialDate: DateTime.now(),
  //       firstDate: DateTime(2015),
  //       lastDate: DateTime(2050));
  //   if (pickedDate != null && pickedDate != DateTime.now())
  //     setState(() {
  //       currentDateTime = pickedDate;
  //     });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DatePickerDialog(
          initialDate: DateTime.now(),
          firstDate: DateTime(2015),
          lastDate: DateTime(2022)),
    );
  }
}
