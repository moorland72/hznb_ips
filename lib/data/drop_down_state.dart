// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:hznb_ips/data/unterlagen.dart';

class DropDownState extends StatefulWidget {
  const DropDownState({super.key});

  @override
  State<DropDownState> createState() => _DropDownState();
}

class _DropDownState extends State<DropDownState> {
  final List<String> items = <String>[ ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: buildDropDown(context, Key('Label'), 'Label', items, selectedItems: [], onChanged: (selectedItems) {  }),
      ),
    );
  }
}
@override
Widget buildDropDown(BuildContext context, Key key, String label, items, {required List<String> selectedItems, required Null Function(dynamic value) onChanged, controller}) {
  String selectedItems = items[0];
  return StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
      return DropdownButton<String>(
        value: selectedItems,
        onChanged: (String? newValue) {
          setState(() {
            selectedItems = newValue!;
            unterlagen[key.toString()] = selectedItems;
            
          });
        },
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 24,
        elevation: 16,
        dropdownColor: const Color.fromARGB(255, 255, 255, 255),
        underline: Container(),
        isExpanded: true,
        hint: Text(label),
        borderRadius: BorderRadius.circular(5),
        style: TextStyle(
          color: const Color.fromARGB(255, 1, 3, 61),
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      );
    },
  );
}
