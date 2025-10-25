import 'package:flutter/material.dart';
import 'package:hznb_ips/data/listen.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

String? selectedUnterlagenString;

var dateFormatter = MaskTextInputFormatter(
  mask: '##.##.####',
  filter: {"#": RegExp(r'[0-9]')},
  type: MaskAutoCompletionType.lazy,
);

var phoneNumberFormatter = MaskTextInputFormatter(
  mask: '################',
  filter: {"#": RegExp(r'[0-9-+]')},
  type: MaskAutoCompletionType.lazy,
);

var stringNameFormatter = MaskTextInputFormatter(
  mask: '#############################################################',
  filter: {"#": RegExp(r'[a-zA-ZäöüÄÖÜßáéíóúÁÉÍÓÚ - 0-9]')},
  type: MaskAutoCompletionType.lazy,
);

final TextEditingController patientNameController = TextEditingController();
final TextEditingController geburtsDatumController = TextEditingController();
final TextEditingController behandlungsBisController = TextEditingController();
final TextEditingController behandlungsVonController = TextEditingController();
final TextEditingController angehorigeNameController = TextEditingController();
final TextEditingController angehorigeAnschriftController =
    TextEditingController();
final TextEditingController angehorigeTelefonnummerController =
    TextEditingController();
final TextEditingController hausarztNameController = TextEditingController();
final TextEditingController hausarztAnschriftController =
    TextEditingController();
final TextEditingController hausarztTelefonnummerController =
    TextEditingController();
final TextEditingController vonKlinikController = TextEditingController();
final TextEditingController verlegungNachController = TextEditingController();
final TextEditingController sozialeAspekteController = TextEditingController();
final TextEditingController previousCareController = TextEditingController();
final TextEditingController pflegestufeController = TextEditingController();
final TextEditingController vorsorgevollmachtController = TextEditingController();
final TextEditingController patientenverfugungController = TextEditingController();
final TextEditingController betreuungsverfugungController = TextEditingController();
final TextEditingController reanimationswunschController = TextEditingController();

bool insulinPflicht = false;
typedef MenuEntry = DropdownMenuEntry<String>;
String get selectedTreatmentType => treatmentTypes[0];
DateTime? selectedDate;

get returnDate => null;
ThreeWahlOptions optionsViewVorsorgevollmacht = ThreeWahlOptions.nichtbekannt;
ThreeWahlOptions optionsViewPatientenverfugung = ThreeWahlOptions.nichtbekannt;
ThreeWahlOptions optionsViewBetreuungsverfugung = ThreeWahlOptions.nichtbekannt;
ThreeWahlOptions optionsViewReanimationswunsch = ThreeWahlOptions.nichtbekannt;


final TextEditingController medikamentFuerTageController =
    TextEditingController();
final TextEditingController medikamentEinnahmeController =
    TextEditingController();
final TextEditingController insulinVerabreichungController =
    TextEditingController();
final TextEditingController injektionHilfeController =
    TextEditingController();
final TextEditingController insulinSonArtController =
    TextEditingController();
TwoWahlOptions optionsInsulin =
    TwoWahlOptions.nein;


var numberFormatter =  MaskTextInputFormatter(
  mask: '##',
  filter: {"#": RegExp(r'[0-9]')},
  type: MaskAutoCompletionType.lazy,
);

final TextEditingController sonstigeHilfsmittelController = TextEditingController();
final TextEditingController allergienController = TextEditingController();
final TextEditingController sonstigesBesonderheitenController = TextEditingController();
final TextEditingController infektionenController = TextEditingController();
final TextEditingController o2PflichtController = TextEditingController();
final TextEditingController ivZugangController = TextEditingController();
final TextEditingController aktuelleSchmerzproblemeController = TextEditingController();
final TextEditingController btmPflasterController = TextEditingController();

