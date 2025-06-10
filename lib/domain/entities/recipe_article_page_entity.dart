import 'package:recipa/core/entities/recipe_n_article_card_entity.dart';

class RecipeArticlePageEntity{
  final String url;
  final String title;
  final String imageUrl;
  final String author;
  final String updatedOn;
  final List<ArticleRecipeEntity> recipes;
  final List<ArticleCardEntity> similarArticles;

  RecipeArticlePageEntity({
    required this.url,
    required this.title,
    required this.imageUrl,
    required this.author,
    required this.updatedOn,
    required this.recipes,
    required this.similarArticles,
  });
}

class ArticleRecipeEntity{
  final String url;
  final String title;
  final String imageUrl;
  final String credit;
  final String description;

  ArticleRecipeEntity({
    required this.url,
    required this.title,
    required this.imageUrl,
    required this.credit,
    required this.description,
  });
}
