import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hznb_ips/data/widgets.dart';
import 'package:hznb_ips/data/listen.dart';

class ThirdWindow extends StatelessWidget {
  const ThirdWindow({super.key});

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
            /* Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    'Pflegerischer Verlegungsbericht',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ), */
            Row(
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 350,
                      child: buildSelectedListDropDown(
                        context,
                        'Persönliche Hilfsmittel:',
                        personlicheHilfsmittel,
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
                    SizedBox(
                      width: 100,
                      child: Text('Sonstige:', style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 400,
                      child: loadText(
                        Key('SonstigeHilfsmittel'),
                        'Sonstige Hilfsmittel',
                        'zB. Prothese Bein/Arm, Hörgerät, Brille, Inkontinenzmaterial etc.',
                        TextEditingController(),
                        TextInputType.text,
                        Icon(FontAwesomeIcons.wheelchair),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(color: Colors.grey, thickness: 1),
            Row(
              children: [
                Text(
                  'Besonderheiten:',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text('Allergien:', style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 400,
                      child: loadText(
                        Key('Allergien'),
                        'Allergien',
                        'Allergien',
                        TextEditingController(),
                        TextInputType.text,
                        Icon(Icons.add_alert),
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
                    SizedBox(
                      width: 100,
                      child: Text('Sonstiges:', style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 400,
                      child: loadText(
                        Key('SonstigesBesonderheiten'),
                        'Sonstiges',
                        'ZVK, PEG, Antibiotika, etc.',
                        TextEditingController(),
                        TextInputType.text,
                        Icon(Icons.emergency),
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
                    SizedBox(
                      width: 100,
                      child: Text(
                        'Infektionen:',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 400,
                      child: loadText(
                        Key('Infektionen'),
                        'Infektionen',
                        'z.B. Covid, HIV, MRSA, etc.',
                        TextEditingController(),
                        TextInputType.text,
                        Icon(Icons.coronavirus),
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
                    SizedBox(
                      width: 100,
                      child: Text(
                        'O2 pflicht:',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 400,
                      child: loadText(
                        Key('O2Gabe'),
                        'O2- gabe',
                        'verabreicht über: / Liter / Min',
                        TextEditingController(),
                        TextInputType.text,
                        Icon(Icons.bloodtype),
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
                    SizedBox(
                      width: 100,
                      child: Text(
                        'Iv. Zugang:',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 400,
                      child: loadText(
                        Key('IvZugang'),
                        'Iv. Zugang',
                        'Art/ Lage / Datum(TT.MM.JJJJ) / Wechsel (TT.MM.JJJJ)',
                        TextEditingController(),
                        TextInputType.text,
                        Icon(Icons.vaccines),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: buildSelectedListDropDown(
                    context,
                    '',
                    besonderheitenListe,
                  ),
                ),
              ],
            ),
            Divider(color: Colors.grey, thickness: 1),
            Row(
              children: [
                Text(
                  'Schmerzerfassung:',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
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
                      width: 350,
                      child: loadText(
                        Key('Schmerzprobleme'),
                        'welche?',
                        'welche schmerzbedingte Probleme vor?',
                        TextEditingController(),
                        TextInputType.text,
                        Icon(Icons.personal_injury),
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
                      width: 350,
                      child: loadText(
                        Key('BTMPflaster'),
                        'BTM Pflaster?',
                        'Name, Dosis, Letzter Wechsel(TT.MM.JJJJ)',
                        TextEditingController(),
                        TextInputType.text,
                        Icon(Icons.healing),
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
