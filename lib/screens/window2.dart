import 'package:flutter/material.dart';
import 'package:hznb_ips/data/listen.dart';
import 'package:hznb_ips/data/widgets.dart';

class SecondWindow extends StatelessWidget {
  const SecondWindow({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HzNB - Pflegerischer Verlegungsbericht'),
        backgroundColor: Color.fromARGB(255, 70, 97, 154),
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
                  child: Row(
                    children: [
                      Image.asset('images/hznb_logo_klein.png', height: 50),
                    ],
                  ),
                ),
              ],
            ),
            Divider(color: Colors.grey, thickness: 1),
            Row(
              children: [
                Expanded(
                  child: buildSelectedListDropDown(
                    context,
                    'Mitgegebene Unterlagen',
                    unterlagenMitgegeben,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Text(
                            'Medikamente für: ',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: 150,
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: loadText(
                              Key('MedikamenteTage'),
                              'Tage',
                              'Tage',
                              TextEditingController(),
                              TextInputType.text,
                              Icon(Icons.medication),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: 150,
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: Text(
                              'mitgegeben.',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Divider(height: 20, color: const Color.fromARGB(255, 70, 97, 154)),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      'Medikamenteneinnahme',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: buildSelectedListDropDown(
                    context,
                    '',
                    medikamentEinnahme,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        'Insulin: ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: TwoSegmentedButtonChoice(key: Key('Insulin')),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 300,
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: loadText(
                          Key('InsulinartDosierung'),
                          'Insulinart/Dosierung',
                          'Insulinart/Dosierung',
                          TextEditingController(),
                          TextInputType.text,
                          Icon(Icons.vaccines),
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
                      width: 200,
                      child: Text(
                        'Verabreichung per:',
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
                        context, 'Verabreichung per:', 
                        insulinVerabreichung,
                        selectedItems: [],
                        onChanged: (value) {
                          setState(() {
                            verabreichungPer = value!;
                          });
                        }),
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
                        'Injektion:',
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
                      child: buildDropDown(context, 'Injektionen:', [
                        'selbstständig',
                        'mit Unterstützung',
                        'vollständig Übernahme',
                      ]),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(context, '/main', '/third'),
    );
  }
}
