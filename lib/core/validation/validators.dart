//Variablen für Email und Passwort
late String email;
late String password;

//Validierung für E-Mail
String? validateEmail(String? input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  //Prüfung, ob Null oder Empty
  //Das bedeutet 'oder' ||
  if (input == null || input.isEmpty) {
    return "Bitte E-Mail eingeben";
    //Wenn Regex erfüllt, dann return null, weil E-Mail korrekt
  } else if (RegExp(emailRegex).hasMatch(input)) {
    email = input;
    return null;
    //Es steht was drin, was nicht zum E-Mail Format passt
  } else {
    return "Bitte prüfe das Format deiner E-Mail";
  }
}

//Prüfung, ob Null oder Empty
//Das bedeutet 'oder' ||
String? validatePassword(String? input) {
  if (input == null || input.isEmpty) {
    return "Bitte Passwort eingeben";
    //Wenn Passwort lang genug, dann return null, weil ok
  } else if (input.length >= 6) {
    password = input;
    return null;
    //Wenn Passwort nicht lang genug, dann Fehler
  } else {
    return "Passwort zu kurz";
  }
}
