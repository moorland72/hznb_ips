import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hznb_ips/data/unterlagen.dart';
import 'package:hznb_ips/data/widgets.dart';
import 'package:hznb_ips/data/listen.dart';
import 'package:hznb_ips/screens/selected_unterlagen_string.dart';

class SixthWindow extends StatefulWidget {
  const SixthWindow({super.key});

  @override
  State<SixthWindow> createState() => _SixthWindowState();
}

class _SixthWindowState extends State<SixthWindow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HzNB - Pflegerischer Verlegungsbericht'),
        backgroundColor: const Color.fromARGB(255, 70, 97, 154),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              //Kopfzeile mit Logo
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset('images/hznb_logo_klein.png', height: 50),
                ),
              ],
            ),
            Divider(color: Colors.grey, thickness: 1),
            Row(
              //Schlaf
              children: [
                Expanded(
                  child: Text(
                    'Atmung:',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              //Atmung
              children: [
                SizedBox(
                  width: 350,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListView(
                      shrinkWrap: true,
                      children: atmungListeOption.keys.map((String key) {
                        return CheckboxListTile(
                          title: Text(key),
                          value: atmungListeOption[key],
                          onChanged: (bool? value) {
                            setState(() {
                              atmungListeOption[key] = value!;
                              if (value == true) {
                                unterlagen[key] = 'true\n';
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
            Row(
              //O2 bei Bedarf, O2 pflichtig, Besonderheiten
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        'O2 bei Bedarf  \n (L/Min):',
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
                      width: 380,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextField(
                          key: Key('O2BeiBedarf'),
                          controller: o2BeiBedarfController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'O2 bei Bedarf (L/Min):',
                            hintText: 'z.B. 2 L/Min bei Belastung',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(FontAwesomeIcons.maskVentilator),
                          ),
                          onChanged: (value) {
                            unterlagen['O2BeiBedarf'] = '$value\n';
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              //O2 pflichtig, Besonderheiten
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        'O2 pflichtig  \n (L/Min):',
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
                      width: 380,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextField(
                          key: Key('O2Pflichtig'),
                          controller: o2PflichtigController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'O2 pflichtig (L/Min):',
                            hintText: 'z.B. 2 L/Min bei Belastung',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(FontAwesomeIcons.maskVentilator),
                          ),
                          onChanged: (value) {
                            unterlagen['O2Pflichtig'] = '$value\n';
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              //Besonderheiten
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        'Besonderheiten:',
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
                      width: 380,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextField(
                          key: Key('O2Besonderheiten'),
                          controller: o2BesonderheitenController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'O2 Besonderheiten:',
                            hintText: 'O2 Besonderheiten',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(FontAwesomeIcons.teamspeak),
                          ),
                          onChanged: (value) {
                            unterlagen['O2Besonderheiten'] = '$value\n';
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(color: Colors.grey, thickness: 1),
            Row(
              //Schlafprobleme
              //Schlafprobleme
              children: [
                Expanded(
                  child: Text(
                    'Schlaf:',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              //Schlaf optionen
              //Schlaf
              children: [
                SizedBox(
                  width: 350,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListView(
                      shrinkWrap: true,
                      children: schlafListeOption.keys.map((String key) {
                        return CheckboxListTile(
                          title: Text(key),
                          value: schlafListeOption[key],
                          onChanged: (bool? value) {
                            setState(() {
                              schlafListeOption[key] = value!;
                              if (value == true) {
                                unterlagen[key] = 'true\n';
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
            Row(
              // Schlaf
              //Schlaf
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        'Besonderheiten:',
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
                      width: 380,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextField(
                          key: Key('SchlafBesonderheiten'),
                          controller: schlafBesonderheitenController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Besonderheiten:',
                            hintText: 'z.B. Schnarchen, Schlafapnoe',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(FontAwesomeIcons.viruses),
                          ),
                          onChanged: (value) {
                            unterlagen['SchlafBesonderheiten'] = '$value\n';
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(color: Colors.grey, thickness: 1),
            Row(
              // Gewicht und Größe
              //Gewicht und Größe
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 80,
                      child: Text(
                        'Gewicht:',
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
                      width: 185,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextField(
                          key: Key('Gewicht'),
                          controller: gewichtController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Gewicht:',
                            hintText: 'z.B. 70 Kg',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(FontAwesomeIcons.scaleBalanced),
                          ),
                          onChanged: (value) {
                            unterlagen['Gewicht'] = '$value\n';
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Größe:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 185,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextField(
                          key: Key('Groesse'),
                          controller: groesseController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Größe:',
                            hintText: 'z.B. 180 cm',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(FontAwesomeIcons.viruses),
                          ),
                          onChanged: (value) {
                            unterlagen['Groesse'] = '$value\n';
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              //Flüssigkeitsbilanz
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          'Flüssigkeitsbilanz:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 200,
                        child: SegmentedButton<TwoWahlOptions>(
                          key: Key('Fluessigkeitsbilanz'),
                          style: SegmentedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              255,
                              255,
                              255,
                              255,
                            ),
                            foregroundColor: Colors.black,
                            selectedForegroundColor: const Color.fromARGB(
                              255,
                              255,
                              255,
                              255,
                            ),
                            selectedBackgroundColor: Colors.green,
                            side: BorderSide(
                              color: Color.fromARGB(255, 37, 34, 125),
                            ),
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
                          selected: <TwoWahlOptions>{optionsFluessigkeitBilanz},
                          onSelectionChanged:
                              (Set<TwoWahlOptions> newSelection) {
                                setState(() {
                                  optionsFluessigkeitBilanz =
                                      newSelection.first;
                                  if (optionsFluessigkeitBilanz ==
                                      TwoWahlOptions.ja) {
                                    unterlagen['Flüssigkeitsbilanz'] = 'ja\n';
                                  } else {
                                    unterlagen.remove('Flüssigkeitsbilanz');
                                  }
                                  /* unterlagen['Flüssigkeitsbilanz'] =
                                      '$optionsFluessigkeitBilanz\n'; */
                                });
                              },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              //Gewichtskontrolle
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          'Gewichtskontrolle:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                     SizedBox(
                        width: 200,
                        child: SegmentedButton<TwoWahlOptions>(
                          key: Key('Gewichtskontrolle'),
                          style: SegmentedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              255,
                              255,
                              255,
                              255,
                            ),
                            foregroundColor: Colors.black,
                            selectedForegroundColor: const Color.fromARGB(
                              255,
                              255,
                              255,
                              255,
                            ),
                            selectedBackgroundColor: Colors.green,
                            side: BorderSide(
                              color: Color.fromARGB(255, 37, 34, 125),
                            ),
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
                          selected: <TwoWahlOptions>{optionGewichtKontrolle},
                          onSelectionChanged:
                              (Set<TwoWahlOptions> newSelection) {
                                setState(() {
                                  optionGewichtKontrolle = newSelection.first;
                                  if (optionGewichtKontrolle == TwoWahlOptions.ja) {
                                    unterlagen['Gewichtskontrolle'] = 'ja\n';
                                  } else {
                                    unterlagen.remove('Gewichtskontrolle');
                                  }
                                  /* unterlagen['Flüssigkeitsbilanz'] =
                                      '$optionsFluessigkeitBilanz\n'; */
                                });
                              },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 150.0),
                  child: SizedBox(
                    width: 380,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                        key: Key('GewichtskontrolleHaeufigkeit'),
                        controller: gewichtskontrolleHaeufigkeitController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: 'Gewichtskontrolle Häufigkeit:',
                          hintText: 'z.B. 2 mal pro Woche',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(FontAwesomeIcons.weightScale),
                        ),
                        onChanged: (value) {
                          unterlagen['GewichtskontrolleHaeufigkeit'] =
                              '$value\n';
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              //Urininkontinenz
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        'Urininkontinenz:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    SizedBox(
                        width: 200,
                        child: SegmentedButton<TwoWahlOptions>(
                          key: Key('UrinInkontinenz'),
                          style: SegmentedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              255,
                              255,
                              255,
                              255,
                            ),
                            foregroundColor: Colors.black,
                            selectedForegroundColor: const Color.fromARGB(
                              255,
                              255,
                              255,
                              255,
                            ),
                            selectedBackgroundColor: Colors.green,
                            side: BorderSide(
                              color: Color.fromARGB(255, 37, 34, 125),
                            ),
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
                          selected: <TwoWahlOptions>{optionUrinInkontinenz},
                          onSelectionChanged:
                              (Set<TwoWahlOptions> newSelection) {
                                setState(() {
                                  optionUrinInkontinenz = newSelection.first;
                                  if (optionUrinInkontinenz == TwoWahlOptions.ja) {
                                    unterlagen['Urininkontinenz'] = 'ja\n';
                                  } else {
                                    unterlagen.remove('Urininkontinenz');
                                  }
                                });
                              },
                        ),
                      ),]),
                ),
              ],
            ),
            Row(
              //Stuhlinkontinenz
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        'Stuhlinkontinenz:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    SizedBox(
                        width: 200,
                        child: SegmentedButton<TwoWahlOptions>(
                          key: Key('StuhlInkontinenz'),
                          style: SegmentedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              255,
                              255,
                              255,
                              255,
                            ),
                            foregroundColor: Colors.black,
                            selectedForegroundColor: const Color.fromARGB(
                              255,
                              255,
                              255,
                              255,
                            ),
                            selectedBackgroundColor: Colors.green,
                            side: BorderSide(
                              color: Color.fromARGB(255, 37, 34, 125),
                            ),
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
                          selected: <TwoWahlOptions>{optionStuhlInkontinenz},
                          onSelectionChanged:
                              (Set<TwoWahlOptions> newSelection) {
                                setState(() {
                                  optionStuhlInkontinenz = newSelection.first;
                                  if (optionStuhlInkontinenz == TwoWahlOptions.ja) {
                                    unterlagen['Stuhlinkontinenz'] = 'ja\n';
                                  } else {
                                    unterlagen.remove('Stuhlinkontinenz');
                                  }
                                });
                              },
                        ),
                      ),
                  ]),
                ),
              ],
            ),
            Row(
              //Stuhlgang regelmäßig
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        'Regelmäßige Stuhlgang:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    SizedBox(
                        width: 200,
                        child: SegmentedButton<TwoWahlOptions>(
                          key: Key('RegelmaessigStuhlgang'),
                          style: SegmentedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              255,
                              255,
                              255,
                              255,
                            ),
                            foregroundColor: Colors.black,
                            selectedForegroundColor: const Color.fromARGB(
                              255,
                              255,
                              255,
                              255,
                            ),
                            selectedBackgroundColor: Colors.green,
                            side: BorderSide(
                              color: Color.fromARGB(255, 37, 34, 125),
                            ),
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
                          selected: <TwoWahlOptions>{optionStuhlgangRegelmaessig},
                          onSelectionChanged:
                              (Set<TwoWahlOptions> newSelection) {
                                setState(() {
                                  optionStuhlgangRegelmaessig = newSelection.first;
                                  if (optionStuhlgangRegelmaessig == TwoWahlOptions.ja) {
                                    unterlagen['RegelmaessigStuhlgang'] = 'ja\n';
                                  } else {
                                    unterlagen.remove('RegelmaessigStuhlgang');
                                  }
                                });
                              },
                        ),
                      ),
                  ]),
                ),
              ],
            ),
            Row(
              //Letzte Stuhlgang
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        'Letzte Stuhlgang:',
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
                    Column(
                      children: [
                        SizedBox(
                          width: 380,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextField(
                              key: Key('LetzteStuhlgang'),
                              controller: letzteStuhlgangController,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                labelText: 'Letzte Stuhlgang:',
                                hintText: 'Datum (TT.MM.JJJJ)',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(FontAwesomeIcons.calendar),
                              ),
                              onChanged: (value) {
                                unterlagen['LetzteStuhlgang'] = '$value\n';
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              //Abführmittel
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        'regelmäßige Einnahme \nvon Abführmitteln:',
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
                    Column(
                      children: [
                        SizedBox(
                          width: 380,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextField(
                              key: Key('abfuehrmittel'),
                              controller: abfuehrmittelController,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                labelText: 'Abführmittel:',
                                hintText: 'z.B. welche, wie oft, wann',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(FontAwesomeIcons.pills),
                              ),
                              onChanged: (value) {
                                unterlagen['Abfuehrmittel'] = '$value\n';
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              //Stoma
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        'Stoma:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    SizedBox(
                        width: 200,
                        child: SegmentedButton<TwoWahlOptions>(
                          key: Key('Stoma'),
                          
                          style: SegmentedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              255,
                              255,
                              255,
                              255,
                            ),
                            foregroundColor: Colors.black,
                            selectedForegroundColor: const Color.fromARGB(
                              255,
                              255,
                              255,
                              255,
                            ),
                            selectedBackgroundColor: Colors.green,
                            side: BorderSide(
                              color: Color.fromARGB(255, 37, 34, 125),
                            ),
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
                          selected: <TwoWahlOptions>{optionStoma},
                          onSelectionChanged:
                              (Set<TwoWahlOptions> newSelection) {
                                setState(() {
                                  optionStoma = newSelection.first;
                                  if (optionStoma == TwoWahlOptions.ja) {
                                    unterlagen['Stoma'] = 'ja\n';
                                    if (stomaVersorgungController.text.isNotEmpty) {
                                      unterlagen['Stomaversorgung'] =
                                          '${stomaVersorgungController.text}\n';
                                    }
                                  } else {
                                    unterlagen.remove('Stoma');
                                  }
                                });
                              },
                        ),
                      ),
                  ]),
                ),
              ],
            ),
            Row(
              //Stoma-versorgung
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        'Stoma-versorgung:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          key: Key('StomaVersorgung'),

                          items: stomaVersorgung.map((String mobilitaet) {
                            return DropdownMenuItem(
                              value: mobilitaet,
                              child: Text(mobilitaet),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              if (optionStoma == TwoWahlOptions.nein) {
                                unterlagen.remove('Stomaversorgung');
                              }
                              else {
                                unterlagen['Stomaversorgung'] = '$value\n';
                              }
                              stomaVersorgungController.text = value.toString();
                            });
                          },
                          value: stomaVersorgungController.text.isEmpty
                              ? null
                              : stomaVersorgungController.text,
                          hint: Text('Stoma Versorgung'),
                          isExpanded: true,
                        ),
                      ),
                    ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(context, '/fifth', '/main'),
    );
  }
}
