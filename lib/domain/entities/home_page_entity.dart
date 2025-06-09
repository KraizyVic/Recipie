class HomePageEntity{
  final MainArticleEntity mainArticle;
  final List<RandomRecipesEntity> randomRecipes;
  final List<RandomArticlesEntity> randomArticles;
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
  final String description;

  MainArticleEntity({
    required this.url,
    required this.title,
    required this.imageUrl,
    required this.description,
  });
}

class RandomRecipesEntity{
  final String url;
  final String title;
  final String category;
  final String imageUrl;

  RandomRecipesEntity({
    required this.url,
    required this.title,
    required this.category,
    required this.imageUrl,
  });
}

class RandomArticlesEntity{
  final String url;
  final String title;
  final String category;
  final String imageUrl;

  RandomArticlesEntity({
    required this.url,
    required this.title,
    required this.category,
    required this.imageUrl,
  });
}