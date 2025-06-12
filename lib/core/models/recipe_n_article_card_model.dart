import 'package:html/dom.dart';

import '../entities/recipe_n_article_card_entity.dart';

class RecipeCardModel{
  final String url;
  final String title;
  final String category;
  final bool isArticle;
  final String imageUrl;

  RecipeCardModel({
    required this.url,
    required this.title,
    required this.category,
    required this.isArticle,
    required this.imageUrl,
  });

  RecipeCardEntity toEntity(){
    return RecipeCardEntity(
        url: url,
        title: title,
        category: category,
        isArticle: isArticle,
        imageUrl: imageUrl
    );
  }

  static RecipeCardModel fromEntity(RecipeCardEntity entity){
    return RecipeCardModel(
        url: entity.url,
        title: entity.title,
        category: entity.category,
        isArticle: entity.isArticle,
        imageUrl: entity.imageUrl
    );
  }

  static RecipeCardModel fromHtml(Element element){
    return RecipeCardModel(
      url: element.attributes['href'] ?? "null",
      title: element.querySelector("div.card__content > span.card__title > span.card__title-text")?.text.trim() ?? "null",
      category: element.querySelector("div.card__content")?.attributes['data-tag'] ?? "null",
      isArticle: element.querySelector("div.comp.card__favorite.mm-myrecipes-favorite") == null ? true : false,
      imageUrl: element.querySelector("img")?.attributes['src'] ?? element.querySelector("img")?.attributes['data-src'] ?? "null",
    );
  }
}

class ArticleCardModel{
  final String url;
  final String title;
  final String category;
  final bool isArticle;
  final String imageUrl;

  ArticleCardModel({
    required this.url,
    required this.title,
    required this.category,
    required this.isArticle,
    required this.imageUrl,
  });

  ArticleCardEntity toEntity(){
    return ArticleCardEntity(
        url: url,
        title: title,
        category: category,
        isArticle: isArticle,
        imageUrl: imageUrl
    );
  }

  static ArticleCardModel fromEntity(ArticleCardEntity entity){
    return ArticleCardModel(
        url: entity.url,
        title: entity.title,
        category: entity.category,
        isArticle: entity.isArticle,
        imageUrl: entity.imageUrl
    );
  }

  static ArticleCardModel fromHtml(Element element){
    return ArticleCardModel(
      url: element.attributes['href'] ?? "",
      title: element.querySelector("span.card__title-text")?.text.trim() ?? "",
      category: element.querySelector("div.card__content ")?.attributes['data-tag'] ?? "",
      isArticle: element.querySelector("div.comp.card__favorite.mm-myrecipes-favorite") == null ? true : false,
      imageUrl: element.querySelector("img")?.attributes['src'] ?? element.querySelector("img")?.attributes['data-src'] ?? "null",
    );
  }
}