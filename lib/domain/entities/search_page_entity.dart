import 'package:recipa/core/entities/recipe_n_article_card_entity.dart';

class SearchPageEntity{
  List<RecipeCardEntity> recipeResults;
  List<String> nestPageLinks;
  SearchPageEntity({
    required this.recipeResults,
    required this.nestPageLinks,
  });
}