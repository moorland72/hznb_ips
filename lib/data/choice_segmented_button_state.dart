// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class ChoiceSegmentedButtonState extends StatefulWidget {
  const ChoiceSegmentedButtonState({super.key});

  @override
  State<ChoiceSegmentedButtonState> createState() { 
    return _ChoiceSegmentedButtonState();
  }
}

enum ChoiceWahl { ja, nein, nichtbekant }

class _ChoiceSegmentedButtonState extends State<ChoiceSegmentedButtonState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: choiceButton3(Key('id')),
      ),
    );
  }
}
  ChoiceWahl selectedSegment = ChoiceWahl.nichtbekant;
final List<bool> isSelected = <bool>[false, false, false];
  Widget choiceButton3(Key key)
   {
    return Builder(
      builder: (BuildContext context) {
        return SegmentedButton<ChoiceWahl>(
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
          segments: const <ButtonSegment<ChoiceWahl>>[
            ButtonSegment<ChoiceWahl>(
              value: ChoiceWahl.ja,
              label: Text('ja'),
              icon: Icon(Icons.check),
            ),
            ButtonSegment<ChoiceWahl>(
              value: ChoiceWahl.nein,
              label: Text('nein'),
              icon: Icon(Icons.cancel),
            ),
            ButtonSegment<ChoiceWahl>(
              value: ChoiceWahl.nichtbekant,
              label: Text('nicht bekannt'),
              icon: Icon(Icons.question_mark),
            ),
          ],
          selected: <ChoiceWahl>{selectedSegment},
          
          onSelectionChanged: (Set<ChoiceWahl> newSelection) {
            selectedSegment = newSelection.last;
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('You entered: $selectedSegment. $key ')));
          },
          key: key,
        );        
      },
    );
  }
