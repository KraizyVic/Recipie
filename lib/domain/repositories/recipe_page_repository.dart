import 'package:recipa/domain/entities/recipe_page_entity.dart';

abstract class RecipePageRepository{
  Future<RecipePageEntity> fetchRecipe(String recipeUrl);
}