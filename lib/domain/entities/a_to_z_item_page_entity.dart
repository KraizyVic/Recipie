import 'package:recipa/core/entities/recipe_n_article_card_entity.dart';

class AToZItemPageEntity{
  final String title;
  final String? image;
  final String? description;
  final List<TagsEntity> tags;
  final ArticleCardEntity? articleCardEntity;
  final List<RecipeCardEntity> recipes;

  AToZItemPageEntity({
    required this.title,
    required this.image,
    required this.description,
    required this.tags,
    required this.articleCardEntity,
    required this.recipes,
  });
}

class TagsEntity{
  final String url;
  final String tagName;

  TagsEntity({
    required this.url,
    required this.tagName,
  });
}