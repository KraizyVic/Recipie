import 'package:html/dom.dart';
import 'package:recipa/core/models/recipe_n_article_card_model.dart';

import '../../domain/entities/search_page_entity.dart';

class SearchPageModel{
  List<RecipeCardModel> recipeResults;
  List<String> nextPageLinks;
  SearchPageModel({
    required this.recipeResults,
    required this.nextPageLinks,
  });

  SearchPageEntity toEntity(){
    return SearchPageEntity(
      recipeResults: recipeResults.map((e) => e.toEntity()).toList(),
      nestPageLinks: nextPageLinks,
    );
  }

  static SearchPageModel fromEntity(SearchPageEntity entity){
    return SearchPageModel(
      recipeResults: entity.recipeResults.map((e) => RecipeCardModel.fromEntity(e)).toList(),
      nextPageLinks: entity.nestPageLinks,
    );
  }

  static SearchPageModel fromHtml(Document document){
    return SearchPageModel(
      recipeResults: document.getElementsByClassName("comp mntl-card-list-card--extendable mntl-universal-card mntl-document-card mntl-card card card--no-image").map((recipeArticle) => RecipeCardModel.fromHtml(recipeArticle)).toList(),
      nextPageLinks: document.getElementsByClassName("mntl-pagination__item").map((e) => e.querySelector('a')!.attributes['href']!).toList(),
    );
  }
}