import 'package:flutter/material.dart';
import 'package:hznb_ips/data/widgets.dart';
import 'package:hznb_ips/data/listen.dart';

class SixthWindow extends StatelessWidget {
  const SixthWindow({super.key});

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
            Row(
              children: [
                Expanded(
                  child: buildSelectedListDropDown(
                    context,
                    'Atmung',
                    atmungListe,
                  ),
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
                      width: 300,
                      child: loadText(
                        Key('O2BeiBedarf'),
                        'O2 bei Bedarf (L/Min):',
                        'Art, Liter/Min',
                        TextEditingController(),
                        TextInputType.number,
                        Icon(Icons.grain),
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
                      width: 300,
                      child: loadText(
                        Key('O2Pflichtig'),
                        'O2 pflichtig (L/Min):',
                        'Art, Liter/Min',
                        TextEditingController(),
                        TextInputType.number,
                        Icon(Icons.grain),
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
                      width: 300,
                      child: loadText(
                        Key('Besonderheiten'),
                        'Besonderheiten:',
                        'Beschreibung',
                        TextEditingController(),
                        TextInputType.text,
                        Icon(Icons.assignment),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(color: Colors.grey, thickness: 1),
            Row(
              children: [
                Expanded(
                  child: buildSelectedListDropDown(
                    context,
                    'Schlaf',
                    schlafListe,
                  ),
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
                      width: 300,
                      child: loadText(
                        Key('SchlafBesonderheiten'),
                        'Besonderheiten:',
                        'Beschreibung',
                        TextEditingController(),
                        TextInputType.text,
                        Icon(Icons.assignment),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(color: Colors.grey, thickness: 1),
            Row(
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
                      width: 190,
                      child: loadText(
                        Key('Gewicht'),
                        'Gewicht:',
                        'Kg',
                        TextEditingController(),
                        TextInputType.number,
                        Icon(Icons.scale),
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
                        padding: const EdgeInsets.only(left: 1.0),
                        child: loadText(
                          Key('Groesse'),
                          'Größe:',
                          'Cm',
                          TextEditingController(),
                          TextInputType.number,
                          Icon(Icons.height),
                        ),
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
                  child: Column(children: [TwoSegmentedButtonChoice()]),
                ),
              ],
            ),
            Row(
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
                      SizedBox(width: 165, child: TwoSegmentedButtonChoice()),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 200,
                      child: loadText(
                        Key('GewichtskontrolleHaeufigkeit'),
                        'Häufigkeit:',
                        'mal pro Woche',
                        TextEditingController(),
                        TextInputType.number,
                        Icon(Icons.monitor_weight),
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
                  child: Column(children: [TwoSegmentedButtonChoice()]),
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
                  child: Column(children: [TwoSegmentedButtonChoice()]),
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
                        'Stuhlgang regelmäßig:',
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
                  child: Column(children: [TwoSegmentedButtonChoice()]),
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
                    SizedBox(
                      width: 350,
                      child: loadText(
                        Key('LetzteStuhlgang'),
                        'Letzte Stuhlgang:',
                        'Datum (TT.MM.JJJJ)',
                        TextEditingController(),
                        TextInputType.datetime,
                        Icon(Icons.calendar_today),
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
                        'regelmäßige Einnahme \n von Abführmitteln:',
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
                      width: 350,
                      child: loadText(
                        Key('Abfuehrmittel'),
                        'Abführmittel:',
                        'Abführmittel, Dosierung, letzte Einnahme (TT.MM.JJJJ)',
                        TextEditingController(),
                        TextInputType.text,
                        Icon(Icons.calendar_today),
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
                  child: Column(children: [TwoSegmentedButtonChoice()]),
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
                        child: buildDropDown(
                          context,
                          'Stoma-versorgung',
                          stomaVersorgung,
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
