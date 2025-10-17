

import '../entities/recipe_page_entity.dart';
import '../repositories/recipe_page_repository.dart';

class FetchRecipeUseCase{
  final RecipePageRepository recipePageRepository;
  FetchRecipeUseCase({required this.recipePageRepository});

  Future<RecipePageEntity> call(String recipeUrl){
    return recipePageRepository.fetchRecipe(recipeUrl);
  }
}