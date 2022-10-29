// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:budgetplanner/core/failures/budget_failures.dart';
import 'package:budgetplanner/domain/entities/budgetEntry.dart';
import 'package:budgetplanner/domain/repositories/budget_repository.dart';

part 'observer_event.dart';
part 'observer_state.dart';

class ObserverBloc extends Bloc<ObserverEvent, ObserverState> {
  final BudgetRepository budgetRepository;

  //Verhindern, dass eine Menge von Streams (weil der listener unten immer einen neuen Stream anlegt) später mein App zum Abstürzen bringen
  //Kann null sein, daher das "?"
  StreamSubscription<Either<BudgetFailure, List<BudgetEntry>>>?
      _budgetStreamSub;

  ObserverBloc({required this.budgetRepository}) : super(ObserverInitial()) {
    on<ObserveAllEvent>((event, emit) async {
      //Loading State starten
      emit(ObserverLoading());
      //Haben wir schon einen Stream, dann schließen, wenn nicht, dann nichts machen und neue Subscription kreieren
      await _budgetStreamSub?.cancel();
      //Vom Repository die watchAll Funktion ausführen
      //Auf den Stream hören
      //listen gibt Liste mit Todos oder Fehler aus
      _budgetStreamSub = budgetRepository.watchAll().listen(
          (failureOrBudgetEntry) => add(
              EntriesUpdateEvent(failureOrBudgetEntry: failureOrBudgetEntry)));
    });

    //Was passiert, wenn das Event Updated aufgerufen wird?
    on<EntriesUpdateEvent>((event, emit) {
      // ignore: avoid_print
      print(event.failureOrBudgetEntry);
      event.failureOrBudgetEntry.fold(
          (failures) => emit(ObserverFailure(budgetFailure: failures)),
          (budgetEntry) => emit(ObserverSucccess(budgetEntry: budgetEntry)));
    });
  }

  //Immer wenn der Bloc geschlossen wird alle Streams schließen
  @override
  Future<void> close() async {
    await _budgetStreamSub?.cancel();
    return super.close();
  }
}
