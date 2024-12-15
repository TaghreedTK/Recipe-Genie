part of 'plan_search_cubit.dart';

@immutable
sealed class PlanSearchState {}

class NoBodyState extends PlanSearchState {}
class SearchLoadingState extends PlanSearchState {}
class SearchLoadedState extends PlanSearchState {
 
}
class SearchFailuerState extends PlanSearchState {
   final String message;
  SearchFailuerState(this.message);
}