class RecipeCardEntity{
  final String url;
  final String title;
  final String category;
  final bool isArticle;
  final String imageUrl;

  RecipeCardEntity({
    required this.url,
    required this.title,
    required this.category,
    required this.isArticle,
    required this.imageUrl,
  });
}

class ArticleCardEntity{
  final String url;
  final String title;
  final String category;
  final bool isArticle;
  final String imageUrl;

  ArticleCardEntity({
    required this.url,
    required this.title,
    required this.category,
    required this.isArticle,
    required this.imageUrl,
  });
}