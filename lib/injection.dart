import 'package:budgetplanner/application/auth/authBloc/auth_bloc.dart';
import 'package:budgetplanner/application/auth/signUpForm/sign_up_form_bloc.dart';
import 'package:budgetplanner/application/budgetEntries/observer/observer_bloc.dart';
import 'package:budgetplanner/domain/repositories/auth_repository.dart';
import 'package:budgetplanner/domain/repositories/budget_repository.dart';
import 'package:budgetplanner/domain/repositories/income_repository.dart';
import 'package:budgetplanner/infrastructure/repositories/auth_repositotiries_impl.dart';
import 'package:budgetplanner/infrastructure/repositories/budget_repo_impl.dart';
import 'package:budgetplanner/infrastructure/repositories/income_repo_impl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.I;
//? ################### auth #####################
//init, async da Registrierung/Login etwas dauern
Future<void> init() async {
  //State Management
  sl.registerFactory(() => SignUpFormBloc(authRepository: sl()));
  sl.registerFactory(() => AuthBloc(authRepository: sl()));

  //repos
  //vom Typ AuthRepository -> AuthRepositoryImpl registrieren
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(firebaseAuth: sl()));

  //!extern
  final firebaseAuth = FirebaseAuth.instance;
  sl.registerLazySingleton(() => firebaseAuth);

  //? ################### BudgetEntry #####################
  //! repos
  sl.registerLazySingleton<BudgetRepository>(
      () => BudgetRepositoryImpl(firestore: sl()));
  sl.registerLazySingleton<IncomeRepository>(
      () => IncomeRepositoryImpl(firestore: sl()));

//! extern
  final firestore = FirebaseFirestore.instance;
  sl.registerLazySingleton(() => firestore);

  //! statemanagement
  sl.registerFactory(() => ObserverBloc(budgetRepository: sl()));
  //sl.registerFactory(() => IncomeObserverBloc(incomeRepository: sl()));
}
