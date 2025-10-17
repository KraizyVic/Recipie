
import 'package:isar_community/isar.dart';
import 'package:recipie/core/models/recipe_n_article_card_model.dart';

class CookBookDataSource {
  final Isar isar;
  CookBookDataSource({required this.isar});

  Future<void> addToCookBook(RecipeCardModel recipeCardModel) async {
    await isar.writeTxn(() async {
      await isar.recipeCardModels.putByIndex('title',recipeCardModel);
    });
  }


  Stream<List<RecipeCardModel>> getCookBookRecipes() {
    return isar.recipeCardModels.where().watch(fireImmediately: true);
  }

  Future<void> removeRecipeFromCookBook(int id) async {
    await isar.writeTxn(() async {
      await isar.recipeCardModels.delete(id);
    });
  }
}