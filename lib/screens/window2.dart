import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hznb_ips/data/listen.dart';
import 'package:hznb_ips/data/unterlagen.dart';
import 'package:hznb_ips/data/widgets.dart';
import 'package:hznb_ips/screens/selected_unterlagen_string.dart';


class SecondWindow extends StatefulWidget {
  const SecondWindow({super.key});

  @override
  State<SecondWindow> createState() => _SecondWindowState();
}

var unterlagenArray = [];
getCheckboxItems() {
  mitgegebeneUnterlagen.forEach((key, value) {
    if (value == true) unterlagenArray.add(mitgegebeneUnterlagen[key]);
  });
  return unterlagenArray;
}

class _SecondWindowState extends State<SecondWindow> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HzNB - Pflegerischer Verlegungsbericht'),
        backgroundColor: Color.fromARGB(255, 70, 97, 154),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Row(//Kopfzeile mit Logo
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Image.asset('images/hznb_logo_klein.png', height: 50),
                    ],
                  ),
                ),
              ],
            ),
            Divider(color: Colors.grey, thickness: 1),
            Row(// Mitgegebene Unterlagen
              children: <Widget>[
                SizedBox(
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListView(
                      shrinkWrap: true,
                      children: mitgegebeneUnterlagen.keys.map((String key) {
                        return CheckboxListTile(
                          title: Text(key),
                          value: mitgegebeneUnterlagen[key],
                          onChanged: (bool? value) {
                            setState(() {
                              mitgegebeneUnterlagen[key] = value!;
                               if (value == true) {
                                  unterlagen[key] = '$key\n';

                              } else {
                                unterlagen.remove(key);
                              } 
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
            /* Row(
              children: [
                Expanded(
                  child: buildSelectedListDropDown(
                    context,
                    Key('Unterlagen'),
                    'Mitgegebene Unterlagen',
                    unterlagenMitgegeben,
                  ),
                ),
              ],
            ), */
            Row(// Medikament für Tage
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            'Medikamente für:',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: 150,

                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              key: Key('medikamentFuerTage'),
                              controller: medikamentFuerTageController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Tage:',
                                hintText: 'Tage',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.medication),
                              ),
                              inputFormatters: [numberFormatter],
                              onChanged: (value) {
                                unterlagen['Medikament für Tage'] = '$value\n';
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                      Column(
                      children: [
                        SizedBox(
                          width: 150,
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 18.0, left: 5.0),
                            child: Text(
                              'mitgegeben.',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ), 
                  ],
                ),
              ],
            ),
            Divider(height: 20, color: const Color.fromARGB(255, 70, 97, 154)),
            Row(// Medikamenteneinnahme
              
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      'Medikamenteneinnahme',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(// Medikamenteneinnahme Auswahl
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          icon:
                              context
                                      .dependOnInheritedWidgetOfExactType<
                                        DropdownButtonHideUnderline
                                      >() ==
                                  null
                              ? Icon(FontAwesomeIcons.pills)
                              : null,
                          items: medikamentEinnahme.map((
                            String medikamentEinnahme,
                          ) {
                            return DropdownMenuItem(
                              
                              value: medikamentEinnahme,
                              child: Text(medikamentEinnahme),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              medikamentEinnahmeController.text = value
                                  .toString();
                              unterlagen['Medikamenteneinnahme'] = '$value\n';
                            });
                          },
                          value: medikamentEinnahmeController.text.isEmpty
                              ? null
                              : medikamentEinnahmeController.text,
                          hint: Text('Medikamenteneinnahme'),
                          isExpanded: true,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CheckboxListTile(
                          title: Text('Tabletten mörsern'),
                          value: unterlagen['Tabletten mörsern'] == 'true'
                              ? true
                              : false,
                          onChanged: (bool? value) {
                            setState(() {
                              unterlagen['Tabletten mörsern'] = value.toString();
                              unterlagen['Tabletten mörsern'] == 'true'
                                  ? true
                                  : false;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(//Insulin 
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        'Insulin: ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                            width: 200,
                            child: SegmentedButton<TwoWahlOptions>(
                              key: Key('Insulin'),
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

                              segments: const <ButtonSegment<TwoWahlOptions>>[
                                ButtonSegment<TwoWahlOptions>(
                                  value: TwoWahlOptions.ja,
                                  label: Text('ja'),
                                  icon: Icon(Icons.check),
                                ),
                                ButtonSegment<TwoWahlOptions>(
                                  value: TwoWahlOptions.nein,
                                  label: Text('nein'),
                                  icon: Icon(Icons.cancel),
                                ),
                      
                              ],
                              selected: <TwoWahlOptions>{optionsInsulin},
                              onSelectionChanged: (Set<TwoWahlOptions> newSelection) {
                                setState(() {
                                  optionsInsulin = newSelection.first;
                                  unterlagen['Insulin'] = '$optionsInsulin\n';
                                });
                              },
                            )
                          ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 300,
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextField(
                          key: Key('InsulinArt'),
                          controller: insulinSonArtController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Art/Dosierung:',
                            hintText: 'Art/Dosierung:',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.edit),
                          ),
                          inputFormatters: [stringNameFormatter],
                          onChanged: (value) {
                            unterlagen['Insulin Art/Dosierung'] = '$value\n';
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Row(// Insulin Verabreichung
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(
                        'Verabreichung per:',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          icon:
                              context
                                      .dependOnInheritedWidgetOfExactType<
                                        DropdownButtonHideUnderline
                                      >() ==
                                  null
                              ? Icon(FontAwesomeIcons.syringe)
                              : null,
                          borderRadius: BorderRadius.circular(5),
                          items: insulinVerabreichung.map((
                            String insulinVerabreichung,
                          ) {
                            return DropdownMenuItem(
                              value: insulinVerabreichung,
                              child: Text(insulinVerabreichung),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              insulinVerabreichungController.text = value
                                  .toString();
                              unterlagen['Insulinverabreichung'] = '$value\n';
                            });
                          },
                          value: insulinVerabreichungController.text.isEmpty
                              ? null
                              : insulinVerabreichungController.text,
                          hint: Text('Insulinverabreichung'),
                          isExpanded: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(// Insulin Injektion
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(
                        'Injektion:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          icon:
                              context
                                      .dependOnInheritedWidgetOfExactType<
                                        DropdownButtonHideUnderline
                                      >() ==
                                  null
                              ? Icon(FontAwesomeIcons.syringe)
                              : null,
                          borderRadius: BorderRadius.circular(5),
                          items: injektionHilfe.map((
                            String injektionHilfe,
                          ) {
                            return DropdownMenuItem(
                              value: injektionHilfe,
                              child: Text(injektionHilfe),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              injektionHilfeController.text = value
                                  .toString();
                              unterlagen['Injektion'] = '$value\n';
                            });
                          },
                          value: injektionHilfeController.text.isEmpty
                              ? null
                              : injektionHilfeController.text,
                          hint: Text('Injektion'),
                          isExpanded: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      /* floatingActionButton: FloatingActionButton(
        onPressed: () {
          // saveData();
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Daten gespeichert'),
                content: Text('$unterlagen'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        },
        backgroundColor: Color.fromARGB(255, 70, 97, 154),
        tooltip: 'Daten speichern',
        child: Icon(Icons.save),
      ), */
      bottomNavigationBar: buildBottomNavigationBar(context, '/main', '/third'),
    );
  }
}
