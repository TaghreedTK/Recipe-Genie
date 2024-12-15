part of 'recipe_cubit.dart';

@immutable
sealed class RecipeState {}

class RecipeLoadingState extends RecipeState {}

class IngredientsLoadedState extends RecipeState {}

class IngredientsFailuerState extends RecipeState {
  final String message;
  IngredientsFailuerState(this.message);
}

class DetailsLoadedState extends RecipeState {
  final String Summary;
  DetailsLoadedState(this.Summary);
}

class DetailsFailuerState extends RecipeState {
  final String message;
  DetailsFailuerState(this.message);
}
class InstructionsLoadedState extends RecipeState {

  InstructionsLoadedState();
}

class InstructionsFailuerState extends RecipeState {
  final String message;
  InstructionsFailuerState(this.message);
}