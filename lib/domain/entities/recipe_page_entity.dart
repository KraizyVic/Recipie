import 'package:recipa/core/entities/recipe_n_article_card_entity.dart';

class RecipePageEntity{
  final RecipePageHeaderEntity recipePageHeaderEntity;
  final List<RecipeOverallDetailsEntity> recipeOverallDetails;
  final List<RecipeIngredientGroupEntity> recipeIngredients;
  final List<RecipeDirectionsEntity> recipeInstructions;
  final List<NutritionFactsEntity> nutritionFacts;
  final List<String> images;
  final String chefNote;
  final List<RecipeCardEntity> similarRecipes;

  RecipePageEntity({
    required this.recipePageHeaderEntity,
    required this.recipeOverallDetails,
    required this.recipeIngredients,
    required this.recipeInstructions,
    required this.nutritionFacts,
    required this.images,
    required this.chefNote,
    required this.similarRecipes,
  });

}

class RecipePageHeaderEntity{
  final String recipeTitle;
  final String recipeDescription;
  final String recipeImage;
  final String author;
  final String updatedOn;
  RecipePageHeaderEntity({
    required this.recipeTitle,
    required this.recipeImage,
    required this.recipeDescription,
    required this.author,
    required this.updatedOn,
  });
}

class RecipeOverallDetailsEntity{
  final String detailName;
  final String detailValue;
  RecipeOverallDetailsEntity({
    required this.detailName,
    required this.detailValue,
  });
}

class RecipeIngredientGroupEntity{
  final String? groupName;
  final List<RecipeIngredientsEntity> ingredients;
  RecipeIngredientGroupEntity({
    required this.groupName,
    required this.ingredients,
  });
}

class RecipeIngredientsEntity{
  final String ingredientQuantity;
  final String ingredientUnit;
  final String ingredientName;

  RecipeIngredientsEntity({
    required this.ingredientQuantity,
    required this.ingredientUnit,
    required this.ingredientName,
  });
}

class RecipeDirectionsEntity{
  final String instructionNumber;
  final String instruction;
  final String? imageUrl;
  RecipeDirectionsEntity({
    required this.instructionNumber,
    required this.instruction,
    required this.imageUrl,
  });
}

class NutritionFactsEntity{
  final String name;
  final String value;
  NutritionFactsEntity({
    required this.name,
    required this.value,
  });
}