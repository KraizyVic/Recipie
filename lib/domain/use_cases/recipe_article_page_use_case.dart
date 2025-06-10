
import '../entities/recipe_article_page_entity.dart';
import '../repositories/recipe_article_page_repository.dart';

class FetchRecipeArticleUseCase{
  final RecipeArticlePageRepository recipeArticlePageRepository;
  FetchRecipeArticleUseCase({required this.recipeArticlePageRepository});

  Future<RecipeArticlePageEntity> call(String recipeUrl) async{
    return await recipeArticlePageRepository.fetchRecipePageDetails(recipeUrl);
  }

}