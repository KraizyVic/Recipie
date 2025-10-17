import "package:flutter/material.dart";
import "../../core/entities/recipe_n_article_card_entity.dart";

Widget aToZrecipeItem({
  required BuildContext context,
  required RecipeCardEntity recipe,
}) {
  return Card(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            recipe.imageUrl,
            fit: BoxFit.cover,
            width: 150,
            height: 100,
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                recipe.title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                recipe.category,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
