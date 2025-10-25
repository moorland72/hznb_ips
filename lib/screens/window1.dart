import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hznb_ips/data/data.dart';
import 'package:hznb_ips/data/listen.dart';
import 'package:hznb_ips/data/unterlagen.dart';
import 'package:hznb_ips/data/widgets.dart';
import 'package:hznb_ips/screens/selected_unterlagen_string.dart';

class MainWindow extends StatefulWidget {
  const MainWindow({super.key});

  @override
  State<MainWindow> createState() => _MainWindowState();
}

class _MainWindowState extends State<MainWindow> {
  ThreeWahlOptions? selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HzNB - Pflegerischer Verlegungsbericht'),
        backgroundColor: Color.fromARGB(255, 70, 97, 154),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
        
            children: [
              Row(// Logo HzNB
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
              Row(// Pflegerischer Verlegungsbericht Titel
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
        
              Row(// Verlegungsdaten Titel
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
              Row(// Patientendaten Eingabefelder
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: SizedBox(
                          width: 350,
        
                          child: TextField(
                            key: Key('Patientname'),
                            controller: patientNameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              labelText: 'Patientname:',
                              hintText: 'Name, Vorname',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.person),
                            ),
                            inputFormatters: [stringNameFormatter],
                            onChanged: (value) {
                              patientNameString = patientNameController.text;
                              unterlagen['Patientname'] = value;
                            },
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
                          width: 220,
        
                          child: TextField(
                            key: Key('PatientGeburtsdatum'),
                            controller: geburtsDatumController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Geburtsdatum:',
                              hintText: 'DD.MM.YYYY',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(FontAwesomeIcons.calendar),
                            ),
                            inputFormatters: [dateFormatter],
                            onChanged: (value) {
                              unterlagen['PatientGeburtsdatum'] = value;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
        
              Row(// Von Klinik Eingabefeld
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            SizedBox(
                              width: 130,
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
                  Column(
                    children: [
                      Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: SizedBox(
                      width: 440,
                      child: DropdownButton(
                        items: stations.map((String station) {
                          return DropdownMenuItem(
                            value: station,
                            child: Text(station),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            vonKlinikController.text = value.toString();
                            unterlagen['Station'] = value;
                          });
                        },
                        value: vonKlinikController.text.isEmpty
                            ? null
                            : vonKlinikController.text,
                        hint: Text('Station auswählen'),
                        isExpanded: true,
                      ),
                    ),
                  ),
                    ],
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
        
              Row(// Verlegungsdaten Titel
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 130,
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
                          child: TextField(
                            key: Key('behandlungsVon'),
                            controller: behandlungsVonController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Behandlung von:',
                              hintText: 'DD.MM.YYYY',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(FontAwesomeIcons.calendar),
                            ),
                            inputFormatters: [dateFormatter],
                            onChanged: (value) {
                              patientBehandlungBeginn =
                                  behandlungsVonController.text;
                              unterlagen['BehandlungVon'] =
                                  behandlungsVonController.text;
                            },
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
                          child: TextField(
                            key: Key('behandlungsBis'),
                            controller: behandlungsBisController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Behandlung bis:',
                              hintText: 'DD.MM.YYYY',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(FontAwesomeIcons.calendar),
                            ),
                            inputFormatters: [dateFormatter],
                            onChanged: (value) {
                              patientBehandlungBis =
                                  behandlungsBisController.text;
                              unterlagen['BehandlungBis'] =
                                  behandlungsBisController.text;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
        
              Row(// Verlegungs nach Eingabefeld
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                      width: 130,
                      child: Text(
                        'Verlegung nach: ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
        
                  SizedBox(
                    width: 450,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                        width: 350,
                        child: DropdownButton(
                          items: treatmentTypes.map((String verlegungNach) {
                            return DropdownMenuItem(
                              value: verlegungNach,
                              child: Text(verlegungNach),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              verlegungNachController.text = value.toString();
                              unterlagen['VerlegungNach'] = value;
                            });
                          },
                          value: verlegungNachController.text.isEmpty
                              ? null
                              : verlegungNachController.text,
                          hint: Text('Verlegung nach'),
                          isExpanded: true,
                        ),
                      ),
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
              Row(// Soziale Aspekte Eingabefeld
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                      width: 130,
                      child: Text(
                        'Soziale Aspekte: ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 450,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SizedBox(
                        width: 350,
                        child: DropdownButton(
                          items: sozialeAspekte.map((String sozialeAspekt) {
                            return DropdownMenuItem(
                              value: sozialeAspekt,
                              child: Text(sozialeAspekt),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              sozialeAspekteController.text = value.toString();
                              unterlagen['SozialeAspekte'] = value;
                            });
                          },
                          value: sozialeAspekteController.text.isEmpty
                              ? null
                              : sozialeAspekteController.text,
                          hint: Text('Soziale Aspekte'),
                          isExpanded: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(// Angehörige Eingabefelder
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 130,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'Angehörige/\nBetreuer:',
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 450,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextField(
                            key: Key('AngehörigeName'),
                            controller: angehorigeNameController,
                            decoration: InputDecoration(
                              labelText: 'Angehörige Name:',
                              hintText: 'Name, Vorname',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.person),
                            ),
                            inputFormatters: [stringNameFormatter],
                            onChanged: (value) {
                              unterlagen['AngehörigeName'] = value;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
        
              Row(// Angehörige anschrift Eingabefeld
                children: [
                  SizedBox(width: 130),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 450,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextField(
                            key: Key('AngehörigeAnschrift'),
                            controller: angehorigeAnschriftController,
                            decoration: InputDecoration(
                              labelText: 'Angehörige Anschrift:',
                              hintText: 'Strasse, Nr., PLZ, Ort',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.home),
                            ),
                            inputFormatters: [stringNameFormatter],
                            onChanged: (value) {
                              unterlagen['AngehörigeAnschrift'] = value;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(// Angehörige telefonnummer Eingabefeld
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [SizedBox(width: 130)],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 450,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextField(
                            key: Key('AngehörigeTelefonnummer'),
                            controller: angehorigeTelefonnummerController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              labelText: 'Angehörige Telefonnummer:',
                              hintText: 'Telefonnummer',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.phone),
                            ),
                            inputFormatters: [phoneNumberFormatter],
                            onChanged: (value) {
                              unterlagen['AngehörigeTelefonnummer'] = value;
                            },
                          ),
                        ),
                      ),
                    ],
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
              Row(// Bisherige Versorgung Eingabefeld
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'Bisherige \nVersorgung durch: ',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 450,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: DropdownButton(
                        items: previousCare.map((String previousCare) {
                          return DropdownMenuItem(
                            value: previousCare,
                            child: Text(previousCare),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            previousCareController.text = value.toString();
                            unterlagen['BisherigeVersorgung'] = value;
                          });
                        },
                        value: previousCareController.text.isEmpty
                            ? null
                            : previousCareController.text,
                        hint: Text('Bisherige Versorgung'),
                        isExpanded: true,
                      ),
                    ),
                  ),
                ],
              ),
              Row(// Pflegestufe Eingabefeld
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: SizedBox(
                      width: 130,
                      child: Text(
                        'Pflegestufe:',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 450,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: DropdownButton(
                        icon: context
                                .dependOnInheritedWidgetOfExactType<
                                    DropdownButtonHideUnderline>() ==
                            null
                            ? Icon(FontAwesomeIcons.userNurse)
                            : null,
                        items: pflegeStufen.map((String pflegeStufe) {
                          return DropdownMenuItem(
                            value: pflegeStufe,
                            child: Text(pflegeStufe),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            pflegestufeController.text = value.toString();
                            unterlagen['Pflegestufen'] = value;
                          });
                        },
                        value: pflegestufeController.text.isEmpty
                            ? null
                            : pflegestufeController.text,
                        hint: Text('Pflegestufen'),
                        isExpanded: true,
                      ),
                    ),
                  ),
                ],
              ),
              Row(// Hausarzt/Facharzt Name Eingabefelder
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 130,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(
                            'Hausarzt/\nFacharzt',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 450,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextField(
                            key: Key('HausarztName'),
                            controller: hausarztNameController,
                            decoration: InputDecoration(
                              labelText: 'Hausarzt/Facharzt Name:',
                              hintText: 'Name, Vorname',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.person),
                            ),
                            inputFormatters: [stringNameFormatter],
                            onChanged: (value) {
                              unterlagen['HausarztName'] = value;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                ],
              ),
              Row(// Hausarzt/Facharzt anschrift Eingabefelder
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 130,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 450,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextField(
                            key: Key('HausarztAnschrift'),
                            controller: hausarztAnschriftController,
                            decoration: InputDecoration(
                              labelText: 'Hausarzt/Facharzt Anschrift:',
                              hintText: 'Straße, PLZ, Ort',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.home),
                            ),
                            inputFormatters: [stringNameFormatter],
                            onChanged: (value) {
                              unterlagen['HausarztAnschrift'] = value;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                ],
              ),
              Row(// Hausarzt/Facharzt telefonnummer Eingabefelder
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 130,
                        
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 450,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextField(
                            key: Key('HausarztTelefonnummer'),
                            controller: hausarztTelefonnummerController,
                            
                            decoration: InputDecoration(
                              labelText: 'Hausarzt/Facharzt Telefonnummer:',
                              hintText: 'Telefonnummer',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.phone),
                            ),
                            inputFormatters: [phoneNumberFormatter],
                            onChanged: (value) {
                              unterlagen['HausarztTelefonnummer'] = value;
                            },
                          ),
                        ),
                      ),
                    ],
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
              Padding( // Vorsorgevollmacht 
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Column(
                      children: [
                        Text(
                          'Vorsorgevollmacht:',
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
                            child: SegmentedButton<ThreeWahlOptions>(
                              key: Key('Vorsorgevollmacht'),
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
        
                              segments: const <ButtonSegment<ThreeWahlOptions>>[
                                ButtonSegment<ThreeWahlOptions>(
                                  value: ThreeWahlOptions.ja,
                                  label: Text('ja'),
                                  icon: Icon(Icons.check),
                                ),
                                ButtonSegment<ThreeWahlOptions>(
                                  value: ThreeWahlOptions.nein,
                                  label: Text('nein'),
                                  icon: Icon(Icons.cancel),
                                ),
                                ButtonSegment<ThreeWahlOptions>(
                                  value: ThreeWahlOptions.nichtbekannt,
                                  label: Text('nicht bekannt'),
                                  icon: Icon(Icons.question_mark),
                                ),
                              ],
                              selected: <ThreeWahlOptions>{optionsViewVorsorgevollmacht},
                              onSelectionChanged: (Set<ThreeWahlOptions> newSelection) {
                                setState(() {
                                  optionsViewVorsorgevollmacht = newSelection.first;
                                  unterlagen['Vorsorgevollmacht'] = newSelection.first;
                                });
                              },
                            )
                            
                             /* SegmentedButtonChoice(
                              Key('Patientenverfügung'),
                              patientenverfugungController,
                            ), */
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
        
              Padding(// Patientenverfügung Eingabefeld
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
                            child: SegmentedButton<ThreeWahlOptions>(
                              key: Key('Patientenverfügung'),
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
        
                              segments: const <ButtonSegment<ThreeWahlOptions>>[
                                ButtonSegment<ThreeWahlOptions>(
                                  value: ThreeWahlOptions.ja,
                                  label: Text('ja'),
                                  icon: Icon(Icons.check),
                                ),
                                ButtonSegment<ThreeWahlOptions>(
                                  value: ThreeWahlOptions.nein,
                                  label: Text('nein'),
                                  icon: Icon(Icons.cancel),
                                ),
                                ButtonSegment<ThreeWahlOptions>(
                                  value: ThreeWahlOptions.nichtbekannt,
                                  label: Text('nicht bekannt'),
                                  icon: Icon(Icons.question_mark),
                                ),
                              ],
                              selected: <ThreeWahlOptions>{optionsViewPatientenverfugung},
                              onSelectionChanged: (Set<ThreeWahlOptions> newSelection) {
                                setState(() {
                                  optionsViewPatientenverfugung = newSelection.first;
                                  unterlagen['Patientenverfügung'] = newSelection.first;
                                });
                              },
                            )
                            
                             /* SegmentedButtonChoice(
                              Key('Patientenverfügung'),
                              patientenverfugungController,
                            ), */
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
        
              Padding(//Betreuungsurkunde
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Column(
                      children: [
                        Text(
                          'Betreuungsurkunde:',
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
                            child: SegmentedButton<ThreeWahlOptions>(
                              key: Key('Betreuungsverfügung'),
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
                              
                              segments: const <ButtonSegment<ThreeWahlOptions>>[
                                ButtonSegment<ThreeWahlOptions>(
                                  value: ThreeWahlOptions.ja,
                                  label: Text('ja'),
                                  icon: Icon(Icons.check),
                                ),
                                ButtonSegment<ThreeWahlOptions>(
                                  value: ThreeWahlOptions.nein,
                                  label: Text('nein'),
                                  icon: Icon(Icons.cancel),
                                ),
                                ButtonSegment<ThreeWahlOptions>(
                                  value: ThreeWahlOptions.nichtbekannt,
                                  label: Text('nicht bekannt'),
                                  icon: Icon(Icons.question_mark),
                                ),
                              ],
                              selected: <ThreeWahlOptions>{optionsViewBetreuungsverfugung},
                              onSelectionChanged: (Set<ThreeWahlOptions> newSelection) {
                                setState(() {
                                  optionsViewBetreuungsverfugung = newSelection.first;
                                  unterlagen['Betreuungsverfügung'] = newSelection.first;
                                });
                              },
                            )
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
        
              Padding( // Reanimationswunsch Eingabefeld
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
                            child: SegmentedButton<ThreeWahlOptions>(
                              key: Key('Reanimationsverfügung'),
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
        
                              segments: const <ButtonSegment<ThreeWahlOptions>>[
                                ButtonSegment<ThreeWahlOptions>(
                                  value: ThreeWahlOptions.ja,
                                  label: Text('ja'),
                                  icon: Icon(Icons.check),
                                ),
                                ButtonSegment<ThreeWahlOptions>(
                                  value: ThreeWahlOptions.nein,
                                  label: Text('nein'),
                                  icon: Icon(Icons.cancel),
                                ),
                                ButtonSegment<ThreeWahlOptions>(
                                  value: ThreeWahlOptions.nichtbekannt,
                                  label: Text('nicht bekannt'),
                                  icon: Icon(Icons.question_mark),
                                ),
                              ],
                              selected: <ThreeWahlOptions>{optionsViewReanimationswunsch},
                              onSelectionChanged: (Set<ThreeWahlOptions> newSelection) {
                                setState(() {
                                  optionsViewReanimationswunsch = newSelection.first;
                                  unterlagen['Reanimationsverfügung'] = newSelection.first;
                                });
                              },
                            )
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
      ),

      bottomNavigationBar: buildBottomNavigationBar(
        context,
        '/sixth',
        '/second',
      ),
    );
  }
}
