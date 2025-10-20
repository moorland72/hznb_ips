import 'package:flutter/material.dart';
import 'package:hznb_ips/data/widgets.dart';
import 'package:hznb_ips/data/listen.dart';

class VierteWindow extends StatelessWidget {
  const VierteWindow({super.key});

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
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    'Neuroliogische Aspekte',
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
                      width: 200,
                      child: Text(
                        'Bewusstseinslage:',
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
                        'Bewusstsein',
                        bewustseinOptions,
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
                      width: 200,
                      child: Text(
                        'Verhaltensweisen:',
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
                        'Verhaltensweisen',
                        verhaltnisOptions,
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
                      width: 200,
                      child: Text(
                        'Verständigung:',
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
                        'Verständigung',
                        verstandnisOptions,
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
                      width: 200,
                      child: Text('Sprache:', style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 300,
                      child: buildDropDown(context, 'Sprache', spracheOptions),
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
                      width: 200,
                      child: Text('Gehör:', style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 300,
                      child: buildDropDown(context, 'Gehör', gehoerOptions),
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
                      width: 200,
                      child: Text('Sehen:', style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 300,
                      child: buildDropDown(context, 'Sehen', sehenOptions),
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
                    'Bewegung/Lagerung:',
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
                      width: 200,
                      child: Text('Bettkante:', style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 300,
                      child: buildDropDown(
                        context,
                        'Bettkante',
                        mobilitaetOptions,
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
                      width: 200,
                      child: Text('Aufstehen:', style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 300,
                      child: buildDropDown(
                        context,
                        'Aufstehen',
                        mobilitaetOptions,
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
                      width: 200,
                      child: Text('Gehen:', style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 300,
                      child: buildDropDown(
                        context,
                        'gehen',
                        mobilMitHilfsMittel,
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
                      width: 200,
                      child: Text(
                        'Gang zum WC:',
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
                        'Gang zum WC',
                        mobilMitHilfsMittel,
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
                      width: 200,
                      child: Text(
                        'Zimmerebene:',
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
                        'Zimmerebene',
                        mobilMitHilfsMittel,
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
                      width: 200,
                      child: Text(
                        'Stationsebene:',
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
                        'Stationsebene',
                        mobilMitHilfsMittel,
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
                        'Ergänzungen/ Besonderheiten:',
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
                        Key('ErgaenzungenBesonderheiten'),
                        'Ergänzungen/ Besonderheiten',
                        'Ergänzungen/ Besonderheiten',
                        TextEditingController(),
                        TextInputType.text,
                        Icon(Icons.elderly),
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
                        'Sturzgefährdung:',
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
                        Key('Sturzgefährdung'),
                        'Sturzgefährdung',
                        'Sturzgefährdung: ja/nein, ggf. Erläuterung',
                        TextEditingController(),
                        TextInputType.text,
                        Icon(Icons.trending_down),
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
                        'Bettlägerig:',
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
                        Key('Bettlaegerig'),
                        'Bettlägerig',
                        'Bettlägerig: ja/nein, ggf. Erläuterung',
                        TextEditingController(),
                        TextInputType.text,
                        Icon(Icons.hotel),
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
                      child: Text('Lähmungen:', style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 350,
                      child: loadText(
                        Key('Laehmungen'),
                        'Lähmungen',
                        'Lähmungen: ja/nein, Lokalisation',
                        TextEditingController(),
                        TextInputType.text,
                        Icon(Icons.local_hospital),
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
                        'Kontrakturen:',
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
                        Key('Kontrakturen'),
                        'Kontrakturen',
                        'Kontrakturen: ja/nein, Lokalisation',
                        TextEditingController(),
                        TextInputType.text,
                        Icon(Icons.hotel),
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
                        'Regelmäßige Lagerung:',
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
                        Key('RegelmäßigeLagerung'),
                        'Regelmäßige Lagerung',
                        'Regelmäßige Lagerung: ja/nein, ggf. Häufigkeit',
                        TextEditingController(),
                        TextInputType.text,
                        Icon(Icons.hotel),
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
        '/third',
        '/fifth',
      ),
    );
  }
}
