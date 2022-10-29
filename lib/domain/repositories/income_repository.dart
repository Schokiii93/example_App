import 'package:budgetplanner/core/failures/income_failures.dart';
import 'package:budgetplanner/domain/entities/incomeEntry.dart';
import 'package:dartz/dartz.dart';

//Which data should be available in the app?
//What want I want to do with the data?
abstract class IncomeRepository {
  //Stream to hear to data
  Stream<Either<IncomeFailure, List<IncomeEntry>>> watchAll();

  //Create new budget
  Future<Either<IncomeFailure, Unit>> create(IncomeEntry incomeEntry);

  //Update budget
  Future<Either<IncomeFailure, Unit>> update(IncomeEntry incomeEntry);

  //Delete budget
  Future<Either<IncomeFailure, Unit>> delete(IncomeEntry incomeEntry);
}
