import '../entities/recipe_article_page_entity.dart';

abstract class RecipeArticlePageRepository{
  Future<RecipeArticlePageEntity> fetchRecipePageDetails(String recipeUrl);
}