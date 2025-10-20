import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hznb_ips/data/data.dart';
import 'package:hznb_ips/data/listen.dart';
import 'package:hznb_ips/data/widgets.dart';
import 'package:hznb_ips/screens/window2.dart';

String? selectedUnterlagenString;

final TextEditingController geburtsDatumController = TextEditingController();
final TextEditingController behandlungsBisController = TextEditingController();
final TextEditingController behandlungsVonController = TextEditingController();

bool insulinPflicht = false;
typedef MenuEntry = DropdownMenuEntry<String>;
String get selectedStation => stations[0];
String get selectedTreatmentType => treatmentTypes[0];
DateTime? selectedDate;

get returnDate => null;

class MainWindow extends StatefulWidget {
  const MainWindow({super.key});

  @override
  State<MainWindow> createState() => _MainWindowState();
}

class _MainWindowState extends State<MainWindow> {
  int? get _selectedIndex => null;
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HzNB - Pflegerischer Verlegungsbericht'),
        backgroundColor: Color.fromARGB(255, 70, 97, 154),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Row(
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
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Text(
                        'Pflegerischer Verlegungsbericht',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Row(
              // Verlegungsdaten Titel
              children: [
                Column(
                  children: [
                    Text(
                      'Patientendaten: ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                        width: 350,

                        child: /* loadText(
                          Key('Patientname'),
                          'Patientname:',
                          'Name, Vorname',
                          TextEditingController(),
                          TextInputType.text,
                          Icon(Icons.person),
                          
                        ) */ TextFormField(
                          key: Key('Patientname'),
                          controller: TextEditingController(),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Patientname:',
                            hintText: 'Name, Vorname',
                            border: OutlineInputBorder(),

                            prefixIcon: Icon(Icons.person),
                          ),
                          onChanged: (value) {
                            patientNameString = value;
                          },
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                        width: 200,

                        child: TextFormField(
                          key: Key('PatientGeburtsdatum'),
                          controller: geburtsDatumController,
                          hintLocales: [const Locale('de', 'DE')],
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Geburtsdatum:',
                            hintText: 'DD.MM.YYYY',
                            border: OutlineInputBorder(),

                            prefixIcon: Icon(FontAwesomeIcons.calendar),
                          ),
                          onChanged: (value) {
                            patientBirthDateString = geburtsDatumController.text;
                          },
                          onTap: () async {
                            var datePicked = await DatePicker.showSimpleDatePicker(
                              context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100),
                              dateFormat: "dd.MMMM.yyyy",
                              locale: DateTimePickerLocale.de,
                              looping: true
                            );
                            if (datePicked != null) {
                              geburtsDatumController.text =
                                  '${datePicked.day.toString().padLeft(2, '0')}.${datePicked.month.toString().padLeft(2, '0')}.${datePicked.year}';
                              patientBirthDateString = geburtsDatumController.text;
                            }

                          }
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            /* Row(
              children: [
                Expanded(
                  child: loadText(
                    Key('Geburtsdatum'),
                    'Geburtsdatum:',
                    'DD.MM.YYYY',
                    TextEditingController(
                      
                    ),
                    TextInputType.datetime,
                    Icon(FontAwesomeIcons.calendar),
                    
                  ),
                ),
              ],
            ), */
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 140,
                        child: Text(
                          'von Station: ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: buildDropDown(
                      context, 'Station:', 
                      stations,
                      selectedItems: [selectedStation],
                      onChanged: (value) {
                        setState(() {
                          vonStation = value!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              height: 20,
              thickness: 0.5,
              indent: 20,
              endIndent: 20,
              color: Color.fromARGB(255, 3, 54, 125),
            ),
            Row(
              // Verlegungsdaten Titel
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 125,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          'Behandlungszeit: ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Column(
                  children: [
                    SizedBox(
                      width: 225,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: TextFormField(
                          key: Key('BehandlungVon'),
                          controller: behandlungsVonController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Behandlung von:',
                            hintText: 'DD.MM.YYYY',
                            border: OutlineInputBorder(),

                            prefixIcon: Icon(FontAwesomeIcons.calendar),
                          ),
                          onChanged: (value) {
                            patientBehandlungBeginn = behandlungsVonController.text;
                          },
                          onTap: () async {
                            var datePicked = await DatePicker.showSimpleDatePicker(
                              context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100),
                              dateFormat: "dd.MMMM.yyyy",
                              locale: DateTimePickerLocale.de,
                              looping: true
                            );
                            if (datePicked != null) {
                              behandlungsVonController.text =
                                  '${datePicked.day.toString().padLeft(2, '0')}.${datePicked.month.toString().padLeft(2, '0')}.${datePicked.year}';
                              patientBehandlungBeginn = behandlungsVonController.text;
                            }

                          }
                        ) /* loadText(
                          Key('BehandlungVon'),
                          'Behandlung von:',
                          'DD.MM.YYYY',
                          TextEditingController(),
                          TextInputType.datetime,
                          Icon(FontAwesomeIcons.calendar),
                        ), */,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 225,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: TextFormField(
                          key: Key('BehandlungBis'),
                          controller: behandlungsBisController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Behandlung bis:',
                            hintText: 'DD.MM.YYYY',
                            border: OutlineInputBorder(),

                            prefixIcon: Icon(FontAwesomeIcons.calendar),
                          ),
                          onChanged: (value) {
                            patientBehandlungBis = behandlungsBisController.text;
                          },
                          onTap: () async {
                            var datePicked = await DatePicker.showSimpleDatePicker(
                              context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100),
                              dateFormat: "dd.MMMM.yyyy",
                              locale: DateTimePickerLocale.de,
                              looping: true
                            );
                            if (datePicked != null) {
                              behandlungsBisController.text =
                                  '${datePicked.day.toString().padLeft(2, '0')}.${datePicked.month.toString().padLeft(2, '0')}.${datePicked.year}';
                              patientBehandlungBis = behandlungsBisController.text;
                            }

                          }
                        ),
                        /* loadText(
                          Key('BehandlungBis'),
                          'Behandlung bis:',
                          'DD.MM.YYYY',
                          TextEditingController(),
                          TextInputType.datetime,
                          Icon(FontAwesomeIcons.calendar),
                        ) */
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Row(
              // Verlegungsdaten Titel
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    'Verlegung nach: ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: buildDropDown(
                      context,
                      'Verlegung nach:',
                      treatmentTypes,
                      selectedItems: [selectedTreatmentType],
                      onChanged: (value) {
                        setState(() {
                          verlegungNach = value!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(),
            const Divider(
              height: 20,
              thickness: 0.5,
              indent: 20,
              endIndent: 20,
              color: Color.fromARGB(255, 3, 54, 125),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    'Soziale Aspekte: ',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: buildDropDown(
                      context,
                      'Soziale Aspekte:',
                      sozialeAspekte,
                      selectedItems: [sozialeAspekte[0]],
                      onChanged: (value) {
                        setState(() {
                          sozialeAspekteValue = value!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    'Angehörige/Betreuer:',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Expanded(
                  child: loadText(
                    Key('AngehörigeName'),
                    'Name:',
                    'Name, Vorname',
                    TextEditingController(),
                    TextInputType.text,
                    Icon(Icons.contact_emergency),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: loadText(
                    Key('AngehörigeAnschrift'),
                    'Anschrift:',
                    'Strasse, Nr., PLZ, Ort',
                    TextEditingController(),
                    TextInputType.text,
                    Icon(Icons.home),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: loadText(
                    Key('AngehörigeTelefonnummer'),
                    'Telefonnummer:',
                    'Telefonnummer',
                    TextEditingController(),
                    TextInputType.phone,
                    Icon(Icons.phone),
                  ),
                ),
              ],
            ),
            const Divider(
              height: 20,
              thickness: 0.5,
              indent: 20,
              endIndent: 20,
              color: Color.fromARGB(255, 3, 54, 125),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    'Bisherige Versorgung \ndurch: ',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: buildDropDown(
                      context,
                      'Bisherige Versorgung durch:',
                      previousCare,
                      selectedItems: [previousCare[0]],
                      onChanged: (value) {
                        setState(() {
                          versorgungDurch = value!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    'Pflegestufe:',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 80.0),
                    child: buildDropDown(
                      context,
                      'Pflegestufen:',
                      pflegeStufen,
                      selectedItems: [pflegeStufen[0]],
                      onChanged: (value) {
                        setState(() {
                          pflegeStufenString = value!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    'Hausarzt/Facharzt',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Expanded(
                  child: loadText(
                    Key('HausarztName'),
                    'Name:',
                    'Name, Vorname',
                    TextEditingController(),
                    TextInputType.text,
                    Icon(Icons.person),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: loadText(
                    Key('HausarztAnschrift'),
                    'Anschrift:',
                    'Straße, PLZ, Ort',
                    TextEditingController(),
                    TextInputType.text,
                    Icon(Icons.home),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: loadText(
                    Key('HausarztTelefonnummer'),
                    'Telefonnummer:',
                    'Telefonnummer',
                    TextEditingController(),
                    TextInputType.phone,
                    Icon(Icons.phone),
                  ),
                ),
              ],
            ),
            Divider(
              height: 10,
              thickness: 0.5,
              indent: 20,
              endIndent: 20,
              color: Color.fromARGB(255, 3, 54, 125),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Column(
                    children: [
                      Text(
                        'Vorsorgevollmacht:)',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '(Falls ja, bitte Kopie beilegen.)',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: SizedBox(
                          width: 380,
                          child: SegmentedButtonChoice(
                            Key('Vorsorgevollmacht'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            /* Row(
              children: <Widget>[
                Column(children: [
                    
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: SegmentedButtonChoice(Key('Vorsorgevollmacht')),
                  ),
                ),
              ],
            ), */
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Column(
                    children: [
                      Text(
                        'Patientenverfügung:)',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '(Falls ja, bitte Kopie beilegen.)',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: SizedBox(
                          width: 380,
                          child: SegmentedButtonChoice(
                            Key('Patientenverfügung'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Column(
                    children: [
                      Text(
                        'Betreuungsverfügung:)',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '(Falls ja, bitte Kopie beilegen.)',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: SizedBox(
                          width: 380,
                          child: SegmentedButtonChoice(
                            Key('Betreuungsverfügung'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Column(
                    children: [
                      Text(
                        'Reanimationswunsch:',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '(Falls ja, bitte Kopie beilegen.)',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: SizedBox(
                          width: 380,
                          child: SegmentedButtonChoice(
                            Key('Reanimationswunsch'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         // saveData();
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Daten gespeichert'),
                content: Text('${patientNameString} \n ${patientBehandlungBeginn} \n ${patientBehandlungBis} \n ${patientBirthDateString}'),
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
        child: Icon(Icons.save),
        tooltip: 'Daten speichern',
      ),

      bottomNavigationBar: BottomAppBar(
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
                  Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => SecondWindow()));
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
                  Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => MainWindow()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Color.fromARGB(255, 70, 97, 154),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
