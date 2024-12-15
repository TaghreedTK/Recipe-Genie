part of 'similer_cubit.dart';

@immutable
sealed class SimilerState {}

class SimilerRecipeLoadingState extends SimilerState {}

class SimilerRecipeLoadedState extends SimilerState {}

class SimilerRecipeFailuerState extends SimilerState {
  final String message;
  SimilerRecipeFailuerState(this.message);
}
