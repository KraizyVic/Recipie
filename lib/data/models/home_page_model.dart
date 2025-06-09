import 'package:recipa/domain/entities/home_page_entity.dart';

class HomePageModel{
  final HomeArticleModel mainArticle;
  final List<RandomRecipesModel> randomRecipes;
  final List<RandomArticlesModel> randomArticles;
  HomePageModel({
    required this.mainArticle,
    required this.randomRecipes,
    required this.randomArticles,
  });
  
  HomePageEntity toEntity(){
    return HomePageEntity(mainArticle: mainArticle.toEntity(), randomRecipes: randomRecipes.map((e) => e.toEntity()).toList(), randomArticles: randomArticles.map((e) => e.toEntity()).toList());
  }

  static HomePageModel fromEntity(HomePageEntity entity){
    return HomePageModel(mainArticle: HomeArticleModel.fromEntity(entity.mainArticle), randomRecipes: entity.randomRecipes.map((e) => RandomRecipesModel.fromEntity(e)).toList(), randomArticles: entity.randomArticles.map((e) => RandomArticlesModel.fromEntity(e)) .toList());
  }

}

class HomeArticleModel{
  final String url;
  final String title;
  final String imageUrl;
  final String description;

  HomeArticleModel({
    required this.url,
    required this.title,
    required this.imageUrl,
    required this.description,
  });

  MainArticleEntity toEntity(){
    return MainArticleEntity(url:url,title: title, imageUrl: imageUrl, description: description);
  }

  static HomeArticleModel fromEntity(MainArticleEntity entity){
    return HomeArticleModel(url: entity.url, title: entity.title, imageUrl: entity.imageUrl, description: entity.description);
  }

}

class RandomRecipesModel{
  final String url;
  final String title;
  final String category;
  final String imageUrl;

  RandomRecipesModel({
    required this.url,
    required this.title,
    required this.category,
    required this.imageUrl,
  });

  RandomRecipesEntity toEntity(){
    return RandomRecipesEntity(url: url,title: title, category: category, imageUrl: imageUrl);
  }

  static RandomRecipesModel fromEntity(RandomRecipesEntity entity){
    return RandomRecipesModel(url: entity.url,title: entity.title, category: entity.category, imageUrl: entity.imageUrl);
  }
}
class RandomArticlesModel{
  final String url;
  final String title;
  final String category;
  final String imageUrl;

  RandomArticlesModel({
    required this.url,
    required this.title,
    required this.category,
    required this.imageUrl,
  });

  RandomArticlesEntity toEntity(){
    return RandomArticlesEntity(url: url,title: title, category: category, imageUrl: imageUrl);
  }

  static RandomArticlesModel fromEntity(RandomArticlesEntity entity){
    return RandomArticlesModel(url: entity.url,title: entity.title, category: entity.category, imageUrl: entity.imageUrl);
  }

}