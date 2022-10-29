import 'package:budgetplanner/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import 'package:budgetplanner/core/failures/auth_failures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/repositories/auth_repository.dart';
import 'package:budgetplanner/infrastructure/extensions/firebase_user_mapper.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth firebaseAuth;
  AuthRepositoryImpl({required this.firebaseAuth});
  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {required String email, required String password}) async {
    //wir verwenden die Standard Funktion von Firebase zur Useranlage
    //wirft Standard-Exceptions
    try {
      //Wenn Reg klappt, user anlegen und rechte Seite (unit) returnen
      //unit ist einfach ein leerer String
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      //Fehler ausgeben, wenn Email bereits vorhanden
      //zuerst über "createUserWithEmailAndPassword" oben hovern und den Fehler raus kopieren (email-already-in-use)
      if (e.code == "email-already-in-use") {
        return left(emailAlreadyInUseFailure());
      } else {
        //Serverfehler ausgeben
        return left(serverFailure());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      //Wenn Login klappt, einloggen und rechte Seite (unit) returnen
      //Unit ist einfach ein leerer String
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      //Fehler ausgeben, wenn Email bereits vorhanden
      //zuerst über "createUserWithEmailAndPassword" oben hovern und den Fehler raus kopieren (email-already-in-use)
      if (e.code == "wrong-password" || e.code == "user-not-found") {
        return left(invalidEmailAndPasswordFailure());
      } else {
        //Serverfehler ausgeben
        return left(serverFailure());
      }
    }
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  @override
  //OptionOf entscheidet, ob none oder some in der Option steht
  //wenn null: kein currentUser -> Option = null
  //wenn some: currentUser wird in customUser umgewandelt und bekommen diesen
  Option<CustomUser> getSignedInUser() =>
      optionOf(firebaseAuth.currentUser?.toDomain());
}
