import 'package:flutter/material.dart';
import 'package:hznb_ips/data/unterlagen.dart';

class TextEditingControllerState extends StatefulWidget {
  const TextEditingControllerState({super.key});

  @override
  State<TextEditingControllerState> createState() =>
      _TextEditingControllerState();
}

class _TextEditingControllerState extends State<TextEditingControllerState> {
  final TextEditingController mytextController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: loadText(
          'Label',
          'Hint',
          mytextController,
          TextInputType.text,
          Icon(Icons.text_fields),
          (value) { unterlagen['Label'] = value; }
        ),
      ),
    );
  }
}


Widget loadText(String labelText, String hintText,
    TextEditingController controller, TextInputType keyboardType, Icon? icon, Function(String) onChanged  
) {
  return Builder(
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            labelText: labelText,
            prefixIcon: Align(widthFactor: 1.0, heightFactor: 1.0, child: icon),
            hintText: hintText,
          ),
          keyboardType: keyboardType,
          controller: controller,

        ),
      );
    },
  );
}
