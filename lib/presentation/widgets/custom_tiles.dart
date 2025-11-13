import 'dart:ui';

import 'package:flutter/material.dart';
import '../../core/entities/recipe_n_article_card_entity.dart';

Widget articleTile({
  required BuildContext context,
  required ArticleCardEntity article,
  required void Function() onTap,
  double? width,
  double? height,
}){
  return Card(
    margin: EdgeInsets.zero,
    elevation: 0,
    color: Theme.of(context).colorScheme.tertiary.withAlpha(25),
    child: MaterialButton(
      onPressed: onTap,
      hoverColor: Theme.of(context).colorScheme.tertiary.withAlpha(50),
      splashColor: Theme.of(context).colorScheme.tertiary.withAlpha(50),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: NetworkImage(article.imageUrl,),fit: BoxFit.cover)
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      article.title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        //fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary
                      ),
                    ),
                  )
                ),
                Text(article.category,maxLines: 1, overflow: TextOverflow.ellipsis,),
                Text(article.isArticle ? "Article" : "Recipe",style: TextStyle(color: Theme.of(context).colorScheme.tertiary.withAlpha(100)),),
              ]
            ),
          )
        ],
      ),
    ),
  );
}

Widget recipeTiles({
  required BuildContext context,
  required RecipeCardEntity recipe,
  required void Function() onTap,
  double? width,
  double? height,
  bool isGlassMorphic = false,
}){
  return ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: SizedBox(
      width: width,
      height: height,
      child: MaterialButton(
        onPressed: onTap,
        hoverColor: Theme.of(context).colorScheme.tertiary.withAlpha(50),
        splashColor: Theme.of(context).colorScheme.tertiary.withAlpha(50),
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).colorScheme.onTertiary,
                  image: DecorationImage(image: NetworkImage(recipe.imageUrl),fit: BoxFit.cover),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${recipe.title}\n",maxLines: 2, overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary),),
                  Text(recipe.category,maxLines: 1, overflow: TextOverflow.ellipsis,),
                  Text(recipe.isArticle ? "Article" : "Recipe",style: TextStyle(color: Theme.of(context).colorScheme.tertiary.withAlpha(100)),),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

