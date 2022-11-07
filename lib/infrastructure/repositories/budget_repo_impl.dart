import 'package:budgetplanner/domain/entities/budgetEntry.dart';
import 'package:budgetplanner/core/failures/budget_failures.dart';
import 'package:budgetplanner/domain/repositories/budget_repository.dart';
import 'package:budgetplanner/infrastructure/models/budget_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:budgetplanner/infrastructure/extensions/firebase_helpers.dart';

//Implementation auf budget_repository.dart classes
//WatchAll method
class BudgetRepositoryImpl implements BudgetRepository {
  //Firestore
  final FirebaseFirestore firestore;
  BudgetRepositoryImpl({required this.firestore});

  @override
  Stream<Either<BudgetFailure, List<BudgetEntry>>> watchAll() async* {
    final userDoc = await firestore.userDocument();
    yield* userDoc.entryCollection
        .snapshots()
        .map((snapshot) => right<BudgetFailure, List<BudgetEntry>>(snapshot.docs
            .map((doc) => BudgetModel.fromFirestore(doc).toDomain())
            .toList()))
        .handleError((e) {
      if (e is FirebaseException) {
        if (e.code.contains("permssion-denied") ||
            e.code.contains("PERMISSION-DENIED")) {
          return left(InsufficientPermissions());
        } else {
          return left(UnexpectedFailure());
        }
      } else {
        return left(UnexpectedFailure());
      }
    });
  }

  @override
  Future<Either<BudgetFailure, Unit>> create(BudgetEntry budgetEntry) async {
    try {
      //Pfad aufrufen (user documents)
      final userDoc = await firestore.userDocument();
      //Entity muss in Model umgewandelt werden (Konstruktor fromDomain)
      final budgetModel = BudgetModel.fromDomain(budgetEntry);
      //budget updaten unter der vorhandenen ID
      /*budgetCollection geht in die Sammlung budgets rein*/
      //budget updaten und in Map umwandeln
      await userDoc.entryCollection
          .doc(budgetModel.id)
          .update(budgetModel.toMap());
      //Wenn erfolgreich, dann rechte Seite ausgeben
      return right(unit);
      //Fehler abfangen
    } on FirebaseException catch (e) {
      if (e.code.contains("PERMISSION_DENIED")) {
        return left(InsufficientPermissions());
      } else {
        return left(UnexpectedFailure());
      }
    }
  }

  @override
  Future<Either<BudgetFailure, Unit>> delete(BudgetEntry budgetEntry) async {
    try {
      //Pfad aufrufen (user documents)
      final userDoc = await firestore.userDocument();
      //Entity muss in Model umgewandelt werden (Konstruktor fromDomain)
      final budgetModel = BudgetModel.fromDomain(budgetEntry);
      /*todoCollection geht in die Sammlung todos rein*/
      //To-do löschen unter der vorhandenen ID
      await userDoc.entryCollection.doc(budgetModel.id).delete();
      //Wenn erfolgreich, dann rechte Seite ausgeben
      return right(unit);
      //Fehler abfangen
    } on FirebaseException catch (e) {
      if (e.code.contains("PERMISSION_DENIED")) {
        return left(InsufficientPermissions());
      } else {
        return left(UnexpectedFailure());
      }
    }
  }

  @override
  Future<Either<BudgetFailure, Unit>> update(BudgetEntry budgetEntry) async {
    try {
      //Pfad aufrufen (user documents)
      final userDoc = await firestore.userDocument();
      //Entity muss in Model umgewandelt werden (Konstruktor fromDomain)
      final budgetModel = BudgetModel.fromDomain(budgetEntry);
      //To-do updaten unter der vorhandenen ID
      /*todoCollection geht in die Sammlung todos rein*/
      //To-do updaten und in Map umwandeln
      await userDoc.entryCollection
          .doc(budgetModel.id)
          .update(budgetModel.toMap());
      //Wenn erfolgreich, dann rechte Seite ausgeben
      return right(unit);
      //Fehler abfangen
    } on FirebaseException catch (e) {
      if (e.code.contains("PERMISSION_DENIED")) {
        return left(InsufficientPermissions());
      } else {
        return left(UnexpectedFailure());
      }
    }
  }
}
