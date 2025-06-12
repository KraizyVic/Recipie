import "package:flutter/material.dart";

import "../../domain/entities/recipe_page_entity.dart";


Widget ingredientGroupTile({
  required BuildContext context,
  required List<RecipeIngredientGroupEntity> ingredientGroupEntities,
}){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ExpansionTile(
      enabled: true,
      collapsedBackgroundColor: Theme.of(context).colorScheme.tertiary.withAlpha(50),
      backgroundColor: Theme.of(context).colorScheme.tertiary.withAlpha(50),
      iconColor: Theme.of(context).colorScheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(15)),
      collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(15)),
      title: Text("Ingredients",style: TextStyle(color: Theme.of(context).colorScheme.primary),),
      subtitle: Text("Click to expand"),
      expandedAlignment: Alignment.topLeft,
      children: ingredientGroupEntities.map((groups)=>
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.all(groups.groupName != null ? 8.0 : 0),
                      child:groups.groupName != null ? Text(groups.groupName!,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),) : SizedBox()
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: groups.ingredients.map((ingredient)=> Text("- ${ingredient.ingredientQuantity} ${ingredient.ingredientUnit} ${ingredient.ingredientName}") ).toList(),
                  )
                ],
              ),
            ),
          )
      ).toList(),
    ),
  );
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
                          /*onVerticalDragUpdate: (details) {
                            if (details.delta.dy > 12) {
                              Navigator.pop(context);
                            }
                          },*/
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
