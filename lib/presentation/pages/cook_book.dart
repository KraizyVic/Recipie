
import 'package:flutter/material.dart';
import 'package:recipie/domain/use_cases/cook_book_use_cases.dart';
import 'package:recipie/presentation/pages/recipe_page.dart';
import 'package:recipie/presentation/widgets/custom_tiles.dart';

import '../../core/dependency_injector.dart';
class CookBook extends StatelessWidget {
  const CookBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cookbook"),
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: StreamBuilder(
        stream: sl<GetCookBookRecipes>().getCookBookRecipes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: recipeTiles(
                        context: context,
                        recipe: snapshot.data![index],
                        onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>RecipePage(recipe: snapshot.data![index], articleRecipeEntity: null, recipeUrl: '',)))
                    ),
                  );
                }
            );
          }else{
            return Center(child: CircularProgressIndicator());
          }
        }
      )
    );
  }
}



/*body: StreamBuilder(
        stream: sl<GetCookBookRecipes>().getCookBookRecipes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: recipeTiles(
                    context: context,
                    recipe: snapshot.data![index],
                    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>RecipePage(recipe: snapshot.data![index], articleRecipeEntity: null, recipeUrl: '',)))
                  ),
                );
              }
            );
          }else{
            return Center(child: CircularProgressIndicator());
          }
        }
      )*/