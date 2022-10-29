// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:budgetplanner/core/failures/income_failures.dart';
import 'package:budgetplanner/domain/entities/incomeEntry.dart';
import 'package:budgetplanner/domain/repositories/income_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'income_observer_event.dart';
part 'income_observer_state.dart';

class IncomeObserverBloc
    extends Bloc<IncomeObserverEvent, IncomeObserverState> {
  //Dependencies, da der Bloc Funktionen des repositories verwendet
  final IncomeRepository incomeRepository;
  //Verhindern, dass eine Menge von Streams (weil der listener unten immer einen neuen Stream anlegt) später mein App zum Abstürzen bringen
  //Kann null sein, daher das "?"
  StreamSubscription<Either<IncomeFailure, List<IncomeEntry>>>?
      _incomeStreamSub;

  IncomeObserverBloc({required this.incomeRepository})
      : super(IncomeObserverInitial()) {
    on<IncomeObserverEvent>((event, emit) async {
      //Loading State staretn
      emit(IncomeObserverLoading());
      //Haben wir schon einen Stream, dann schließen, wenn nicht, dann nichts machen und neue Subscription kreieren
      await _incomeStreamSub?.cancel();
      //Vom Repository die watchAll Funktion ausführen
      //Auf den Stream hören
      //listen gibt Liste mit Todos oder Fehler aus
      _incomeStreamSub = incomeRepository.watchAll().listen(
          (failureOrIncomeEntry) =>
              //Neues Event updaten
              add(IncomeUpdateEvent(
                  failureOrIncomeEntry: failureOrIncomeEntry)));
    });

    //Was passiert, wenn das Event Updated aufgerufen wird?
    on<IncomeUpdateEvent>((event, emit) {
      //Testen
      print(event.failureOrIncomeEntry);
      event.failureOrIncomeEntry.fold(
          (failures) => emit(IncomeObserverFailure(incomeFailure: failures)),
          (incomeEntry) =>
              emit(IncomeObserverSuccess(incomeEntry: incomeEntry)));
    });
  }

  //Immer wenn der Bloc geschlossen wird alle Streams schließen
  @override
  Future<void> close() async {
    await _incomeStreamSub?.cancel();
    return super.close();
  }
}
