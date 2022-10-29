part of 'observer_bloc.dart';

@immutable
abstract class ObserverState {}

//intial status
class ObserverInitial extends ObserverState {}

//loading indicator
class ObserverLoading extends ObserverState {}

//failure state
class ObserverFailure extends ObserverState {
  final BudgetFailure budgetFailure;
  ObserverFailure({required this.budgetFailure});
}

//loaded page
class ObserverSucccess extends ObserverState {
  //show entries after loading the page
  final List<BudgetEntry> budgetEntry;
  ObserverSucccess({required this.budgetEntry});
}
