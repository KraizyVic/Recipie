import 'package:html/dom.dart';

import '../entities/main_article_entity.dart';

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
