part of 'search_recipe_cubit.dart';

@immutable
sealed class SearchRecipeState {}


class NoBodyState extends SearchRecipeState {}
class SearchRecipeLoadingState extends SearchRecipeState {}
class SearchRecipeLoadedState extends SearchRecipeState {
 
}
class SearchRecipeFailuerState extends SearchRecipeState {
   final String message;
  SearchRecipeFailuerState(this.message);
}