import 'package:isar_community/isar.dart';
import 'package:recipie/domain/entities/cook_book_recipe_entity.dart';

class CookBookRecipeModel {
  final String name;
  final String link;
  final String imageLink;

  CookBookRecipeModel({
    required this.name,
    required this.link,
    required this.imageLink,
  });

  static CookBookRecipeModel toCookBookRecipeModel( CookBookRecipeEntity cookBookRecipeEntity ) {
    return CookBookRecipeModel(
      name: cookBookRecipeEntity.name,
      link: cookBookRecipeEntity.link,
      imageLink: cookBookRecipeEntity.imageLink,
    );
  }
  CookBookRecipeEntity toCookBookRecipeEntity() {
    return CookBookRecipeEntity(
      name: name,
      link: link,
      imageLink: imageLink,
    );
  }
}