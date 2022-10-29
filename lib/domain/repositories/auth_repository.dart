import 'package:budgetplanner/core/failures/auth_failures.dart';
import 'package:budgetplanner/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  //Funktion für Logout
  Future<void> signOut();
//Funktion für automatische Authentication nach AppStart
//Option: none = nicht eingeloggt, some = eingeloggt
//CustomUser, weil wir den User erstellen
  Option<CustomUser> getSignedInUser();
  //Zwei Funktionen für Login und Registrierung
  //Unit gibt eine leere Funktion zurück (ok, weil Login erfolgreich)
  //AuthFailure sind custom failures, die bei Fehlschlag ausgegeben werden
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {required String email, required String password});
  Future<Either<AuthFailure, Unit>> loginWithEmailAndPassword(
      {required String email, required String password});
}
