import 'package:recipa/domain/entities/recipe_page_entity.dart';

import '../../domain/repositories/recipe_page_repository.dart';
import '../data_source/online/recipe_page_online_data_source.dart';

class RecipePageRepositoryImpl implements RecipePageRepository{
  final RecipePageOnlineDataSource recipePageOnlineDataSource;
  RecipePageRepositoryImpl({
    required this.recipePageOnlineDataSource,
  });

  @override
  Future<RecipePageEntity> fetchRecipe(String recipeUrl) async {
    return await recipePageOnlineDataSource.fetchRecipePageDetails(recipeUrl).then((value) => value.toEntity());
  }
}