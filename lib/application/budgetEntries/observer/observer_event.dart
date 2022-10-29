part of 'observer_bloc.dart';

@immutable
abstract class ObserverEvent {}

//read entries in firestore
class ObserveAllEvent extends ObserverEvent {}

//Event for updates
class EntriesUpdateEvent extends ObserverEvent {
  final Either<BudgetFailure, List<BudgetEntry>> failureOrBudgetEntry;
  EntriesUpdateEvent({required this.failureOrBudgetEntry});
}
