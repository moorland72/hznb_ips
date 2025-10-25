// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class TwoSegmentedButtonChoice extends StatefulWidget {
  const TwoSegmentedButtonChoice({super.key});

  @override
  State<TwoSegmentedButtonChoice> createState() {
    return _TwoSegmentedButtonChoiceState();
  }
}

enum TwoSegmentWahl { ja, nein }

class _TwoSegmentedButtonChoiceState extends State<TwoSegmentedButtonChoice> {
  TwoSegmentWahl selectedSegment = TwoSegmentWahl.nein;
  final List<bool> isSelected = <bool>[false, false];

  @override
  Widget build(BuildContext context) {
    Key('id');
  return SegmentedButton<TwoSegmentWahl>(
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
      segments: const <ButtonSegment<TwoSegmentWahl>>[
        ButtonSegment<TwoSegmentWahl>(
          value: TwoSegmentWahl.ja,
          label: Text('ja'),
          icon: Icon(Icons.check),
        ),
        ButtonSegment<TwoSegmentWahl>(
          value: TwoSegmentWahl.nein,
          label: Text('nein'),
          icon: Icon(Icons.cancel),
        ),
      ],
      selected: <TwoSegmentWahl>{selectedSegment},
      onSelectionChanged: (Set<TwoSegmentWahl> newSelection) {
        setState(() {
          selectedSegment = newSelection.first;
        });
      },
    );
  }
}
