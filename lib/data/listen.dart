import 'package:drop_down_list/model/selected_list_item.dart';

const List<String> stations = [
  'IPS, Herz-Neuro-Zentrum Münsterlingen',
  'IMC, Herz-Neuro-Zentrum Münsterlingen',
  'PS, Herz-Neuro-Zentrum Münsterlingen',
];

const List<String> treatmentTypes = [
  'Alten- oder Pflegeheim',
  'Kurzzeitpflege',
  'anderes Krankenhaus',
  'amb. Pflegedient',
  'Sonstige',
];

const List<String> sozialeAspekte = [
  'Alleinstehend',
  'Gesetzlicher Betreuer',
  'Betreuung durch Angehörige',
];

const List<String> previousCare = [
  'Selbständig',
  'Angehörige',
  'Spitex',
  'Pflegedienst',
  'Hausarzt',
  'Sozialdienst',
  'Therapie',
];

final List<String> bewustseinOptions = [
  'wach, kooperativ',
  'ansprechbar',
  'kooperativ teilweise',
  'desorientiert',
  'somnolent',
  'sediert',
];

final List<String> verhaltnisOptions = [
  'unauffällig',
  'unkooperativ',
  'enthemmt',
  'aggressiv',
  'depressiv',
];

final List<String> verstandnisOptions = [
  'gut',
  'eingeschränkt',
  'keine',
  'spricht stimmlos',
];

final List<String> spracheOptions = [
  'fehlerfrei',
  'eingeschränkt',
  'keine',
  'aphasie',
  'nicht beurteilbar',
];

final List<String> gehoerOptions = [
  'reagiert normal',
  'reagiert auf Zuruf',
  'nicht beurteilbar',
  'schwerhörig',
  'Hörgerät',
];

final List<String> sehenOptions = [
  'unauffällig',
  'eingeschränkt',
  'fixiert zeitweise',
  'Brille',
  'nicht beurteilbar',
];

final List<String> mobilitaetOptions = [
  'selbständig',
  'mit Anleitung',
  'Teilübernahme',
  'Vollübernahme',
  'nicht möglich',
];

final List<String> mobilMitHilfsMittel = [
  'selbständig',
  'mit Anleitung',
  'mit Hilfsmittel',
  'Vollübernahme',
  'nicht möglich',
];

final List<String> essenOptions = [
  'selbständig',
  'mit Anleitung',
  'Teilübernahme',
  'Vollübernahme',
  'mundgerechte Zubereitung',
];

final List<String> trinkenOptions = [
  'selbständig',
  'anhalten zu trinken',
  'andicken',
];

final List<String> stomaVersorgung = [
  '',
  'selbständig',
  'mit Hilfe',
  'Vollübernahme',
];

final List<String> insulinVerabreichung = ['Insulinpumpe', 'Pen', 'Spritze'];

final List<String> sondenArt = ['Magensonde', 'PEG-Sonde', 'PEJ-Sonde'];

final List<String> korperPflegeOrt = ['', 'Bett', 'Bad', 'Washbecken'];

final List<String> optionChoices = [];

String? selectedValueUnterlagen;

final isSelected = <bool>[false, false, false];

// ignore: camel_case_types
enum wahlOptions { ja, nein }

final List<SelectedListItem<String>> medikamentEinnahme = [
  SelectedListItem(data: 'selbstständig'),
  SelectedListItem(data: 'Überwachung der Einnahme'),
  SelectedListItem(data: 'Tabletten mörsern'),
];

final List<SelectedListItem<String>> atmungListe = [
  SelectedListItem<String>(data: 'problemlos'),
  SelectedListItem<String>(data: 'Raucher'),
  SelectedListItem<String>(data: 'Atemnot bei Belastung'),
  SelectedListItem<String>(data: 'Atemnot in Ruhe'),
];

final List<SelectedListItem<String>> schlafListe = [
  SelectedListItem<String>(data: 'ungestört'),
  SelectedListItem<String>(data: 'Schlafstörungen'),
  SelectedListItem<String>(data: 'nächtliche Unruhe'),
  SelectedListItem<String>(data: 'Schlafapnoe'),
  SelectedListItem<String>(data: 'CPAP-Gerät'),
  SelectedListItem<String>(data: 'Tag-/Nachtrhythmus gestört'),
];

final List<SelectedListItem<String>> unterlagenMitgegeben = [
  SelectedListItem<String>(data: 'Entlassungsbericht (Arztbrief)'),
  SelectedListItem<String>(data: 'Medikationsplan'),
  SelectedListItem<String>(data: 'Schrittmacher/ ICD pass'),
  SelectedListItem<String>(data: 'Antikoagulationspass'),
  SelectedListItem<String>(data: 'Allergiepass'),
  SelectedListItem<String>(data: 'Foto-/Wunddokumentation'),
  SelectedListItem<String>(data: 'Insulinplan'),
  SelectedListItem<String>(data: 'Sanierungsplan'),
  SelectedListItem<String>(data: 'Röntgenbilder'),
  SelectedListItem<String>(data: 'Laborwerte'),
  SelectedListItem<String>(data: 'Wertsachen '),
  SelectedListItem<String>(data: 'EKG', isSelected: false),
];

final List<SelectedListItem<String>> personlicheHilfsmittel = [
  SelectedListItem<String>(data: 'Gehstock'),
  SelectedListItem<String>(data: 'Gehhilfe'),
  SelectedListItem<String>(data: 'Unterarmgehstützen'),
  SelectedListItem<String>(data: 'Rollator'),
  SelectedListItem<String>(data: 'Rollstuhl'),
  SelectedListItem<String>(data: 'Brille'),
  SelectedListItem<String>(data: 'Hörgerät'),
  SelectedListItem<String>(data: 'Prothese'),
  SelectedListItem<String>(data: 'Inkontinenzmaterial'),
];

final List<SelectedListItem<String>> besonderheitenListe = [
  SelectedListItem<String>(data: 'Portkatheter'),
  SelectedListItem<String>(data: 'Antikoagulation'),
  SelectedListItem<String>(data: 'Schrittmacher/ICD'),
];

const List<String> pflegeStufen = [
  'keine',
  'PS 1 : < 20 Minuten Pflegeaufwand pro Tag',
  'PS 2 : 20 - 40 Minuten Pflegeaufwand pro Tag',
  'PS 3 : 40 - 60 Minuten Pflegeaufwand pro Tag',
  'PS 4 : 60 - 80 Minuten Pflegeaufwand pro Tag',
  'PS 5 : 80 - 100 Minuten Pflegeaufwand pro Tag',
  'PS 6 : 100 - 120 Minuten Pflegeaufwand pro Tag',
  'PS 7 : 120 - 140 Minuten Pflegeaufwand pro Tag',
  'PS 8 : 140 - 160 Minuten Pflegeaufwand pro Tag',
  'PS 9 : 160 - 180 Minuten Pflegeaufwand pro Tag',
  'PS 10 : 180 - 200 Minuten Pflegeaufwand pro Tag',
  'PS 11 : 200 - 220 Minuten Pflegeaufwand pro Tag',
  'PS 12 : 220 - 240 Minuten Pflegeaufwand pro Tag',
];
