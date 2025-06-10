import 'package:html/dom.dart';
import 'package:recipa/domain/entities/home_page_entity.dart';

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
      randomRecipes: document.getElementsByClassName("comp list-sc-item mntl-block mntl-sc-list-item").map((e) => RecipeCardModel.fromHtml(e)).toList(),
      randomArticles: document.getElementsByClassName("comp mntl-vertical-list mntl-block").take(1).expand((section) => section.getElementsByClassName("comp mntl-card-list-items mntl-universal-card mntl-document-card mntl-card card--image-left card card--no-image").map((recipeArticle) => ArticleCardModel.fromHtml(recipeArticle))).toList()
    );
  }

}

class HomeArticleModel{
  final String url;
  final String title;
  final String imageUrl;
  final bool isArticle;
  final String description;

  HomeArticleModel({
    required this.url,
    required this.title,
    required this.imageUrl,
    required this.isArticle,
    required this.description,
  });

  MainArticleEntity toEntity(){
    return MainArticleEntity(
      url:url,
      title: title,
      imageUrl: imageUrl,
      isArticle: isArticle,
      description: description,
    );
  }

  static HomeArticleModel fromEntity(MainArticleEntity entity){
    return HomeArticleModel(
      url: entity.url,
      title: entity.title,
      imageUrl: entity.imageUrl,
      isArticle: entity.isArticle,
      description: entity.description
    );
  }

  static HomeArticleModel fromHtml(Element element){
    return HomeArticleModel(
      url: element.attributes['href'] ?? "null",
      title: element.querySelector("div.card__content > span.card__title > span.card__title-text")?.text.trim() ?? "null",
      imageUrl: element.querySelector("div.primary-image__media > div.img-placeholder > img")?.attributes['src'] ?? "null",
      isArticle: element.querySelector("a.comp.mntl-document-card--featured.mntl-document-card.mntl-card.card.card--no-image")?.attributes['href']?.startsWith("https://www.allrecipes.com/recipe/") ?? false ? false : true,
      description: element.querySelector("div.card__content > div.card__description")?.attributes['data-card-description'] ?? "null",
    );
  }
}
