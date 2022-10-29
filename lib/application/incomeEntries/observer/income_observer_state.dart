part of 'income_observer_bloc.dart';

@immutable
abstract class IncomeObserverState {}

//initial status
class IncomeObserverInitial extends IncomeObserverState {}

//Loading indicator
class IncomeObserverLoading extends IncomeObserverState {}

//Fehler State
class IncomeObserverFailure extends IncomeObserverState {
  final IncomeFailure incomeFailure;
  IncomeObserverFailure({required this.incomeFailure});
}

//Geladete Seite
class IncomeObserverSuccess extends IncomeObserverState {
  //Nachdem die Seite geladen wurde, werden die Todos angezeigt
  final List<IncomeEntry> incomeEntry;
  IncomeObserverSuccess({required this.incomeEntry});
}
