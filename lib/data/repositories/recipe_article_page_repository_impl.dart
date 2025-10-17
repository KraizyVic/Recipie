
import '../../domain/entities/recipe_article_page_entity.dart';
import '../../domain/repositories/recipe_article_page_repository.dart';
import '../data_source/online/recipe_article_page_online_data_source.dart';

class RecipeArticlePageRepositoryImpl implements RecipeArticlePageRepository{
  final RecipeArticlePageOnlineDataSource recipeArticlePageOnlineDataSource;
  RecipeArticlePageRepositoryImpl({
    required this.recipeArticlePageOnlineDataSource,
  });

  @override
  Future<RecipeArticlePageEntity> fetchRecipePageDetails(String recipeUrl) {
    return recipeArticlePageOnlineDataSource.fetchRecipePageDetails(recipeUrl).then((value) => value.toEntity());

  }

}