import 'package:flutter/material.dart';
import '../../core/entities/recipe_n_article_card_entity.dart';
import '../pages/recipe_page.dart';

Widget searchTiles({
  required BuildContext context,
  required RecipeCardEntity search,
}){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: MaterialButton(
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onPressed: (){
        if(search.isArticle){
          //Navigator.push(context,MaterialPageRoute(builder: (context)=>RecipeArticlePage(articleRecipeEntity: search,recipeUrl: search.url,));
        }else{
          Navigator.push(context,MaterialPageRoute(builder: (context)=>RecipePage(articleRecipeEntity: null,recipe: search,recipeUrl: search.url,)));
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: NetworkImage(search.imageUrl),fit: BoxFit.cover),
              ),
            ),
          ),
          Text("${search.title}\n\n",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary),),
          Text(search.isArticle ? "Article" : "Recipe",style: TextStyle(fontSize: 15,color: Theme.of(context).colorScheme.tertiary.withAlpha(100)),),
        ],
      ),
    ),
  );
}