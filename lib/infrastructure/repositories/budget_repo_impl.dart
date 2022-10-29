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
  Future<Either<BudgetFailure, Unit>> create(BudgetEntry budgetEntry) {
    throw UnimplementedError();
  }

  @override
  Future<Either<BudgetFailure, Unit>> delete(BudgetEntry budgetEntry) {
    throw UnimplementedError();
  }

  @override
  Future<Either<BudgetFailure, Unit>> update(BudgetEntry budgetEntry) {
    throw UnimplementedError();
  }
}
