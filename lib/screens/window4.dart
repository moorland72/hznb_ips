import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hznb_ips/data/unterlagen.dart';
import 'package:hznb_ips/data/widgets.dart';
import 'package:hznb_ips/data/listen.dart';
import 'package:hznb_ips/screens/selected_unterlagen_string.dart';

class VierteWindow extends StatefulWidget {
  const VierteWindow({super.key});

  @override
  State<VierteWindow> createState() => _VierteWindowState();
}

class _VierteWindowState extends State<VierteWindow> {
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
            Row(//Kopfzeile mit Logo
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
                    'Neuroliogische Aspekte',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(//Bewusstseinslage
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          items: bewustseinOptions.map((
                            String bewusstsein,
                          ) {
                            return DropdownMenuItem(
                              value: bewusstsein,
                              child: Text(bewusstsein),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              bewusstseinController.text = value
                                  .toString();
                              unterlagen['Bewusstseinslage'] = '$value\n';
                            });
                          },
                          value: bewusstseinController.text.isEmpty
                              ? null
                              : bewusstseinController.text,
                          hint: Text('Bewusstseinslage'),
                          isExpanded: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(//Verhaltensweisen
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          items: verhaltnisOptions.map((
                            String verhaltensweise,
                          ) {
                            return DropdownMenuItem(
                              value: verhaltensweise,
                              child: Text(verhaltensweise),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              verhaltnisController.text = value
                                  .toString();
                              unterlagen['Verhaltensweisen'] = '$value\n';
                            });
                          },
                          value: verhaltnisController.text.isEmpty
                              ? null
                              : verhaltnisController.text,
                          hint: Text('Verhaltensweisen'),
                          isExpanded: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(//Verständigung
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          items: verstandnisOptions.map((
                            String verstandnis,
                          ) {
                            return DropdownMenuItem(
                              value: verstandnis,
                              child: Text(verstandnis),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              verstandnisController.text = value
                                  .toString();
                              unterlagen['Verständigung'] = '$value\n';
                            });
                          },
                          value: verstandnisController.text.isEmpty
                              ? null
                              : verstandnisController.text,
                          hint: Text('Verständigung'),
                          isExpanded: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(//Sprache
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          items: spracheOptions.map((
                            String sprache,
                          ) {
                            return DropdownMenuItem(
                              value: sprache,
                              child: Text(sprache),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              spracheController.text = value
                                  .toString();
                              unterlagen['Sprache'] = '$value\n';
                            });
                          },
                          value: spracheController.text.isEmpty
                              ? null
                              : spracheController.text,
                          hint: Text('Sprache'),
                          isExpanded: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(//Gehör
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          items: gehoerOptions.map((
                            String gehoer,
                          ) {
                            return DropdownMenuItem(
                              value: gehoer,
                              child: Text(gehoer),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              gehoerController.text = value
                                  .toString();
                              unterlagen['Gehör'] = '$value\n';
                            });
                          },
                          value: gehoerController.text.isEmpty
                              ? null
                              : gehoerController.text,
                          hint: Text('Gehör'),
                          isExpanded: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(//Sehen
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          items: sehenOptions.map((
                            String sehen,
                          ) {
                            return DropdownMenuItem(
                              value: sehen,
                              child: Text(sehen),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              sehenController.text = value
                                  .toString();
                              unterlagen['Sehen'] = '$value\n';
                            });
                          },
                          value: sehenController.text.isEmpty
                              ? null
                              : sehenController.text,
                          hint: Text('Sehen'),
                          isExpanded: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(color: Colors.grey, thickness: 1),
            Row(//mobilisation Überschrift
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
            Row(//mobbilisation Bettkante
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          items: mobilitaetOptions.map((
                            String mobilitaet,
                          ) {
                            return DropdownMenuItem(
                              value: mobilitaet,
                              child: Text(mobilitaet),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              bettkanteController.text = value
                                  .toString();
                              unterlagen['Bettkante'] = '$value\n';
                            });
                          },
                          value: bettkanteController.text.isEmpty
                              ? null
                              : bettkanteController.text,
                          hint: Text('Bettkante'),
                          isExpanded: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(//mobbilisation Aufstehen
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          items: mobilitaetOptions.map((
                            String mobilitaet,
                          ) {
                            return DropdownMenuItem(
                              value: mobilitaet,
                              child: Text(mobilitaet),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              aufstehenController.text = value
                                  .toString();
                              unterlagen['Aufstehen'] = '$value\n';
                            });
                          },
                          value: aufstehenController.text.isEmpty
                              ? null
                              : aufstehenController.text,
                          hint: Text('Aufstehen'),
                          isExpanded: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(//mobbilisation Gehen
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          items: mobilitaetOptions.map((
                            String mobilitaet,
                          ) {
                            return DropdownMenuItem(
                              value: mobilitaet,
                              child: Text(mobilitaet),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              gehenController.text = value
                                  .toString();
                              unterlagen['Gehen'] = '$value\n';
                            });
                          },
                          value: gehenController.text.isEmpty
                              ? null
                              : gehenController.text,
                          hint: Text('Gehen'),
                          isExpanded: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(//mobbilisation Gang zum WC
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          items: mobilitaetOptions.map((
                            String mobilitaet,
                          ) {
                            return DropdownMenuItem(
                              value: mobilitaet,
                              child: Text(mobilitaet),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              gangzumWCController.text = value
                                  .toString();
                              unterlagen['Gang zum WC'] = '$value\n';
                            });
                          },
                          value: gangzumWCController.text.isEmpty
                              ? null
                              : gangzumWCController.text,
                          hint: Text('Gang zum WC'),
                          isExpanded: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(//mobbilisation Zimmerebene
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          items: mobilitaetOptions.map((
                            String mobilitaet,
                          ) {
                            return DropdownMenuItem(
                              value: mobilitaet,
                              child: Text(mobilitaet),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              zimmerebeneController.text = value
                                  .toString();
                              unterlagen['Zimmerebene'] = '$value\n';
                            });
                          },
                          value: zimmerebeneController.text.isEmpty
                              ? null
                              : zimmerebeneController.text,
                          hint: Text('Zimmerebene'),
                          isExpanded: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(//Stationsebene
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          items: mobilitaetOptions.map((
                            String mobilitaet,
                          ) {
                            return DropdownMenuItem(
                              value: mobilitaet,
                              child: Text(mobilitaet),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              stationEbeneController.text = value
                                  .toString();
                              unterlagen['Stationsebene'] = '$value\n';
                            });
                          },
                          value: stationEbeneController.text.isEmpty
                              ? null
                              : stationEbeneController.text,
                          hint: Text('Stationsebene'),
                          isExpanded: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(//Ergänzungen/ Besonderheiten
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
                      width: 400,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextField(
                          key: Key('ErgaenzungenBesonderheiten'),
                          controller: ergaenzungenBesonderheitenController,
                          decoration: InputDecoration(
                            labelText: 'Ergänzungen/ Besonderheiten:',
                            hintText: 'Bitte hier eingeben',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.assistant_direction),
                          ),
                          inputFormatters: [stringNameFormatter],
                          onChanged: (value) {
                            unterlagen['Ergänzungen/ Besonderheiten'] = '$value\n';
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(//Sturzgefährdung, Bettlägerig, Lähmungen, Kontrakturen, Regelmäßige Lagerung
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
                      width: 400,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextField(
                          key: Key('Sturzgefaehrdung'),
                          controller: sturzgefaehrdungController,
                          decoration: InputDecoration(
                            labelText: 'Sturzgefährdung:',
                            hintText: 'Sturzgefährdung: ja/nein, ggf. Erläuterung',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(FontAwesomeIcons.personFalling),
                          ),
                          inputFormatters: [stringNameFormatter],
                          onChanged: (value) {
                            unterlagen['Sturzgefaehrdung'] = '$value\n';
                          },
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
                        'Bettlägerig:',
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
                          key: Key('Bettlaegerig'),
                          controller: bettlaegerigController,
                          decoration: InputDecoration(
                            labelText: 'Bettlägerig:',
                            hintText: 'Bettlägerig: ja/nein, ggf. Erläuterung',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(FontAwesomeIcons.bed),
                          ),
                          inputFormatters: [stringNameFormatter],
                          onChanged: (value) {
                            unterlagen['Bettlaegerig'] = '$value\n';
                          },
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
                      child: Text('Lähmungen:', style: TextStyle(fontSize: 16)),
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
                          key: Key('laehmungen'),
                          controller: laehmungenController,
                          decoration: InputDecoration(
                            labelText: 'Lähmungen:',
                            hintText: 'Lähmungen: ja/nein, ggf. Lokalisation',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.accessibility),
                          ),
                          inputFormatters: [stringNameFormatter],
                          onChanged: (value) {
                            unterlagen['Lähmungen'] = '$value\n';
                          },
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
                        'Kontrakturen:',
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
                          key: Key('kontrakturen'),
                          controller: kontrakturenController,
                          decoration: InputDecoration(
                            labelText: 'Kontrakturen:',
                            hintText: 'Kontrakturen: ja/nein, ggf. Lokalisation',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.self_improvement),
                          ),
                          inputFormatters: [stringNameFormatter],
                          onChanged: (value) {
                            unterlagen['Kontrakturen'] = '$value\n';
                          },
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
                        'Regelmäßige Lagerung:',
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
                          key: Key('RegelmaessigeLagerung'),
                          controller: regelmaessigeLagerungController,
                          decoration: InputDecoration(
                            labelText: 'Regelmäßige Lagerung:',
                            hintText: 'Regelmäßige Lagerung: ja/nein, ggf. Häufigkeit',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.rotate_90_degrees_ccw),
                          ),
                          inputFormatters: [stringNameFormatter],
                          onChanged: (value) {
                            unterlagen['RegelmaessigeLagerung'] = '$value\n';
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
        '/third',
        '/fifth',
      ),
    );
  }
}
