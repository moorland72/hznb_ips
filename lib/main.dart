import 'package:flutter/material.dart';
import 'package:hznb_ips/data/initdatabasesql3.dart';
import 'package:hznb_ips/screens/hauptwindow.dart';
import 'package:hznb_ips/screens/window2.dart';
import 'package:hznb_ips/screens/window3.dart';
import 'package:hznb_ips/screens/window4.dart';
import 'package:hznb_ips/screens/window5.dart';
import 'package:hznb_ips/screens/window6.dart';
import 'package:hznb_ips/screens/window7.dart';
import 'screens/window1.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await initDatabase();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/main':
            return MaterialPageRoute(builder: (context) => MainWindow());
          case '/second':
            return MaterialPageRoute(builder: (context) => SecondWindow());
          case '/third':
            return MaterialPageRoute(builder: (context) => ThirdWindow());
          case '/fourth':
            return MaterialPageRoute(builder: (context) => VierteWindow());
          case '/fifth':
            return MaterialPageRoute(builder: (context) => FifthWindow());
          case '/sixth':
            return MaterialPageRoute(builder: (context) => SixthWindow());
          case '/seventh':
            return MaterialPageRoute(builder: (context) => SeventhWindow());
          case '/hauptRail':
            return MaterialPageRoute(
              builder: (context) => NavigationRailWindow(),
            );
          default:
            return MaterialPageRoute(builder: (context) => MainWindow());
        }
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      home: NavigationRailWindow(),
    );
  }
}
