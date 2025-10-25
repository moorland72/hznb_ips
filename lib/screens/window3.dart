import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hznb_ips/data/unterlagen.dart';
import 'package:hznb_ips/data/widgets.dart';
import 'package:hznb_ips/data/listen.dart';
import 'package:hznb_ips/screens/selected_unterlagen_string.dart';



class ThirdWindow extends StatefulWidget {
  const ThirdWindow({super.key});

  @override
  State<ThirdWindow> createState() => _ThirdWindowState();
}

class _ThirdWindowState extends State<ThirdWindow> {
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
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset('images/hznb_logo_klein.png', height: 50),
                ),
              ],
            ),
            Divider(color: Colors.grey, thickness: 1),
            Row(// Persönliche Hilfsmittel Checkboxen
              children: [
                Column(
                  children:  <Widget>[
                SizedBox(
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListView(
                      shrinkWrap: true,
                      children: personlicheHilfsmittel.keys.map((String key) {
                        return CheckboxListTile(
                          title: Text(key),
                          value: personlicheHilfsmittel[key],
                          onChanged: (bool? value) {
                            setState(() {
                              personlicheHilfsmittel[key] = value!;
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
              ],
            ),
            Row(// Sonstige Hilfsmittel Textfeld
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SizedBox(
                        width: 80,
                        child: Text('Sonstige:', style: TextStyle(fontSize: 16)),
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
                            key: Key('SonstigeHilfsmittel'),
                            controller: sonstigeHilfsmittelController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              labelText: 'Sonstige Hilfsmittel:',
                              hintText: 'zB. Prothese Bein/Arm, Hörgerät, Brille, Inkontinenzmaterial etc.',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.elderly),
                            ),
                            onChanged: (value) {
                              unterlagen['SonstigeHilfsmittel'] = '$value\n';
                            },
                          ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(color: Colors.grey, thickness: 1),
            Row(// Besonderheiten Überschrift
              children: [
                Text(
                  'Besonderheiten:',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(// Allergien Textfeld
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                        width: 100,
                        child: Text('Allergien:', style: TextStyle(fontSize: 16)),
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
                            key: Key('Allergien'),
                            controller: allergienController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              labelText: 'Allergien:',
                              hintText: 'z.B. Pollen, Nüsse, etc.',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(FontAwesomeIcons.viruses),
                            ),
                            onChanged: (value) {
                              unterlagen['Allergien'] = '$value\n';
                            },
                          ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(// Sonstige Hilfsmittel Textfeld
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                        width: 100,
                        child: Text('Sonstiges:', style: TextStyle(fontSize: 16)),
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
                            key: Key('SonstigesBesonderheiten'),
                            controller: sonstigesBesonderheitenController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              labelText: 'Sonstiges:',
                              hintText: 'ZVK, PEG, Antibiotika, etc.',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(FontAwesomeIcons.squarePlus),
                            ),
                            onChanged: (value) {
                              unterlagen['SonstigesBesonderheiten'] = '$value\n';
                            },
                          ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(//Infektionen Textfeld
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                        width: 100,
                        child: Text(
                          'Infektionen:',
                          style: TextStyle(fontSize: 16),
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
                            key: Key('Infektionen'),
                            controller: infektionenController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              labelText: 'Infektionen:',
                              hintText: 'MRSA, Covid, etc.',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(FontAwesomeIcons.shieldVirus),
                            ),
                            onChanged: (value) {
                              unterlagen['Infektionen'] = '$value\n';
                            },
                          ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(// O2 Pflicht Textfeld
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                        width: 100,
                        child: Text(
                          'O2 pflicht:',
                          style: TextStyle(fontSize: 16),
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
                            key: Key('O2Pflicht'),
                            controller: o2PflichtController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              labelText: 'O2 Pflicht:',
                              hintText: 'ZVK, PEG, Antibiotika, etc.',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(FontAwesomeIcons.lungs),
                            ),
                            onChanged: (value) {
                              unterlagen['O2Pflicht'] = '$value\n';
                            },
                          ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(// Iv. Zugang Textfeld
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                        width: 100,
                        child: Text(
                          'Iv. Zugang:',
                          style: TextStyle(fontSize: 16),
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
                            key: Key('IvZugang'),
                            controller: ivZugangController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              labelText: 'Iv. Zugang:',
                              hintText: 'Art/ Lage / Datum(TT.MM.JJJJ) / Wechsel (TT.MM.JJJJ)',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(FontAwesomeIcons.syringe),
                            ),
                            onChanged: (value) {
                              unterlagen['IvZugang'] = '$value\n';
                            },
                          ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(// Besonderheiten Checkboxen
              children: [
                Column(
                  children:  <Widget>[
                SizedBox(
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListView(
                      shrinkWrap: true,
                      children: besonderheitenListe.keys.map((String key) {
                        return CheckboxListTile(
                          title: Text(key),
                          value: besonderheitenListe[key],
                          onChanged: (bool? value) {
                            setState(() {
                              besonderheitenListe[key] = value!;
                              if (value == true) {
                                besonderheitenListeArray.add(
                                  besonderheitenListe.keys.firstWhere(
                                    (k) =>
                                        besonderheitenListe[k] == value &&
                                        k == key,
                                  ),
                                );
                              } else {
                                besonderheitenListeArray.remove(
                                  besonderheitenListe.keys.firstWhere(
                                    (k) =>
                                        besonderheitenListe[k] == value &&
                                        k == key,
                                  ),
                                );
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
              ],
            ),
            Divider(color: Colors.grey, thickness: 1),
            Row(// Schmerzerfassung Überschrift
              children: [
                Column(
                  children: [
                    Text(
                      'Schmerzerfassung:',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                
              ],
            ),
            Row(// Schmerzerfassung Auswahl
              children: [
                Column(
                  children: [
                     SizedBox(
                      width: 150,
                      child: Text(
                        'zurzeit schmerzbedingte Probleme:',
                        style: TextStyle(fontSize: 16),
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
                            key: Key('aktuelleSchmerzprobleme'),
                            controller: aktuelleSchmerzproblemeController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              labelText: 'Aktuelle Schmerzprobleme:',
                              hintText: 'Aktuelle schmerzbedingte Probleme',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(FontAwesomeIcons.headSideVirus),
                            ),
                            onChanged: (value) {
                              unterlagen['aktuelleSchmerzprobleme'] = '$value\n';
                            },
                          ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(// BTM Pflaster Auswahl
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        'BTM Pflaster:',
                        style: TextStyle(fontSize: 16),
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
                            key: Key('btmPflaster'),
                            controller: btmPflasterController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              labelText: 'BTM Pflaster:',
                              hintText: 'Name, Dosis, Letzter Wechsel(TT.MM.JJJJ)',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.healing),
                            ),
                            onChanged: (value) {
                              unterlagen['btmPflaster'] = '$value\n';
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
        '/second',
        '/fourth',
      ),
    );
  }
}
