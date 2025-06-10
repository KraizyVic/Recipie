import 'package:recipa/core/entities/recipe_n_article_card_entity.dart';

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

class MainArticleEntity{
  final String url;
  final String title;
  final String imageUrl;
  final bool isArticle;
  final String description;

  MainArticleEntity({
    required this.url,
    required this.title,
    required this.imageUrl,
    required this.isArticle,
    required this.description,
  });
}