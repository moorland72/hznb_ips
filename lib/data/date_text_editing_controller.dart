// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:hznb_ips/data/widgets.dart';

class DateTextEditingControllerState extends StatefulWidget {
  const DateTextEditingControllerState({super.key});

  @override
  State<DateTextEditingControllerState> createState() =>
      _DateTextEditingControllerState();
}

class _DateTextEditingControllerState extends State<DateTextEditingControllerState> {
  final TextEditingController mytextController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    mytextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: dateloadText(
          Key('id'),
          'Label',
          'Hint',
          mytextController,
          TextInputType.text,
          Icon(Icons.text_fields),
          null, // Added the missing 'returnDate' argument, pass null or a suitable value
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            ).then((date) {
              if (date != null) {
                String formattedDate =
                    "${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}";
                mytextController.text = formattedDate;
              }
            });
          },
        ),
      ),
    );
  }
}
