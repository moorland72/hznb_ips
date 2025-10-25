// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:hznb_ips/data/unterlagen.dart';

class SegmentedButtonChoice extends StatefulWidget {
  const SegmentedButtonChoice(Key key, TextEditingController betreuungsverfugungController) : super(key: key);

  @override
  State<SegmentedButtonChoice> createState() {
    return _SegmentedButtonChoiceState();
  }
}

enum SegmentWahl { ja, nein, nichtbekant }

class _SegmentedButtonChoiceState extends State<SegmentedButtonChoice> {
  SegmentWahl selectedSegment = SegmentWahl.nichtbekant;
final List<bool> isSelected = <bool>[false, false, false];
  @override
  Widget build(BuildContext context) {
    return SegmentedButton<SegmentWahl>(
      style: SegmentedButton.styleFrom(
        
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        foregroundColor: Colors.black,
        selectedForegroundColor: const Color.fromARGB(255, 255, 255, 255),
        selectedBackgroundColor: Colors.green,
        side: BorderSide(color: Color.fromARGB(255, 37, 34, 125)),
        textStyle: TextStyle(
          color: Color.fromARGB(255, 0, 1, 2),
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
      segments: const <ButtonSegment<SegmentWahl>>[
        ButtonSegment<SegmentWahl>(
          value: SegmentWahl.ja,
          label: Text('ja'),
          icon: Icon(Icons.check),
        ),
        ButtonSegment<SegmentWahl>(
          value: SegmentWahl.nein,
          label: Text('nein'),
          icon: Icon(Icons.cancel),
        ),
        ButtonSegment<SegmentWahl>(
          value: SegmentWahl.nichtbekant,
          label: Text('nicht bekannt'),
          icon: Icon(Icons.question_mark),
        ),
      ],
      selected: <SegmentWahl>{selectedSegment},
      onSelectionChanged: (Set<SegmentWahl> newSelection) {
        setState(() {
          selectedSegment = newSelection.first;
          unterlagen[Key('id').toString()] = selectedSegment.toString();
        });
      },
    );
  }
}
