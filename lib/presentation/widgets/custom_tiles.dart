import 'package:flutter/material.dart';
import 'package:recipa/core/entities/recipe_n_article_card_entity.dart';
import 'package:recipa/domain/entities/recipe_page_entity.dart';

Widget articleTile({
  required BuildContext context,
  required ArticleCardEntity article,
  required void Function() onTap,
  double? width,
  double? height,
}){
  return Container(
    width: width ?? 250,
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Theme.of(context).colorScheme.onTertiary.withAlpha(100),
      border: Border.all(
        color: Theme.of(context).colorScheme.tertiary.withAlpha(50),
        width: 1,
      ),
    ),
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
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
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
}){
  return ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.onTertiary,
        image: DecorationImage(image: NetworkImage(recipe.imageUrl),fit: BoxFit.cover),
      ),
      child: MaterialButton(
        onPressed: onTap,
        hoverColor: Theme.of(context).colorScheme.tertiary.withAlpha(50),
        splashColor: Theme.of(context).colorScheme.tertiary.withAlpha(50),
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.onTertiary.withAlpha(0),
                Theme.of(context).colorScheme.onTertiary.withAlpha(200),
              ],
              begin: AlignmentGeometry.topCenter,
              end: AlignmentGeometry.bottomCenter
            )
          ),
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(recipe.title,maxLines: 4, overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary),),
              Text(recipe.category,maxLines: 1, overflow: TextOverflow.ellipsis,),
              Text(recipe.isArticle ? "Article" : "Recipe",style: TextStyle(color: Theme.of(context).colorScheme.tertiary.withAlpha(100)),),
            ]
          ),
        ),
      ),
    ),
  );
}

