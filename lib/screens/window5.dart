import 'package:flutter/material.dart';
import 'package:hznb_ips/data/widgets.dart';
import 'package:hznb_ips/data/listen.dart';

class FifthWindow extends StatelessWidget {
  const FifthWindow({super.key});

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
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                        width: 170,
                        child: buildDropDown(
                          context,
                          'Waschen',
                          mobilitaetOptions,
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
                        width: 170,
                        child: buildDropDown(
                          context,
                          'Waschen',
                          korperPflegeOrt,
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
                        width: 170,
                        child: buildDropDown(
                          context,
                          'Mundpflege',
                          mobilitaetOptions,
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
                        width: 170,
                        child: buildDropDown(
                          context,
                          'Mundpflege',
                          korperPflegeOrt,
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
                        width: 170,
                        child: buildDropDown(
                          context,
                          'Zahnprothese',
                          mobilitaetOptions,
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
                      child: Text('Rasieren:', style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                        width: 170,
                        child: buildDropDown(
                          context,
                          'Rasieren',
                          mobilitaetOptions,
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
                        width: 170,
                        child: buildDropDown(
                          context,
                          'Rasieren',
                          korperPflegeOrt,
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
                        width: 170,
                        child: buildDropDown(
                          context,
                          'An- / Auskleiden',
                          mobilitaetOptions,
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
                        width: 170,
                        child: buildDropDown(
                          context,
                          'An- / Auskleiden',
                          korperPflegeOrt,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(color: Colors.grey, thickness: 1),
            Row(
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
                      child: loadText(
                        Key('Kostform'),
                        'Kostform',
                        'Kostform',
                        TextEditingController(),
                        TextInputType.text,
                        Icon(Icons.restaurant_menu),
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
                      child: TwoSegmentedButtonChoice(),
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
                      child: buildDropDown(
                        context,
                        'Hilfstellung',
                        essenOptions,
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
                      child: buildDropDown(
                        context,
                        'Trinkverhalten',
                        trinkenOptions,
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
                      child: loadText(
                        Key('andickenMit'),
                        'andicken mit:',
                        'andicken mit:',
                        TextEditingController(),
                        TextInputType.text,
                        Icon(Icons.no_drinks),
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
                      child: loadText(
                        Key('TäglicheTrinkmenge'),
                        'Tägliche Trinkmenge',
                        'Tägliche Trinkmenge in ml',
                        TextEditingController(),
                        TextInputType.text,
                        Icon(Icons.liquor),
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
                      child: TwoSegmentedButtonChoice(),
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
                      child: buildDropDown(context, 'SondenArt', sondenArt),
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
                      child: Text('gelegt am:', style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 400,
                      child: loadText(
                        Key('SondengelegtAm'),
                        'gelegt am',
                        'Datum der Anlage (TT.MM.JJJJ)',
                        TextEditingController(),
                        TextInputType.number,
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
                      child: loadText(
                        Key('LetzterVerbandwechsel'),
                        'Letzter Vw',
                        'Letzter Verbandwechsel (TT.MM.JJJJ)',
                        TextEditingController(),
                        TextInputType.number,
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
                      child: loadText(
                        Key('MengeDerSondenkost'),
                        'Menge der Sondenkost',
                        'Menge der Sondenkost in ml',
                        TextEditingController(),
                        TextInputType.number,
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
                      child: loadText(
                        Key('MengeDerTeeWasser'),
                        'Menge der Tee/Wasser',
                        'Menge der Tee/Wasser in ml',
                        TextEditingController(),
                        TextInputType.number,
                        Icon(Icons.water_drop),
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
