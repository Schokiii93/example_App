import 'package:budgetplanner/core/failures/budget_failures.dart';
import 'package:budgetplanner/domain/entities/budgetEntry.dart';
import 'package:dartz/dartz.dart';

//Which data should be available in the app?
//What want I want to do with the data?
abstract class BudgetRepository {
  //Stream to hear to data
  Stream<Either<BudgetFailure, List<BudgetEntry>>> watchAll();

  //Create new budget
  Future<Either<BudgetFailure, Unit>> create(BudgetEntry budgetEntry);

  //Update budget
  Future<Either<BudgetFailure, Unit>> update(BudgetEntry budgetEntry);

  //Delete budget
  Future<Either<BudgetFailure, Unit>> delete(BudgetEntry budgetEntry);
}
