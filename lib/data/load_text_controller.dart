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
  final FocusNode _myFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
   mytextController.addListener(() {
      mytextController.text = unterlagen['id'].toString();
    });
    _myFocusNode.requestFocus();
    
  }

  @override
  void deactivate() {
    super.deactivate();
    _myFocusNode.unfocus();
  }

  @override
  void dispose() {
    super.dispose();
    _myFocusNode.dispose();
    mytextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: loadText(
          Key('id'),
          'Label',
          'Hint',
          mytextController,
          TextInputType.text,
          Icon(Icons.text_fields),
          (value) { unterlagen['Label'] = value; },
        ),
      ),
    );
  }
}


Widget loadText(
  Key key,
  String labelText,
  String hintText,
  TextEditingController controller,
  TextInputType keyboardType,
  Icon? icon, Null Function(dynamic value) param6,
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
          key: key,
          autofocus: true,
          onChanged: (value) => unterlagen[key.toString()] = controller.text,
          onEditingComplete: () {
            unterlagen[key.toString()] = controller.text;
          },
        ),
      );
    },
  );
}
