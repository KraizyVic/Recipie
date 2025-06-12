import 'package:recipa/core/entities/recipe_n_article_card_entity.dart';

import '../../core/entities/main_article_entity.dart';

class HomePageEntity{
  final MainArticleEntity mainArticle;
  final List<RecipeCardEntity> randomRecipes;
  final List<ArticleCardEntity> randomArticles;
  HomePageEntity({
    required this.mainArticle,
    required this.randomRecipes,
    required this.randomArticles,
  });
}