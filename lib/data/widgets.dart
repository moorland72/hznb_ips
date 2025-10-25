// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:hznb_ips/data/unterlagen.dart';

Widget toppAppbar(BuildContext context, String title) {
  return AppBar(
    backgroundColor: Color.fromARGB(255, 70, 97, 154),
    title: Text(title),
    centerTitle: true,
  );
}

Widget buildBottomNavigationBar(
  BuildContext context,
  String? selRuckwerts,
  String? selVorwaerts,
) {
  return BottomAppBar(
    color: Color.fromARGB(255, 70, 97, 154),
    height: 90,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton.icon(
                label: Text('Exit'),
                iconAlignment: IconAlignment.end,
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Möchten Sie ohne zu speichern verlassen?'),
                        content: Text('Alle ungespeicherten Änderungen gehen verloren.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Abbrechen'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              unterlagen.clear();
                              Navigator.pushNamed(context, '/hauptRail');
                            },
                            child: Text('Verlassen'),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 249, 7, 7),
                  foregroundColor: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(
              width: 100,
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton.icon(
                label: Text('Speichern'),
                iconAlignment: IconAlignment.start,
                icon: Icon(Icons.save),
                onPressed: () async {
                  if (unterlagen['Patientname'] == null ||
                      unterlagen['Patientname']!.isEmpty ||
                      unterlagen['PatientGeburtsdatum'] == '' ||
                      unterlagen['PatientGeburtsdatum'] == null) {
                    showDialog(context: context, builder: (context){
                      return AlertDialog(
                        title: Text('Fehlende Daten'),
                        content: Text('Bitte füllen Sie alle erforderlichen Felder aus.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    });
                  }
                  else {
                   /*  var patientId = await insertPatientOb(  Patient(
                      PatientName: unterlagen['Patientname'] ?? '',
                      GeburtsDateOB: unterlagen['PatientGeburtsdatum'] ?? '',
                    ));
                    final boxBehandlung = objectBox.store.box<Behandlung>();
                    var behandlung = Behandlung(null, patientId as int?, unterlagen['BehandlungVon']!, unterlagen['BehandlungBis']!, unterlagen['Station']!, '');
                    boxBehandlung.put(behandlung);
                    print('Behandlung gespeichert mit ID: ${behandlung.behandlungId}');
                    unterlagen.clear();
                    Navigator.pushNamed(context, '/hauptRail'); */
                  }
              
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 117, 213, 107),
                  foregroundColor: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ],
        ),

        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton.icon(
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
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton.icon(
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
            ),
          ],
        ),
      ],
    ),
  );
}

Widget buildSelectedListDropDown(
  BuildContext context,
  Key key,
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
                    unterlagen[item.data] = item.data;
                  } else {
                    selectedItems.remove(item);
                    unterlagen.remove(item.data);
                  }
                });
                //print(unterlagen);
              },
              controlAffinity: ListTileControlAffinity.leading,
            );
          }),
        ],
      );
    },
  );
}

class DropdownItem extends StatefulWidget {
  final List<String> items;

  const DropdownItem({super.key, required this.items});

  @override
  // ignore: library_private_types_in_public_api
  _DropdownItemState createState() => _DropdownItemState();
}

class _DropdownItemState extends State<DropdownItem> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedValue,
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue;
        });
      },
      items: widget.items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
    );
  }
}

Widget dateloadText(
  Key key,
  String labelText,
  String hintText,
  TextEditingController controller,
  TextInputType keyboardType,
  Icon? icon,
  returnDate, {
  required VoidCallback onTap,
}) {
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
