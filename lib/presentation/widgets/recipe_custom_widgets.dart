import "package:flutter/material.dart";
import "package:isar_community/isar.dart";
import "package:recipie/core/dependency_injector.dart";
import "package:recipie/core/entities/recipe_n_article_card_entity.dart";
import "package:recipie/data/models/recipe_article_page_model.dart";
import "package:recipie/domain/entities/grocery_entity.dart";
import "package:recipie/domain/entities/recipe_article_page_entity.dart";
import "package:recipie/domain/use_cases/grocery_use_cases.dart";

import "../../domain/entities/recipe_page_entity.dart";


class IngredientGroupTile extends StatefulWidget {
  final List<RecipeIngredientGroupEntity> ingredientGroupEntities;
  final RecipeCardEntity? recipeCardEntity;
  final ArticleRecipeEntity? articleCardEntity;
  const IngredientGroupTile({super.key, required this.ingredientGroupEntities, required this.recipeCardEntity, required this.articleCardEntity});

  @override
  State<IngredientGroupTile> createState() => _IngredientGroupTileState();
}

class _IngredientGroupTileState extends State<IngredientGroupTile> {
  // List of ingredients the cook ALREADY has
  final List<GroceryItemEntity> haveItems = [];

  void toggleSelection(GroceryItemEntity item, bool selected) {
    setState(() {
      if (selected) {
        haveItems.add(item); // has it
      } else {
        haveItems.removeWhere((e) => e.name == item.name);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Build all ingredients from all groups
    final allIngredients = widget.ingredientGroupEntities
        .expand((group) => group.ingredients)
        .map((ingredient) => GroceryItemEntity(
      id: Isar.autoIncrement,
      name: ingredient.ingredientName,
    ))
        .toList();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        title: Text("Ingredients",
            style: TextStyle(color: Theme.of(context).colorScheme.primary)),
        backgroundColor:
        Theme.of(context).colorScheme.tertiary.withAlpha(50),
        collapsedBackgroundColor:
        Theme.of(context).colorScheme.tertiary.withAlpha(50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        collapsedShape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Add remaining ingredients to grocery list",
                    style: TextStyle(color: Theme.of(context).colorScheme.tertiary.withAlpha(100)),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    // Filter out items that user already has
                    final missingItems = allIngredients.where((item) => !haveItems.any((owned) => owned.name == item.name)).toList();
                    if (missingItems.isNotEmpty) {
                      sl<CreateGroceryGroup>().createGroceryGroup(GroceryRecipeGroupEntity(id: Isar.autoIncrement, name: widget.recipeCardEntity?.title ?? widget.articleCardEntity?.title ?? "Unknown", isCreatedByUser: false, link: widget.recipeCardEntity?.url ?? widget.articleCardEntity?.url ?? "Unknown", items: missingItems));
                    }
                  },
                  elevation: 0,
                  color: Theme.of(context).colorScheme.primary.withAlpha(100),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: const [
                      Icon(Icons.add),
                      SizedBox(width: 5),
                      Text("Add"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: widget.ingredientGroupEntities.map((group) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (group.groupName != null)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(group.groupName!,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                    ...group.ingredients.map((ingredient) {
                      final item = GroceryItemEntity(
                          id: Isar.autoIncrement,
                          name: ingredient.ingredientName);
                      final hasItem = haveItems
                          .any((e) => e.name == ingredient.ingredientName);
                      return CheckboxListTile(
                        value: hasItem,
                        title: Text(
                            "${ingredient.ingredientQuantity} ${ingredient.ingredientUnit} ${ingredient.ingredientName}"),
                        onChanged: (val) =>
                            toggleSelection(item, val ?? false),
                      );
                    }),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}


Widget instructionTile({
  required BuildContext context,
  required RecipeDirectionsEntity instruction,
  required int instructionNumber,
  required void Function() onDoubleTap,
}){
  double scaleFactor = 1;

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("STEP: ${instructionNumber + 1}",style: TextStyle(color: Theme.of(context).colorScheme.tertiary,fontSize: 20,fontWeight: FontWeight.bold),),
          Text(instruction.instruction),
          SizedBox(height: 10,),
          instruction.imageUrl != null ? SizedBox(
            width: double.maxFinite,
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    barrierColor: Colors.black,
                    builder: (_) => StatefulBuilder(
                      builder: (context, setState) {
                        return GestureDetector(
                          onDoubleTap: () {
                            setState(() {
                              scaleFactor = scaleFactor == 1.0 ? 2.5 : 1.0;
                            });
                          },
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: InteractiveViewer(
                                  panEnabled: true,
                                  scaleEnabled: true,
                                  minScale: 1,
                                  maxScale: 4,
                                  scaleFactor: scaleFactor,
                                  child: Image.network(
                                    instruction.imageUrl!,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Expanded(child: Text("STEP: ${instructionNumber + 1}",style: TextStyle(color: Theme.of(context).colorScheme.tertiary.withAlpha(100),fontSize: 25,fontWeight: FontWeight.bold))),
                                        IconButton(
                                          onPressed: () => Navigator.pop(context),
                                          icon: Icon(Icons.close, color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(child: Container())
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
                child: Image.network(instruction.imageUrl!,fit: BoxFit.cover,),
              )
            )
          ):SizedBox(),
        ],
      ),
    ),
  );
}
