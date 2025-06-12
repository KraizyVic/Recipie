import 'package:html/dom.dart';
import 'package:recipa/core/models/recipe_n_article_card_model.dart';

import '../../domain/entities/a_to_z_item_page_entity.dart';


class AToZItemPageModel{
  final String title;
  final String? image;
  final String? description;
  final List<TagsModel> tags;
  final ArticleCardModel? articleCardModel;
  final List<RecipeCardModel> recipes;

  AToZItemPageModel({
    required this.title,
    required this.image,
    required this.description,
    required this.tags,
    required this.articleCardModel,
    required this.recipes,
  });

  static AToZItemPageModel fromEntity(AToZItemPageEntity aToZItemPageEntity){
    return AToZItemPageModel(
      title: aToZItemPageEntity.title,
      image: aToZItemPageEntity.image,
      description: aToZItemPageEntity.description,
      tags: aToZItemPageEntity.tags.map((e) => TagsModel.fromEntity(e)).toList(),
      // TODO: Implement latwor if necessary
      articleCardModel: null,// aToZItemPageEntity.articleCardEntity == null ? null : ArticleCardModel.fromEntity(aToZItemPageEntity.articleCardEntity!),
      recipes: aToZItemPageEntity.recipes.map((recipes)=> RecipeCardModel.fromEntity(recipes)).toList(),
    );
  }

  AToZItemPageEntity toEntity(){
    return AToZItemPageEntity(
      title: title,
      image: image,
      description: description,
      tags: tags.map((e) => e.toEntity()).toList(),
      // TODO: Implement latwor if necessary
      articleCardEntity: null,
      recipes: recipes.map((e) => e.toEntity()).toList(),
    );
  }

  static AToZItemPageModel fromHtml(Document document){
    return AToZItemPageModel(
      title: document.querySelector("h1.comp.mntl-taxonomysc-heading.mntl-text-block")?.text.trim() ?? "" ,
      image: document.querySelector("div.primary-image__media > img")?.attributes['src'],
      description: document.querySelector("div.comp.mntl-sc-block.mntl-sc-block-html")?.text.trim(),
      tags: document.getElementsByClassName("comp mntl-taxonomy-nodes__item mntl-block").map((e) => TagsModel.fromHtml(e)).toList(),
      // TODO: Implement latwor if necessary
      articleCardModel: null,
      recipes: document.getElementsByClassName("comp mntl-card-list-items mntl-universal-card mntl-document-card mntl-card card card--no-image").map((e) => RecipeCardModel.fromHtml(e)).toList(),
    );
  }
}

class TagsModel{
  final String url;
  final String tagName;

  TagsModel({
    required this.url,
    required this.tagName,
  });

  static TagsModel fromEntity(TagsEntity entity){
    return TagsModel(
      url: entity.url,
      tagName: entity.tagName,
    );
  }

  TagsEntity toEntity(){
    return TagsEntity(
      url: url,
      tagName: tagName,
    );
  }

  static TagsModel fromHtml(Element element){
    return TagsModel(
      url: element.querySelector("a")?.attributes['href'] ?? "",
      tagName: element.querySelector("span.link__wrapper")?.text.trim() ?? "",
    );
  }
}