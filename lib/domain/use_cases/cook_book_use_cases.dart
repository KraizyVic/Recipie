import 'package:recipie/core/entities/recipe_n_article_card_entity.dart';
import 'package:recipie/domain/repositories/cook_book_repository.dart';

class AddRecipeToCookBook{
  final CookBookRepository cookBookRepository;
  AddRecipeToCookBook({required this.cookBookRepository});

  Future<void> addRecipeToCookBook(RecipeCardEntity recipe) async{
    await cookBookRepository.addRecipeToCookBook(recipe);
  }
}

class GetCookBookRecipes{
  final CookBookRepository cookBookRepository;
  GetCookBookRecipes({required this.cookBookRepository});

  Stream<List<RecipeCardEntity>> getCookBookRecipes() {
    return cookBookRepository.getCookBookRecipes();
  }
}

class RemoveRecipeFromCookBook {
  final CookBookRepository cookBookRepository;
  RemoveRecipeFromCookBook({required this.cookBookRepository});

  Future<void> deleteRecipeFromCookBook(int id) async {
    await cookBookRepository.removeRecipeFromCookBook(id);
  }
}