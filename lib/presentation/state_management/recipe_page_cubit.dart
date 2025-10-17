/*
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipa/data/data_source/online/recipe_page_online_data_source.dart';

import '../../data/repositories/recipe_page_repository_impl.dart';
import '../../domain/entities/recipe_page_entity.dart';
import '../../domain/use_cases/recipe_page_use_cases.dart';

class RecipePageCubit extends Cubit<RecipePageEntity> {
  RecipePageCubit() : super(RecipePageEntity(recipePageHeaderEntity: RecipePageHeaderEntity(recipeTitle: "", recipeImage: "", recipeDescription: "", author: "", updatedOn: ""), recipeOverallDetails: [], recipeIngredients: [], recipeInstructions: [], nutritionFacts: [], images: [], chefNote: ""));

  Future<RecipePageEntity> fetchRecipePageDetails(String recipeUrl){
    return FetchRecipeUseCase(recipePageRepository: RecipePageRepositoryImpl(recipePageOnlineDataSource: RecipePageOnlineDataSource())).call(recipeUrl);
  }
}*/
