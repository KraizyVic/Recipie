import 'package:html/dom.dart';
import 'package:recipa/data/models/repipe_page_model.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

import '../../../core/models/recipe_n_article_card_model.dart';

class RecipePageOnlineDataSource{
  Future<RecipePageModel> fetchRecipePageDetails(String recipeUrl) async{
    var response = await http.get(Uri.parse(recipeUrl));
    if(response.statusCode == 200){
      Document document = parser.parse(response.body);
      Element? recipePageElement = document.querySelector("body");
      List<String> images = [];
      List<RecipeOverallDetailsModel> recipeOverallDetailsList = [];
      List<RecipeIngredientGroupModel> recipeIngredientsGroupList = [];
      List<RecipeDirectionsModel> recipeInstructionsList = [];
      List<NutritionFactsModel> nutritionFactsList = [];
      List<RecipeCardModel> similarRecipesList = [];

      List<Element> imageElement = recipePageElement!.getElementsByTagName("img");
      for(Element element in imageElement){
        images.add(element.attributes["src"] ?? element.attributes["data-src"] ?? "");
      }

      Element? header = recipePageElement.querySelector("div.loc.article-post-header");
      RecipePageHeaderModel recipePageHeader = RecipePageHeaderModel(
        recipeTitle: header?.querySelector("h1.harticle-heading.text-headline-400")?.text.trim() ?? "null",
        recipeDescription: header?.querySelector("p.article-subheading.text-utility-300")?.text.trim() ?? "null",
        recipeImage: recipePageElement.querySelector("div.featured-image > img")?.attributes['src'] ?? "null", // recipePageElement.querySelector("div.featured-image > img")?.attributes['data-src'] ?? "null",
        author: recipePageElement.querySelector("span.comp.mntl-bylines__item.mntl-attribution__item.mntl-attribution__item-name")?.text.trim() ?? "null",
        updatedOn: recipePageElement.querySelector("div.mntl-attribution__item-date")?.text.trim() ?? "null",
      );

      List<Element> recipeOverallDetails = recipePageElement.getElementsByClassName("mm-recipes-details__item");
      for(Element detail in recipeOverallDetails){
        recipeOverallDetailsList.add(
            RecipeOverallDetailsModel(
              detailName: detail.querySelector("div.mm-recipes-details__label")?.text.trim() ?? "null",
              detailValue: detail.querySelector("div.mm-recipes-details__value")?.text.trim() ?? "null",
            )
        );
      }

      List<Element> recipeIngredientsGroups = recipePageElement.getElementsByClassName("mm-recipes-structured-ingredients__list");
      for (int i = 0; i < recipeIngredientsGroups.length; i++) {
        final recipeIngredientsGroup = recipeIngredientsGroups[i];
        final recipeIngredients = recipeIngredientsGroup.getElementsByClassName("mm-recipes-structured-ingredients__list-item");

        List<RecipeIngredientsModel> recipeIngredientsList = [];

        for (final ingredient in recipeIngredients) {
          final spans = ingredient.getElementsByTagName("span");
          String ingredientQuantity = "";
          String ingredientUnit = "";
          String ingredientName = "";

          if (spans.length == 3) {
            ingredientQuantity = spans[0].text.trim();
            ingredientUnit = spans[1].text.trim();
            ingredientName = spans[2].text.trim();
          } else if (spans.length == 2) {
            ingredientUnit = spans[0].text.trim();
            ingredientName = spans[1].text.trim();
          } else if (spans.length == 1) {
            ingredientName = spans[0].text.trim();
          }

          recipeIngredientsList.add(
            RecipeIngredientsModel(
              ingredientQuantity: ingredientQuantity,
              ingredientUnit: ingredientUnit,
              ingredientName: ingredientName,
            ),
          );
        }

        // get group name by index
        final groupHeadings = recipePageElement.getElementsByClassName("mm-recipes-structured-ingredients__list-heading");
        final groupName = (i < groupHeadings.length) ? groupHeadings[i].text.trim() : null;

        recipeIngredientsGroupList.add(
          RecipeIngredientGroupModel(
            groupName: groupName,//recipePageElement.getElementsByClassName("mm-recipes-structured-ingredients__list-heading")[i].text.trim() ?? "null",
            ingredients: recipeIngredientsList,
          ),
        );
      }


      List<Element> recipeInstructions = recipePageElement.getElementsByClassName("comp mntl-sc-block mntl-sc-block-startgroup mntl-sc-block-group--LI");
      for(Element instruction in recipeInstructions) {
        recipeInstructionsList.add(
            RecipeDirectionsModel(
              instructionNumber: instruction.querySelector("span.recipe-directions__list-item-number")?.text.trim() ?? "null",
              instruction: instruction.querySelector("p.comp.mntl-sc-block.mntl-sc-block-html")?.text.trim() ?? "null",
              imageUrl: instruction.querySelector("img")?.attributes['src'] ?? instruction.querySelector("img")?.attributes['data-src'],
            )
        );
      }

      List<Element> nutritionFacts = recipePageElement.getElementsByClassName("mm-recipes-nutrition-facts-summary__table-row");
      for(Element nutritionFact in nutritionFacts){
        nutritionFactsList.add(
            NutritionFactsModel(
              name: nutritionFact.querySelector("td.mm-recipes-nutrition-facts-summary__table-cell.text-body-100-prominent")?.text.trim() ?? "null",
              value: nutritionFact.querySelector("td.mm-recipes-nutrition-facts-summary__table-cell.text-body-100")?.text.trim() ?? "null",
            )
        );
      }

      List<Element> similarRecipes = recipePageElement.getElementsByClassName("comp mntl-card-list-items mntl-universal-card mntl-document-card mntl-card card card--no-image");
      for(Element similarRecipe in similarRecipes){
        similarRecipesList.add(
            RecipeCardModel(
              url: similarRecipe.attributes['href'] ?? "null",
              title: similarRecipe.querySelector("span.card__title-text")?.text.trim() ?? "null",
              category: similarRecipe.querySelector("div.card__content")?.attributes['data-tag'] ?? "null",
              isArticle: similarRecipe.attributes['href']?.startsWith("https://www.allrecipes.com/recipe/") ?? false ? false : true ,
              imageUrl: similarRecipe.querySelector("img")?.attributes['src'] ?? similarRecipe.querySelector("img")?.attributes['data-src'] ?? "null",
            )
        );
      }

      return RecipePageModel(
        recipePageHeader: recipePageHeader,
        recipeOverallDetails: recipeOverallDetailsList,
        recipeIngredients: recipeIngredientsGroupList,
        recipeInstructions: recipeInstructionsList,
        nutritionFacts: nutritionFactsList,
        images: images,
        chefNote: recipePageElement.querySelector("div.mntl-sc-block-universal-callout__body > p")?.text.trim() ?? "null",
        similarRecipes: similarRecipesList,
      );
    }else{
      throw Exception("Failed to load recipe pageStatus Code: ${response.statusCode}");
    }
  }
}