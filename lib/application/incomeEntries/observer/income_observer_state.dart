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
  //Show income after page was loaded
  final List<IncomeEntry> incomeEntry;
  IncomeObserverSuccess({required this.incomeEntry});
}
