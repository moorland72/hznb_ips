import 'package:flutter/material.dart';
import 'package:hznb_ips/data/unterlagen.dart';

class DropDownExamle extends StatefulWidget {
  final String label;
  final List<String> items;

  const DropDownExamle({super.key, required this.label, required this.items});

  @override
  State<DropDownExamle> createState() => _DropDownExamleState();
} 

class _DropDownExamleState extends State<DropDownExamle> {
  final TextEditingController vonKlinikController = TextEditingController();
  final List<String> items = <String>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: buildDropDownMenu(context, Key('Label'), 'Label', items, selectedItems: [], onChanged: (selectedItems) {  }),
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    vonKlinikController.text = widget.items.isNotEmpty ? widget.items[0] : '';
    //unterlagen['Station'] = vonKlinikController.text;}
  }

  Widget buildDropDownMenu(BuildContext context, Key key, String label, items, {required List<String> selectedItems, required Null Function(dynamic value) onChanged, controller}) {
    String selectedItems = items.isNotEmpty ? items[0] : '';
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
    },);
  }
}