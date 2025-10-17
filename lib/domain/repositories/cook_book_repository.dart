
import 'package:recipie/core/entities/recipe_n_article_card_entity.dart';

abstract class CookBookRepository {
  Future<void> addRecipeToCookBook(RecipeCardEntity cookBookRecipeEntity);
  Stream<List<RecipeCardEntity>> getCookBookRecipes();
  Future<void> removeRecipeFromCookBook(int id);
}