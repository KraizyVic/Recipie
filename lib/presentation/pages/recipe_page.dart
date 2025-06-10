import 'package:flutter/material.dart';
import 'package:recipa/core/entities/recipe_n_article_card_entity.dart';
import 'package:recipa/data/data_source/online/recipe_page_online_data_source.dart';
import 'package:recipa/data/repositories/recipe_page_repository_impl.dart';
import 'package:recipa/domain/entities/recipe_article_page_entity.dart';
import 'package:recipa/domain/use_cases/recipe_page_use_cases.dart';
import '../../domain/entities/recipe_page_entity.dart';

class RecipePage extends StatefulWidget{
  final RecipeCardEntity? recipe;
  final ArticleRecipeEntity? articleRecipeEntity;
  final String? recipeUrl;
  const RecipePage({
    super.key,
    required this.recipe,
    required this.articleRecipeEntity,
    required this.recipeUrl,
  });

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {

  late Future<RecipePageEntity> recipeDetails;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    recipeDetails = FetchRecipeUseCase(recipePageRepository: RecipePageRepositoryImpl(recipePageOnlineDataSource: RecipePageOnlineDataSource())).call(widget.articleRecipeEntity?.url ?? widget.recipe?.url ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipe Page"),
      ),
      body: Column(
        children: [
          Image.network(widget.recipe?.imageUrl ?? widget.articleRecipeEntity?.imageUrl ?? ""),
          Text(widget.recipe?.title ?? widget.articleRecipeEntity?.title ?? ""),
          Text(widget.recipe?.category ?? ""),
          Expanded(
            child: FutureBuilder(
              future: recipeDetails,
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return Column(
                    children: [
                      Text(snapshot.data?.recipePageHeaderEntity.recipeDescription ?? ""),
                      Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data?.similarRecipes.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Image.network(snapshot.data?.similarRecipes[index].imageUrl ?? ""),
                              title: Text(snapshot.data?.similarRecipes[index].title ?? ""),
                              subtitle: Text(snapshot.data?.similarRecipes[index].category ?? ""),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => RecipePage(recipe: snapshot.data!.similarRecipes[index], articleRecipeEntity: null,recipeUrl: '',)),
                                );
                              }
                            );
                          },
                        ),
                      )
                    ],
                  );
                }else if(snapshot.hasError){
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }else{
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }
            )
          ),
        ]
      ),
    );
  }
}
