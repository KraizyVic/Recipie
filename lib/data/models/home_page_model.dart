import 'package:html/dom.dart';
import 'package:recipa/domain/entities/home_page_entity.dart';

import '../../core/models/main_article_model.dart';
import '../../core/models/recipe_n_article_card_model.dart';

class HomePageModel{
  final HomeArticleModel mainArticle;
  final List<RecipeCardModel> randomRecipes;
  final List<ArticleCardModel> randomArticles;
  HomePageModel({
    required this.mainArticle,
    required this.randomRecipes,
    required this.randomArticles,
  });
  
  HomePageEntity toEntity(){
    return HomePageEntity(
      mainArticle: mainArticle.toEntity(),
      randomRecipes: randomRecipes.map((e) => e.toEntity()).toList(),
      randomArticles: randomArticles.map((e) => e.toEntity()).toList(),
    );
  }

  static HomePageModel fromEntity(HomePageEntity entity){
    return HomePageModel(
        mainArticle: HomeArticleModel.fromEntity(entity.mainArticle),
        randomRecipes: entity.randomRecipes.map((e) => RecipeCardModel.fromEntity(e)).toList(),
        randomArticles: entity.randomArticles.map((e) => ArticleCardModel.fromEntity(e)) .toList()
    );
  }

  static HomePageModel fromHtml(Document document){
    return HomePageModel(
      mainArticle: HomeArticleModel.fromHtml(document.querySelector("a.comp.mntl-document-card--featured.mntl-document-card.mntl-card.card.card--no-image")!),
      randomRecipes: document.getElementsByClassName("comp mntl-card-list-items mntl-universal-card mntl-document-card mntl-card card--image-top card card--no-image").map((recipe) => RecipeCardModel.fromHtml(recipe)).toList(),
      randomArticles: document.getElementsByClassName("comp mntl-vertical-list mntl-block").take(1).expand((section) => section.getElementsByClassName("comp mntl-card-list-items mntl-universal-card mntl-document-card mntl-card card--image-left card card--no-image").map((recipeArticle) => ArticleCardModel.fromHtml(recipeArticle))).toList()
    );
  }
}
