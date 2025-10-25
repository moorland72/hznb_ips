import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hznb_ips/data/datamodelsql3.dart';
import 'package:hznb_ips/data/initdatabasesql3.dart';


class NavigationRailWindow extends StatefulWidget {
  const NavigationRailWindow({super.key});

  @override
  State<NavigationRailWindow> createState() => _NavigationRailWindowState();
}

class _NavigationRailWindowState extends State<NavigationRailWindow> {
  int _selectedIndex = 0;
  bool showLeading = true;
  bool showTrailing = true;
  double? get _groupAlignment => null;


  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HzNB - Pflegerischer Verlegungsbericht'),
        backgroundColor: Color.fromARGB(255, 70, 97, 154),
      ),
      body: SafeArea(
        child: Row(
          children: [
            NavigationRail(
              minWidth: 100,
              selectedIndex: _selectedIndex,
              groupAlignment: _groupAlignment,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                  if (_selectedIndex == 0) {
                    Navigator.pushNamed(context, '/window1');
                  } else if (_selectedIndex == 1) {
                    // Navigator.pushNamed(context, '/window2');
                  } else if (_selectedIndex == 2) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Database Path'),
                          content: Text('Datenbankpfad:'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Abbrechen'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                //Navigator.pushNamed(context, '/hauptRail');
                              },
                              child: Text('Verlassen'),
                            ),
                          ],
                        );
                      },
                    );
                    // Navigator.pushNamed(context, '/window3');
                  }
                });
              },
              labelType: NavigationRailLabelType.all,

              destinations: const [
                NavigationRailDestination(
                  padding: EdgeInsets.all(8.0),
                  icon: Icon(
                    FontAwesomeIcons.personCirclePlus,
                    size: 45,
                    opticalSize: 50,
                  ),
                  label: Text('Neu Pflegebericht'),

                  indicatorShape: BeveledRectangleBorder(),
                ),
                NavigationRailDestination(
                  padding: EdgeInsets.all(8.0),
                  icon: Icon(FontAwesomeIcons.bookOpen, size: 45),
                  label: Text('Dokumente anzeigen'),
                ),
                NavigationRailDestination(
                  padding: EdgeInsets.all(8.0),
                  icon: Icon(FontAwesomeIcons.sliders, size: 25),
                  label: Text('Einstellungen'),
                ),
              ],
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: Center(
                child: FutureBuilder<List<Patient>>(
                  //future: getAllPatients('SELECT * FROM _BehandlungTbl INNER JOIN _patient ON _BehandlungTbl.PatientId = _patient.id ORDER BY PatientName ASC'),
                  //future: getAllPatients( 'SELECT * FROM _BehandlungTbl INNER JOIN _Patient ON _BehandlungTbl.PatientId = _Patient.id ORDER BY PatientName ASC'),
                  future: getAllPatients('SELECT * FROM _patients ORDER BY Patientname ASC'),
                          
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      final patients = snapshot.data ?? [];
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          final patient = patients[index];
                         // final behandlung = getAllBehandlungenOb() as Behandlung;
                          return Card(
                            clipBehavior: Clip.antiAlias,

                            color: const Color.fromARGB(255, 252, 252, 251),
                            margin: const EdgeInsets.all(10),
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   Text(
                                    'ID: ${patient.id}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ), 
                                  SizedBox(height: 8.0),
                                  Text(
                                    'Name: ${patient.PatientName}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Geburtsdatum: ${patient.GeburtsDate}',
                                  ),
                                 // Text('Behandlung: ${behandlung.BeginnDate} - ${behandlung.EndDate}'),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          // Handle edit action
                                        },
                                        child: Text(
                                          'Bearbeiten',
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                              255,
                                              223,
                                              40,
                                              8,
                                            ),
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          // Handle delete action
                                        },
                                        child: Text(
                                          'Drucken',
                                          style: TextStyle(
                                            color: const Color.fromARGB(255, 67, 200, 18),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: patients.length,
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ) /* SizedBox(
              width: 500,
              height: 990,
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator(),
                  )
                  : ListView.builder(itemBuilder: (context, index) {
                      return Card(
                        color: const Color.fromARGB(255, 242, 244, 210),
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          // ignore: prefer_interpolation_to_compose_strings
                          title: Text('Name: ${_items[index]['PatientName'] + ' Geburtsdatum: ' + (_items[index]['GeburtsDatum'] ?? 'No Surname')}'),
                          subtitle:
                              // ignore: prefer_interpolation_to_compose_strings
                              Text('Behandlung: ${_items[index]['BehandlungBeginn'] + ' - ' + (_items[index]['BehandlungEnde'] ?? 'N/A')}'),
                        ),
                      );
                    }, itemCount: _items.length),
            ), */,
      ),
    );
  }
}
