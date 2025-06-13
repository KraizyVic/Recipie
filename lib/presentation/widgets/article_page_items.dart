import 'package:flutter/material.dart';
import 'package:recipa/domain/entities/recipe_article_page_entity.dart';

import '../../core/entities/recipe_n_article_card_entity.dart';

Widget articlePageHeaderTile({
  required BuildContext context,
  required ArticleCardEntity article,
  required Future<RecipeArticlePageEntity> future,
}){
  return Padding(
    padding: const EdgeInsets.all(0),
    child: FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return Stack(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(article.imageUrl),fit: BoxFit.cover),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Theme.of(context).colorScheme.surface
                        ],
                        begin: AlignmentGeometry.topCenter,
                        end: AlignmentGeometry.bottomCenter
                    )
                ),
              ),
              Column(
                children: [
                  Expanded(child: Container()),
                  LinearProgressIndicator()
                ],
              )
            ],
          );
        }
        return SizedBox(
          child: Stack(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: double.infinity,
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(snapshot.data!.imageUrl),fit: BoxFit.cover),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Theme.of(context).colorScheme.surface
                    ],
                    begin: AlignmentGeometry.topCenter,
                    end: AlignmentGeometry.bottomCenter
                  )
                ),
              )
            ],
          ),
        );
      }
    ),
  );
}

Widget articlePageRecipeTiles({
  required BuildContext context,
  required ArticleRecipeEntity recipe,
  required void Function() onTap,
}){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.tertiary.withAlpha(50)
        )
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(recipe.imageUrl),fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(10),
        ),
        child: MaterialButton(
          onPressed: onTap,
          color: Theme.of(context).colorScheme.onTertiary.withAlpha(100),
          elevation: 0,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.onTertiary,
                  Theme.of(context).colorScheme.onTertiary.withAlpha(50),
                ],
                begin: AlignmentGeometry.centerLeft,
                end: AlignmentGeometry.centerRight
              )
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(recipe.title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary),maxLines: 2,overflow: TextOverflow.ellipsis),
                  SizedBox(height: 10,),
                  Text(recipe.description,),
                  SizedBox(height: 10,),
                  Text(recipe.credit,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary.withAlpha(100))),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}