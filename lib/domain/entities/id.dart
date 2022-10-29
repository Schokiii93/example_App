// ignore: depend_on_referenced_packages
import 'package:uuid/uuid.dart';

class UniqueID {
  //Konstruktor
  const UniqueID._(this.value);

  //Variable
  final String value;

  //Factory Konstruktor für uuid
  factory UniqueID() {
    //zeitabhängig wird eine Uuid erstellt (v1)
    return UniqueID._(const Uuid().v1());
  }

  //Factory Konstruktor für String
  factory UniqueID.fromUniqueString(String uniqueID) {
    return UniqueID._(uniqueID);
  }
}
