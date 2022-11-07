part of 'income_observer_bloc.dart';

@immutable
abstract class IncomeObserverEvent {}

//event hört auf todos (observer), damit diese angezeigt werden
class IncomeObserveAllEvent extends IncomeObserverEvent {}

//Event für Update
class IncomeUpdateEvent extends IncomeObserverEvent {
  final Either<IncomeFailure, List<IncomeEntry>> failureOrIncomeEntry;
  IncomeUpdateEvent({required this.failureOrIncomeEntry});
}
