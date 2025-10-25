import 'package:flutter/material.dart';
import 'package:hznb_ips/data/unterlagen.dart';
import 'package:hznb_ips/data/widgets.dart';
import 'package:hznb_ips/data/listen.dart';
import 'package:hznb_ips/screens/selected_unterlagen_string.dart';

class FifthWindow extends StatefulWidget {
  const FifthWindow({super.key});

  @override
  State<FifthWindow> createState() => _FifthWindowState();
}

class _FifthWindowState extends State<FifthWindow> {
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
              //Körperpflege/ Kleidung
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    'Körperpflege/ Kleidung',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              //Waschen
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text('Waschen:', style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          key: Key('Waschen'),
                          items: mobilitaetOptions.map((String mobilitaet) {
                            return DropdownMenuItem(
                              value: mobilitaet,
                              child: Text(mobilitaet),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              waschenController.text = value.toString();
                              unterlagen['waschen'] = '$value\n';
                            });
                          },
                          value: waschenController.text.isEmpty
                              ? null
                              : waschenController.text,
                          hint: Text('Waschen'),
                          isExpanded: true,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          items: korperPflegeOrtOption.map((
                            String korperPflegeOrt,
                          ) {
                            return DropdownMenuItem(
                              value: korperPflegeOrt,
                              child: Text(korperPflegeOrt),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              waschenOrtController.text = value.toString();
                              unterlagen['WaschenOrt'] = '$value\n';
                            });
                          },
                          value: waschenOrtController.text.isEmpty
                              ? null
                              : waschenOrtController.text,
                          hint: Text('waschen Wo?'),
                          isExpanded: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              //Mundpflege
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        'Mundpflege:',
                        style: TextStyle(fontSize: 16),
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton(
                            items: mobilitaetOptions.map((String mobilitaet) {
                              return DropdownMenuItem(
                                value: mobilitaet,
                                child: Text(mobilitaet),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                mundPflegeController.text = value.toString();
                                unterlagen['Mundpflege'] = '$value\n';
                              });
                            },
                            value: mundPflegeController.text.isEmpty
                                ? null
                                : mundPflegeController.text,
                            hint: Text('Mundpflege'),
                            isExpanded: true,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          items: korperPflegeOrtOption.map((
                            String korperPflegeOrt,
                          ) {
                            return DropdownMenuItem(
                              value: korperPflegeOrt,
                              child: Text(korperPflegeOrt),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              mundPflegeOrtController.text = value.toString();
                              unterlagen['MundpflegeOrt'] = '$value\n';
                            });
                          },
                          value: mundPflegeOrtController.text.isEmpty
                              ? null
                              : mundPflegeOrtController.text,
                          hint: Text('Mundpflege Wo?'),
                          isExpanded: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              //Zahnprothese
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        'Zahnprothese:',
                        style: TextStyle(fontSize: 16),
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton(
                            items: mobilitaetOptions.map((String mobilitaet) {
                              return DropdownMenuItem(
                                value: mobilitaet,
                                child: Text(mobilitaet),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                zahnProteseController.text = value.toString();
                                unterlagen['Zahnprothese'] = '$value\n';
                              });
                            },
                            value: zahnProteseController.text.isEmpty
                                ? null
                                : zahnProteseController.text,
                            hint: Text('Zahnprothese'),
                            isExpanded: true,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              //Rasieren
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text('Rasieren:', style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                        width: 200,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton(
                            items: mobilitaetOptions.map((String mobilitaet) {
                              return DropdownMenuItem(
                                value: mobilitaet,
                                child: Text(mobilitaet),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                rasierenController.text = value.toString();
                                unterlagen['Rasieren'] = '$value\n';
                              });
                            },
                            value: rasierenController.text.isEmpty
                                ? null
                                : rasierenController.text,
                            hint: Text('Rasieren'),
                            isExpanded: true,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          items: korperPflegeOrtOption.map((
                            String korperPflegeOrt,
                          ) {
                            return DropdownMenuItem(
                              value: korperPflegeOrt,
                              child: Text(korperPflegeOrt),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              rasierenOrtController.text = value.toString();
                              unterlagen['RasierenOrt'] = '$value\n';
                            });
                          },
                          value: rasierenOrtController.text.isEmpty
                              ? null
                              : rasierenOrtController.text,
                          hint: Text('Rasieren Wo?'),
                          isExpanded: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              //An- / Auskleiden
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        'An- / Auskleiden:',
                        style: TextStyle(fontSize: 16),
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton(
                            items: mobilitaetOptions.map((String mobilitaet) {
                              return DropdownMenuItem(
                                value: mobilitaet,
                                child: Text(mobilitaet),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                anausKleidenController.text = value.toString();
                                unterlagen['An- / Auskleiden'] = '$value\n';
                              });
                            },
                            value: anausKleidenController.text.isEmpty
                                ? null
                                : anausKleidenController.text,
                            hint: Text('An- / Auskleiden'),
                            isExpanded: true,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          items: korperPflegeOrtOption.map((
                            String korperPflegeOrt,
                          ) {
                            return DropdownMenuItem(
                              value: korperPflegeOrt,
                              child: Text(korperPflegeOrt),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              anausKleidenOrtController.text = value.toString();
                              unterlagen['An-/Auskleiden'] = '$value\n';
                            });
                          },
                          value: anausKleidenOrtController.text.isEmpty
                              ? null
                              : anausKleidenOrtController.text,
                          hint: Text('An- / Auskleiden Wo?'),
                          isExpanded: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(color: Colors.grey, thickness: 1),
            Row(
              //Ernährung
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    'Ernährung',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              //Kostform
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text('Kostform:', style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 400,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextField(
                          key: Key('Kostform'),
                          controller: kostformController,
                          decoration: InputDecoration(
                            labelText: 'Kostform:',
                            hintText: 'Kostform: z.B. püriert, flüssig',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.restaurant_menu),
                          ),
                          onChanged: (value) {
                            unterlagen['Kostform'] = '$value\n';
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              //Schluckstörung
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        'Schluckstörung: ',
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
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                        width: 200,
                        child: SegmentedButton<TwoWahlOptions>(
                          key: Key('Schluckstoerung'),
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
                          selected: <TwoWahlOptions>{optionsSchluckstoerung},
                          onSelectionChanged:
                              (Set<TwoWahlOptions> newSelection) {
                                setState(() {
                                  optionsSchluckstoerung = newSelection.first;
                                  unterlagen['Schluckstoerung'] =
                                      '$optionsSchluckstoerung\n';
                                });
                              },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              //Hilfstellung Essen
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        'Hilfstellung:',
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
                          items: essenOptions.map((String essen) {
                            return DropdownMenuItem(
                              value: essen,
                              child: Text(essen),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              essenController.text = value.toString();
                              unterlagen['Hilfstellung'] = '$value\n';
                            });
                          },
                          value: essenController.text.isEmpty
                              ? null
                              : essenController.text,
                          hint: Text('Essen'),
                          isExpanded: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              //Trinkverhalten
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        'Trinkverhalten:',
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
                          items: trinkenOptions.map((String trinken) {
                            return DropdownMenuItem(
                              value: trinken,
                              child: Text(trinken),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              trinkenController.text = value.toString();
                              unterlagen['TrinkenVerhalten'] = '$value\n';
                            });
                          },
                          value: trinkenController.text.isEmpty
                              ? null
                              : trinkenController.text,
                          hint: Text('Trinkenverhalten'),
                          isExpanded: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              //Trinkverhalten Details
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        'andicken mit:',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 400,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextField(
                          key: Key('AndickenMit'),
                          controller: andickenMitController,
                          decoration: InputDecoration(
                            labelText: 'Andicken mit:',
                            hintText: 'Andicken mit: z.B. Stärke, Pudding',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.local_drink),
                          ),
                          onChanged: (value) {
                            unterlagen['AndickenMit'] = '$value\n';
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              //Tägliche Trinkmenge
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        'Tägliche Trinkmenge:',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 400,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextField(
                          key: Key('TaeglicheTrinkmenge'),
                          controller: taeglicheTrinkmengeController,
                          decoration: InputDecoration(
                            labelText: 'Tägliche Trinkmenge:',
                            hintText: 'Tägliche Trinkmenge in ml',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.water_drop),
                          ),
                          onChanged: (value) {
                            unterlagen['TaeglicheTrinkmenge'] = '$value\n';
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
              //Sondenkost
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        'Sondenkost:',
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
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                        width: 200,
                        child: SegmentedButton<TwoWahlOptions>(
                          key: Key('Sondenkost'),
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
                          selected: <TwoWahlOptions>{optionsSondenkost},
                          onSelectionChanged:
                              (Set<TwoWahlOptions> newSelection) {
                                setState(() {
                                  optionsSondenkost = newSelection.first;
                                  unterlagen['Sondenkost'] = '$newSelection\n';
                                });
                              },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              //Sondenart
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        'Art des Sonden:',
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
                          items: sondenArt.map((String sondenArt) {
                            return DropdownMenuItem(
                              value: sondenArt,
                              child: Text(sondenArt),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              sondenArtController.text = value.toString();
                              unterlagen['SondenArt'] = '$value\n';
                            });
                          },
                          value: sondenArtController.text.isEmpty
                              ? null
                              : sondenArtController.text,
                          hint: Text('Sondenart'),
                          isExpanded: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              //Sondengelegt am
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text('gelegt am:', style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 400,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextField(
                          key: Key('SondengelegtAm'),
                          controller: sondengelegtAmController,
                          decoration: InputDecoration(
                            labelText: 'gelegt am:',
                            hintText: 'Datum der Anlage (TT.MM.JJJJ)',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.calendar_month),
                          ),
                          inputFormatters: [dateFormatter],
                          onChanged: (value) {
                            unterlagen['SondengelegtAm'] = '$value\n';
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              //Letzter Verbandwechsel
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        'Letzter Vw:',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 400,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextField(
                          key: Key('LetzterVerbandwechsel'),
                          controller: letzterVerbandwechselController,
                          decoration: InputDecoration(
                            labelText: 'Letzter Verbandwechsel:',
                            hintText: 'Letzter Verbandwechsel (TT.MM.JJJJ)',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.calendar_month),
                          ),
                          inputFormatters: [dateFormatter],
                          onChanged: (value) {
                            unterlagen['LetzterVerbandwechsel'] = '$value\n';
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              //Mengenangaben Sondenkost
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        'Menge der Sondenkost:',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 400,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextField(
                          key: Key('MengeDerSondenkost'),
                          controller: mengeDerSondenkostController,
                          decoration: InputDecoration(
                            labelText: 'Menge der Sondenkost in ml:',
                            hintText: 'Menge der Sondenkost in ml',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.local_drink),
                          ),
                          onChanged: (value) {
                            unterlagen['MengeDerSondenkost'] = '$value\n';
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              //Mengenangaben Tee/Wasser
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        'Menge der Tee/Wasser:',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 400,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextField(
                          key: Key('MengeDerTeeWasser'),
                          controller: mengeDerTeeWasserController,
                          decoration: InputDecoration(
                            labelText: 'Menge der Tee/Wasser in ml:',
                            hintText: 'Menge der Tee/Wasser in ml',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.local_drink),
                          ),
                          onChanged: (value) {
                            unterlagen['MengeDerTeeWasser'] = '$value\n';
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
      ),
      bottomNavigationBar: buildBottomNavigationBar(
        context,
        '/fourth',
        '/sixth',
      ),
    );
  }
}
