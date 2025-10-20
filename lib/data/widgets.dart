import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/date_picker_theme.dart';
import 'package:flutter_holo_date_picker/widget/date_picker_widget.dart';

class SegmentedButtonChoice extends StatefulWidget {
  const SegmentedButtonChoice(Key key) : super(key: key);

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
    Key('id');
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
        });
      },
    );
  }
}

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

Widget buildBottomNavigationBar(
  BuildContext context,
  String? selRuckwerts,
  String? selVorwaerts,
) {
  return BottomAppBar(
    color: Color.fromARGB(255, 70, 97, 154),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton.icon(
            icon: Icon(Icons.arrow_back),
            label: Text('Zurück'),
            onPressed: () {
              Navigator.pushNamed(context, selRuckwerts!);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Color.fromARGB(255, 70, 97, 154),
            ),
          ),
          SizedBox(width: 10),
          ElevatedButton.icon(
            label: Text('Vorwärts'),
            iconAlignment: IconAlignment.end,
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
              Navigator.pushNamed(context, selVorwaerts!);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Color.fromARGB(255, 70, 97, 154),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildSelectedListDropDown(
  BuildContext context,
  String label,
  List<SelectedListItem<String>> items,
) {
  List<SelectedListItem<String>> selectedItems = [];
  return StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
      // Replace with a suitable multi-select dropdown widget, e.g. DropDownMultiSelect or CheckboxListTile
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          ...items.map((item) {
            return CheckboxListTile(
              title: Text(item.data),
              value: selectedItems.contains(item),
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    selectedItems.add(item);
                  } else {
                    selectedItems.remove(item);
                  }
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            );
          }),
        ],
      );
    },
  );
}

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
        child: buildDropDown(context, 'Label', items, selectedItems: [], onChanged: (value) {  }),
      ),
    );
  }
}

Widget buildDropDown(BuildContext context, String label, List<String> items, {required List<String> selectedItems, required Null Function(dynamic value) onChanged}) {
  String selectedItems = items[0];
  return StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
      return DropdownButton<String>(
        value: selectedItems,
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedItems = newValue!;
          });
        },
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

class TextEditingControllerState extends StatefulWidget {
  const TextEditingControllerState({super.key});

  @override
  State<TextEditingControllerState> createState() =>
      _TextEditingControllerState();
}

class _TextEditingControllerState extends State<TextEditingControllerState> {
  final TextEditingController mytextController = TextEditingController();
  FocusNode _myFocusNode = FocusNode();
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
  Icon? icon,
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
          onEditingComplete: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
        ),
      );
    },
  );
}


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
            FocusScope.of(context).requestFocus(new FocusNode());
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

Widget dateloadText(
  Key key,
  String labelText,
  String hintText,
  TextEditingController controller,
  TextInputType keyboardType,
  Icon? icon, returnDate, {required VoidCallback onTap}
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
        ),
      );
    },
  );
}


Widget buildTitle(BuildContext context, String name, String location) {
  return Padding(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          /*1*/
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*2*/
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(location, style: TextStyle(color: Colors.grey[500])),
            ],
          ),
        ),
        /*3*/
        Icon(Icons.star, color: Colors.red[500]),
        const Text('41'),
      ],
    ),
  );
}


class WidgetPage extends StatefulWidget {
  @override
  _WidgetPageState createState() => _WidgetPageState();
}

class _WidgetPageState extends State<WidgetPage> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [
              Colors.grey[900]!,
              Colors.black,
            ],
            stops: const [0.7, 1.0],
          )),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: DatePickerWidget(
                    looping: false, // default is not looping
                    firstDate: DateTime.now(),
                    //  lastDate: DateTime(2002, 1, 1),
//              initialDate: DateTime.now(),// DateTime(1994),
                    dateFormat:
                        // "MM-dd(E)",
                        "dd.MMMM.yyyy",
                    locale: DatePicker.localeFromString('zh'),
                    onChange: (DateTime newDate, _) {
                      setState(() {
                        _selectedDate = newDate;
                      });
                      print(_selectedDate);
                    },
                    pickerTheme: DateTimePickerTheme(
                      backgroundColor: Colors.transparent,
                      itemTextStyle:
                          TextStyle(color: Colors.white, fontSize: 19),
                      dividerColor: Colors.blue,
                      dividerThickness: 3,
                      diameterRatio: 3,
                      dividerSpacing: 0,
                      squeeze: 0.8,
                    ),
                  ),
                ),
                Text("${_selectedDate ?? ''}"),
              ],
            ),
          ),
        ),
      ),
    );
    //var locale = "zh";
    // return SafeArea(
    //   child: Scaffold(
    //     body: Center(
    //       child: DatePickerWidget(
    //         locale: //locale == 'zh'
    //             DateTimePickerLocale.zh_cn
    //             //  DateTimePickerLocale.en_us
    //         ,
    //         lastDate: DateTime.now(),
    //         // dateFormat: "yyyy : MMM : dd",
    //         // dateFormat: 'yyyy MMMM dd',
    //         onChange: (DateTime newDate, _) {
    //           setState(() {
    //             var dob = newDate.toString();
    //             print(dob);
    //           });
    //         },
    //         pickerTheme: DateTimePickerTheme(
    //           backgroundColor: Colors.transparent,
    //           dividerColor: const Color(0xffe3e3e3),
    //           itemTextStyle: TextStyle(
    //             fontFamily: 'NotoSansTC',
    //             fontSize: 18,
    //             fontWeight: FontWeight.w500,
    //             color: Theme.of(context).primaryColor,
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}

