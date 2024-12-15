part of 'cuisines_cubit.dart';

@immutable
sealed class ListState {}


class CusinesLoadingState extends ListState {}
class CusinesLoadedState extends ListState {
 
}
class CusinesFailuerState extends ListState {
   final String message;
  CusinesFailuerState(this.message);
}
class CategoryLoadingState extends ListState {}
class CategoryLoadedState extends ListState {
 
}
class CateogryFailuerState extends ListState {
   final String message;
  CateogryFailuerState(this.message);
}