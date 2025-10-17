import 'package:recipie/core/entities/recipe_n_article_card_entity.dart';
import 'package:recipie/core/models/recipe_n_article_card_model.dart';
import 'package:recipie/data/data_source/local/cook_book_data_source.dart';
import 'package:recipie/domain/repositories/cook_book_repository.dart';

class CookBookRepositoryImpl extends CookBookRepository{
  final CookBookDataSource cookBookDataSource;
  CookBookRepositoryImpl({
    required this.cookBookDataSource,
  });

  @override
  Future<void> addRecipeToCookBook(RecipeCardEntity cookBookRecipeEntity) async {
    await cookBookDataSource.addToCookBook(RecipeCardModel.fromEntity(cookBookRecipeEntity));
  }

  @override
  Stream<List<RecipeCardEntity>> getCookBookRecipes() {
    return cookBookDataSource.getCookBookRecipes().map((recipes) => recipes.map((recipe) => recipe.toEntity()).toList());
  }

  @override
  Future<void> removeRecipeFromCookBook(int id) {
    return cookBookDataSource.removeRecipeFromCookBook(id);
  }

}
