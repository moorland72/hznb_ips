import 'package:flutter/material.dart';
import 'package:hznb_ips/data/widgets.dart';

class SeventhWindow extends StatelessWidget {
  const SeventhWindow({super.key});

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
           
              ],
            ),
            Row(
              children: [

              ],
            ),

          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(context, '/sixth', '/main'),
    );
  }
}
