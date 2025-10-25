import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:hznb_ips/data/datamodelsql3.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';

var dbPathGlobal = '';

Future<void> initDatabase() async {
  // Get the database path
  final Directory appDocDir = await getApplicationSupportDirectory();
  dbPathGlobal = p.join(appDocDir.path, 'data', 'pflegebericht.db');

try {
    await Directory(p.dirname(dbPathGlobal)).create(recursive: true);
  } catch (e) {
    print('Error creating directory: $e');
  }
  // Open the database
  final database = sqlite3.open(dbPathGlobal);

  // Create tables if they don't exist
  database.execute('''
    CREATE TABLE IF NOT EXISTS _patients (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      Patientname TEXT,
      GeburtsDate TEXT
    )
  ''');
  print('Patients table ensured: $dbPathGlobal');
  // Close the database
  database.dispose();
 
}

Future<Patient> insertPatient(Patient patient) async {
  final database = sqlite3.open(dbPathGlobal);

  final stmt = database.prepare(
    'INSERT INTO _patients (Patientname, GeburtsDate) VALUES (?, ?)',
  );
  stmt.execute([patient.PatientName, patient.GeburtsDate]);
  int id = database.getUpdatedRows();

  stmt.dispose();
  database.dispose();

  return Patient(id: id, PatientName: patient.PatientName, GeburtsDate: patient.GeburtsDate);
}

Future<List<Patient>> getAllPatients(String query) async {
  final database = sqlite3.open(dbPathGlobal);

  final ResultSet resultSet = database.select(query);
  List<Patient> patients = resultSet.map((row) {
    return Patient(
      id: row['id'] as int,
      PatientName: row['Patientname'] as String,
      GeburtsDate: row['GeburtsDate'] as String,
    );
  }).toList();

  database.dispose();
  return patients;
}


