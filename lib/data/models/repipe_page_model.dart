
import '../../core/models/recipe_n_article_card_model.dart';
import '../../domain/entities/recipe_page_entity.dart';

class RecipePageModel{
  final RecipePageHeaderModel recipePageHeader;
  final List<RecipeOverallDetailsModel> recipeOverallDetails;
  final List<RecipeIngredientGroupModel> recipeIngredients;
  final List<RecipeDirectionsModel> recipeInstructions;
  final List<NutritionFactsModel> nutritionFacts;
  final List<String> images;
  final String chefNote;
  final List<RecipeCardModel> similarRecipes;

  RecipePageModel({
    required this.recipePageHeader,
    required this.recipeOverallDetails,
    required this.recipeIngredients,
    required this.recipeInstructions,
    required this.nutritionFacts,
    required this.images,
    required this.chefNote,
    required this.similarRecipes,
  });

  RecipePageEntity toEntity(){
    return RecipePageEntity(
      recipePageHeaderEntity: recipePageHeader.toEntity(),
      recipeOverallDetails: recipeOverallDetails.map((e) => e.toEntity()).toList(),
      recipeIngredients: recipeIngredients.map((e) => e.toEntity()).toList(),
      recipeInstructions: recipeInstructions.map((e) => e.toEntity()).toList(),
      nutritionFacts: nutritionFacts.map((e) => e.toEntity()).toList(),
      images: images,
      chefNote: chefNote,
      similarRecipes: similarRecipes.map((e) => e.toEntity()).toList(),
    );
  }
  static RecipePageModel fromEntity(RecipePageEntity recipePageEntity){
    return RecipePageModel(
      recipePageHeader: RecipePageHeaderModel.fromEntity(recipePageEntity.recipePageHeaderEntity),
      recipeOverallDetails: recipePageEntity.recipeOverallDetails.map((e) => RecipeOverallDetailsModel.fromEntity(e)).toList(),
      recipeIngredients: recipePageEntity.recipeIngredients.map((e) => RecipeIngredientGroupModel.fromEntity(e)).toList(),
      recipeInstructions: recipePageEntity.recipeInstructions.map((e) => RecipeDirectionsModel.fromEntity(e)).toList(),
      nutritionFacts: recipePageEntity.nutritionFacts.map((e) => NutritionFactsModel.fromEntity(e)).toList(),
      images: recipePageEntity.images,
      chefNote: recipePageEntity.chefNote,
      similarRecipes: recipePageEntity.similarRecipes.map((e) => RecipeCardModel.fromEntity(e)).toList(),
    );
  }
}

class RecipePageHeaderModel{
  final String recipeTitle;
  final String recipeDescription;
  final String recipeImage;
  final String author;
  final String updatedOn;

  RecipePageHeaderModel({
    required this.recipeTitle,
    required this.recipeImage,
    required this.recipeDescription,
    required this.author,
    required this.updatedOn,
  });

  RecipePageHeaderEntity toEntity(){
    return RecipePageHeaderEntity(
      recipeTitle: recipeTitle,
      recipeImage: recipeImage,
      recipeDescription: recipeDescription,
      author: author,
      updatedOn: updatedOn,
    );
  }
  static RecipePageHeaderModel fromEntity(RecipePageHeaderEntity recipePageHeaderEntity){
    return RecipePageHeaderModel(
      recipeTitle: recipePageHeaderEntity.recipeTitle,
      recipeImage: recipePageHeaderEntity.recipeImage,
      recipeDescription: recipePageHeaderEntity.recipeDescription,
      author: recipePageHeaderEntity.author,
      updatedOn: recipePageHeaderEntity.updatedOn,
    );
  }
}

class RecipeOverallDetailsModel{
  final String detailName;
  final String detailValue;
  RecipeOverallDetailsModel({
    required this.detailName,
    required this.detailValue,
  });

  static RecipeOverallDetailsModel fromEntity(RecipeOverallDetailsEntity recipeOverallDetailsEntity){
    return RecipeOverallDetailsModel(
      detailName: recipeOverallDetailsEntity.detailName,
      detailValue: recipeOverallDetailsEntity.detailValue,
    );
  }
  RecipeOverallDetailsEntity toEntity() {
    return RecipeOverallDetailsEntity(
      detailName: detailName,
      detailValue: detailValue,
    );
  }
}

class RecipeIngredientGroupModel {
  final String groupName;
  final List<RecipeIngredientsModel> ingredients;

  RecipeIngredientGroupModel({
    required this.groupName,
    required this.ingredients,
  });

  static RecipeIngredientGroupModel fromEntity(RecipeIngredientGroupEntity recipeIngredientGroupEntity) {
    return RecipeIngredientGroupModel(
      groupName: recipeIngredientGroupEntity.groupName,
      ingredients: recipeIngredientGroupEntity.ingredients.map((e) => RecipeIngredientsModel.fromEntity(e)).toList(),
    );
  }
  RecipeIngredientGroupEntity toEntity() {
    return RecipeIngredientGroupEntity(
      groupName: groupName,
      ingredients: ingredients.map((e) => e.toEntity()).toList(),
    );
  }
}


class RecipeIngredientsModel{
  final String ingredientQuantity;
  final String ingredientUnit;
  final String ingredientName;

  RecipeIngredientsModel({
    required this.ingredientQuantity,
    required this.ingredientUnit,
    required this.ingredientName,
  });

  static RecipeIngredientsModel fromEntity(RecipeIngredientsEntity recipeIngredientsEntity){
    return RecipeIngredientsModel(
      ingredientQuantity: recipeIngredientsEntity.ingredientQuantity,
      ingredientUnit: recipeIngredientsEntity.ingredientUnit,
      ingredientName: recipeIngredientsEntity.ingredientName,
    );
  }
  RecipeIngredientsEntity toEntity() {
    return RecipeIngredientsEntity(
      ingredientQuantity: ingredientQuantity,
      ingredientUnit: ingredientUnit,
      ingredientName: ingredientName,
    );
  }
}

class RecipeDirectionsModel{
  final String instructionNumber;
  final String instruction;
  final String? imageUrl;
  RecipeDirectionsModel({
    required this.instructionNumber,
    required this.instruction,
    required this.imageUrl,
  });

  static RecipeDirectionsModel fromEntity(RecipeDirectionsEntity recipeInstructionsEntity){
    return RecipeDirectionsModel(
      instructionNumber: recipeInstructionsEntity.instructionNumber,
      instruction: recipeInstructionsEntity.instruction,
      imageUrl: recipeInstructionsEntity.imageUrl,
    );
  }
  RecipeDirectionsEntity toEntity() {
    return RecipeDirectionsEntity(
      instructionNumber: instructionNumber,
      instruction: instruction,
      imageUrl: imageUrl,
    );
  }
}

class NutritionFactsModel{
  final String name;
  final String value;
  NutritionFactsModel({
    required this.name,
    required this.value,
  });

  static NutritionFactsModel fromEntity(NutritionFactsEntity nutritionFactsEntity){
    return NutritionFactsModel(
      name: nutritionFactsEntity.name,
      value: nutritionFactsEntity.value,
    );
  }
  NutritionFactsEntity toEntity() {
    return NutritionFactsEntity(
      name: name,
      value: value,
    );
  }
}