var personlicheHilfsmittelArray = [];
var besonderheitenListeArray = [];
getCheckboxItems() {
  personlicheHilfsmittel.forEach((key, value) {
    if (value == true) personlicheHilfsmittelArray.add(personlicheHilfsmittel[key]);
  });
  return personlicheHilfsmittelArray;
}

final TextEditingController bewusstseinController =
    TextEditingController();
final TextEditingController verhaltnisController =
    TextEditingController();
final TextEditingController verstandnisController =
    TextEditingController();
final TextEditingController spracheController =
    TextEditingController();
final TextEditingController gehoerController =
    TextEditingController();
final TextEditingController sehenController =
    TextEditingController();
final TextEditingController bettkanteController =
    TextEditingController();
final TextEditingController aufstehenController =
    TextEditingController();
final TextEditingController gehenController =
    TextEditingController();
final TextEditingController gangzumWCController =
    TextEditingController();
final TextEditingController zimmerebeneController =
    TextEditingController();
final TextEditingController stationEbeneController =
    TextEditingController();
final TextEditingController ergaenzungenBesonderheitenController =
    TextEditingController();
final TextEditingController sturzgefaehrdungController =
    TextEditingController();
final TextEditingController bettlaegerigController =
    TextEditingController();
final TextEditingController laehmungenController =
    TextEditingController();
final TextEditingController kontrakturenController =
    TextEditingController();
final TextEditingController regelmaessigeLagerungController =
    TextEditingController();

final TextEditingController waschenController = TextEditingController();
final TextEditingController mundPflegeController = TextEditingController();
final TextEditingController zahnProteseController = TextEditingController();
final TextEditingController rasierenController = TextEditingController();
final TextEditingController anausKleidenController = TextEditingController();
final TextEditingController kostformController = TextEditingController();
final TextEditingController sondengelegtAmController = TextEditingController();
final TextEditingController letzterVerbandwechselController =
    TextEditingController();
final TextEditingController mengeDerSondenkostController =
    TextEditingController();
final TextEditingController mengeDerTeeWasserController =
    TextEditingController();
final TextEditingController essenController = TextEditingController();
final TextEditingController trinkenController = TextEditingController();
final TextEditingController andickenMitController = TextEditingController();
final TextEditingController taeglicheTrinkmengeController =
    TextEditingController();
final TextEditingController sondenArtController = TextEditingController();
final TextEditingController waschenOrtController = TextEditingController();
final TextEditingController mundPflegeOrtController = TextEditingController();
final TextEditingController rasierenOrtController = TextEditingController();
final TextEditingController anausKleidenOrtController = TextEditingController();
TwoWahlOptions optionsSondenkost = TwoWahlOptions.nein;
TwoWahlOptions optionsSchluckstoerung = TwoWahlOptions.nein;

final TextEditingController o2BeiBedarfController = TextEditingController();
final TextEditingController o2PflichtigController = TextEditingController();
final TextEditingController o2BesonderheitenController =
    TextEditingController();
final TextEditingController gewichtController = TextEditingController();
final TextEditingController groesseController = TextEditingController();
final TextEditingController gewichtskontrolleHaeufigkeitController =
    TextEditingController();
final TextEditingController letzteStuhlgangController = TextEditingController();
final TextEditingController abfuehrmittelController = TextEditingController();
final TextEditingController stomaController = TextEditingController();
final TextEditingController stomaVersorgungController = TextEditingController();
final TextEditingController schlafBesonderheitenController =
    TextEditingController();
TwoWahlOptions optionsFluessigkeitBilanz = TwoWahlOptions.nein;
TwoWahlOptions optionGewichtKontrolle = TwoWahlOptions.nein;
TwoWahlOptions optionUrinInkontinenz = TwoWahlOptions.nein;
TwoWahlOptions optionStuhlInkontinenz = TwoWahlOptions.nein;
TwoWahlOptions optionStuhlgangRegelmaessig = TwoWahlOptions.nein;
TwoWahlOptions optionStoma = TwoWahlOptions.nein;
String stomaVersorgungString = '';