import 'package:budgetplanner/core/failures/budget_failures.dart';
import 'package:budgetplanner/domain/entities/incomeEntry.dart';
import 'package:budgetplanner/core/failures/income_failures.dart';
import 'package:budgetplanner/domain/repositories/income_repository.dart';
import 'package:budgetplanner/infrastructure/extensions/firebase_helpers_income.dart';
import 'package:budgetplanner/infrastructure/models/income_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class IncomeRepositoryImpl implements IncomeRepository {
  //firestore verwenden
  final FirebaseFirestore firestore;
  IncomeRepositoryImpl({required this.firestore});

  @override
  Stream<Either<IncomeFailure, List<IncomeEntry>>> watchAll() async* {
    final userDoc = await firestore.userDocument();
    yield* userDoc.incomeCollection
        .snapshots()
        .map((snapshot) => right<IncomeFailure, List<IncomeEntry>>(snapshot.docs
            .map((doc) => IncomeModel.fromFirestore(doc).toDomain())
            .toList()))
        //error handling (left side)
        .handleError((e) {
      if (e is FirebaseException) {
        if (e.code.contains("permssion-denied") ||
            e.code.contains("PERMISSION-DENIED")) {
          return left(InsufficientPermissionsIncome());
        } else {
          return left(UnexpectedFailureIncome());
        }
      } else {
        return left(UnexpectedFailureIncome());
      }
    });
  }

  @override
  Future<Either<IncomeFailure, Unit>> create(IncomeEntry incomeEntry) async {
    throw UnimplementedError();
  }

  @override
  Future<Either<IncomeFailure, Unit>> delete(IncomeEntry incomeEntry) {
    throw UnimplementedError();
  }

  @override
  Future<Either<IncomeFailure, Unit>> update(IncomeEntry incomeEntry) {
    throw UnimplementedError();
  }
}
