import 'package:html/dom.dart';
import 'package:recipa/domain/entities/recipe_article_page_entity.dart';

import '../../core/models/recipe_n_article_card_model.dart';

class ArticlePageModel{
  final String url;
  final String title;
  final String imageUrl;
  final String author;
  final String updatedOn;
  final List<ArticleRecipeModel> recipes;
  final List<ArticleCardModel> similarArticles;

  ArticlePageModel({
    required this.url,
    required this.title,
    required this.imageUrl,
    required this.author,
    required this.updatedOn,
    required this.recipes,
    required this.similarArticles,
  });

  static ArticlePageModel fromEntity(RecipeArticlePageEntity entity){
    return ArticlePageModel(
      url: entity.url,
      title: entity.title,
      imageUrl: entity.imageUrl,
      author: entity.author,
      updatedOn: entity.updatedOn,
      recipes: entity.recipes.map((e) => ArticleRecipeModel.fromEntity(e)).toList(),
      similarArticles: entity.similarArticles.map((e) => ArticleCardModel.fromEntity(e)).toList(),
    );
  }

  RecipeArticlePageEntity toEntity(){
    return RecipeArticlePageEntity(
      url: url,
      title: title,
      imageUrl: imageUrl,
      author: author,
      updatedOn: updatedOn,
      recipes: recipes.map((e) => e.toEntity()).toList(),
      similarArticles: similarArticles.map((e) => e.toEntity()).toList(),
    );
  }

  static ArticlePageModel fromHtml(Document document){
    return ArticlePageModel(
      url: document.querySelector("a.mntl-attribution__item-name")?.attributes['content'] ?? "",
      title: document.querySelector("h1.article-heading.text-headline-400")?.text.trim() ?? "",
      imageUrl: document.querySelector("div.primary-image__media div.img-placeholder > img")?.attributes['src'] ?? document.querySelector("div.primary-image__media div.img-placeholder > img")?.attributes['srcset'] ?? "",
      author: document.querySelector("a.mntl-attribution__item-name")?.text.trim() ?? "",
      updatedOn: document.querySelector("div.mntl-attribution__item-date")?.text.trim() ?? "",
      recipes: document.getElementsByClassName("comp list-sc-item mntl-block mntl-sc-list-item").map((e) => ArticleRecipeModel.fromHtml(e)).toList(),
      similarArticles: document.getElementsByClassName("comp mntl-card-list-items mntl-universal-card mntl-document-card mntl-card card card--no-image").map((e) => ArticleCardModel.fromHtml(e)).toList(),
    );
  }
}

class ArticleRecipeModel{
  final String url;
  final String title;
  final String imageUrl;
  final String credit;
  final String description;

  ArticleRecipeModel({
    required this.url,
    required this.title,
    required this.imageUrl,
    required this.credit,
    required this.description,
  });

  static ArticleRecipeModel fromEntity(ArticleRecipeEntity entity){
    return ArticleRecipeModel(
      url: entity.url,
      title: entity.title,
      imageUrl: entity.imageUrl,
      credit: entity.credit,
      description: entity.description,
    );
  }

  ArticleRecipeEntity toEntity(){
    return ArticleRecipeEntity(
      url: url,
      title: title,
      imageUrl: imageUrl,
      credit: credit,
      description: description,
    );
  }

  static ArticleRecipeModel fromHtml(Element element){
    return ArticleRecipeModel(
      url: element.querySelector("a.mntl-sc-block-universal-featured-link__link.mntl-text-link.button--contained-standard.text-label-300")?.attributes['href'] ?? "",
      title: element.querySelector("span.mntl-sc-block-heading__text")?.text.trim() ?? "",
      imageUrl: element.querySelector("img")?.attributes['src'] ?? element.querySelector("img")?.attributes['data-src'] ?? "null",
      credit: element.querySelector("span.figure-article-caption-owner")?.text.trim() ?? "",
      description: element.querySelector("p.comp.mntl-sc-block.mntl-sc-block-html")?.text.trim() ?? "",
    );
  }
}

