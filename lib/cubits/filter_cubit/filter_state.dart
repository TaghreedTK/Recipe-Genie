part of 'filter_cubit.dart';

@immutable
sealed class FilterState {}


class FilterLoadingState extends FilterState {}
class FilterLoadedState extends FilterState {
 
}
class FilterFailuerState extends FilterState {
   final String message;
  FilterFailuerState(this.message);
}