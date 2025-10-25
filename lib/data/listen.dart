import 'package:drop_down_list/model/selected_list_item.dart';

final List<String> stations = <String>[
  'IPS, Herz-Neuro-Zentrum Münsterlingen',
  'IMC, Herz-Neuro-Zentrum Münsterlingen',
  'PS, Herz-Neuro-Zentrum Münsterlingen',
];

final List<String> treatmentTypes =<String>[
  'Alten- oder Pflegeheim',
  'Kurzzeitpflege',
  'anderes Krankenhaus',
  'amb. Pflegedient',
  'Sonstige',
];

final List<String> sozialeAspekte = <String>[
  'Alleinstehend',
  'Gesetzlicher Betreuer',
  'Betreuung durch Angehörige',
];

final List<String> previousCare = <String>[
  'Selbständig',
  'Angehörige',
  'Spitex',
  'Pflegedienst',
  'Hausarzt',
  'Sozialdienst',
  'Therapie',
];

final List<String> bewustseinOptions = <String>[
  'wach, kooperativ',
  'ansprechbar',
  'kooperativ teilweise',
  'desorientiert',
  'somnolent',
  'sediert',
];

final List<String> verhaltnisOptions = <String>[
  'unauffällig',
  'unkooperativ',
  'enthemmt',
  'aggressiv',
  'depressiv',
];

final List<String> verstandnisOptions = <String>[
  'gut',
  'eingeschränkt',
  'keine',
  'spricht stimmlos',
];

final List<String> spracheOptions = <String>[
  'fehlerfrei',
  'eingeschränkt',
  'keine',
  'aphasie',
  'nicht beurteilbar',
];

final List<String> gehoerOptions =  <String>[
  'reagiert normal',
  'reagiert auf Zuruf',
  'nicht beurteilbar',
  'schwerhörig',
  'Hörgerät',
];

final List<String> sehenOptions = <String>[
  'unauffällig',
  'eingeschränkt',
  'fixiert zeitweise',
  'Brille',
  'nicht beurteilbar',
];

final List<String> mobilitaetOptions = <String>[
  'selbständig',
  'mit Anleitung',
  'Teilübernahme',
  'Vollübernahme',
  'nicht möglich',
];

final List<String> mobilMitHilfsMittel = <String>[
  'selbständig',
  'mit Anleitung',
  'mit Hilfsmittel',
  'Vollübernahme',
  'nicht möglich',
];

final List<String> essenOptions = <String>[
  'selbständig',
  'mit Anleitung',
  'Teilübernahme',
  'Vollübernahme',
  'mundgerechte Zubereitung',
];

final List<String> trinkenOptions = <String>[
  'selbständig',
  'anhalten zu trinken',
  'andicken',
];

final List<String> stomaVersorgung = <String>[
  '',
  'selbständig',
  'mit Hilfe',
  'Vollübernahme',
];

final List<String> injektionHilfe = <String>[
  'selbstständig',
  'mit Unterstützung',
  'vollständig Übernahme',
];

final List<String> insulinVerabreichung = <String>['Insulinpumpe', 'Pen', 'Spritze'];

final List<String> sondenArt = <String>['','Magensonde', 'PEG-Sonde', 'PEJ-Sonde'];

final List<String> korperPflegeOrtOption = <String> ['Bett', 'Bad', 'Washbecken'];

final List<String> optionChoices = <String>[];

String? selectedValueUnterlagen;

final isSelected = <bool>[false, false, false];

// ignore: camel_case_types
enum TwoWahlOptions { ja, nein }

enum ThreeWahlOptions { ja, nein, nichtbekannt }

final List<String> medikamentEinnahme = <String>[
  '',
  'selbstständig',
  'Überwachung der Einnahme',
];

final Map<String, bool> atmungListeOption = {
  'problemlose Atmung': false,
  'Raucher': false,
  'Atemnot bei Belastung': false,
  'Atemnot in Ruhe': false,
};

final Map<String, bool> schlafListeOption = {
  'ungestörter Schlaf': false,
  'Schlafstörungen': false,
  'nächtliche Unruhe': false,
  'Schlafapnoe': false,
  'CPAP-Gerät': false,
  'Tag-/Nachtrhythmus gestört': false,
};

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

final Map<String, bool> mitgegebeneUnterlagen = {
  'Entlassungsbericht (Arztbrief)': false,
  'Medikationsplan': false,
  'Schrittmacher/ ICD pass': false,
  'Antikoagulationspass': false,
  'Allergiepass': false,
  'Foto-/Wunddokumentation': false,
  'Insulinplan': false,
  'Sanierungsplan': false,
  'Röntgenbilder': false,
  'Laborwerte': false,
  'Wertsachen ': false,
  'EKG': false,
};

final Map<String, bool> personlicheHilfsmittel = {
  'Gehstock': false,
  'Gehhilfe': false,
  'Unterarmgehstützen': false,
  'Rollator': false,
  'Rollstuhl': false,
  'Brille': false,
  'Hörgerät': false,
  'Prothese': false,
  'Inkontinenzmaterial': false,
};

final Map<String, bool> besonderheitenListe = {
  'Portkatheter': false,
  'Antikoagulation': false,
  'Schrittmacher/ICD': false,
};

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

 final List<SelectedListItem<String>> personlicheHilfsmittel2 = [
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

final List<SelectedListItem<String>> besonderheitenListe2 = [
  SelectedListItem<String>(data: 'Portkatheter'),
  SelectedListItem<String>(data: 'Antikoagulation'),
  SelectedListItem<String>(data: 'Schrittmacher/ICD'),
];

final List<String> pflegeStufen = <String>[
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
