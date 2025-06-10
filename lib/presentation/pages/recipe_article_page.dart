import 'package:flutter/material.dart';
import 'package:recipa/core/entities/recipe_n_article_card_entity.dart';
import 'package:recipa/data/repositories/recipe_article_page_repository_impl.dart';
import 'package:recipa/domain/entities/recipe_article_page_entity.dart';
import 'package:recipa/domain/use_cases/recipe_article_page_use_case.dart';
import 'package:recipa/presentation/pages/recipe_page.dart';

import '../../data/data_source/online/recipe_article_page_online_data_source.dart';

class RecipeArticlePage extends StatefulWidget {
  final ArticleCardEntity? articleRecipeEntity;
  final String? recipeUrl;
  const RecipeArticlePage({
    super.key,
    required this.articleRecipeEntity,
    required this.recipeUrl,
  });

  @override
  State<RecipeArticlePage> createState() => _RecipeArticlePageState();
}

class _RecipeArticlePageState extends State<RecipeArticlePage> {
  late Future<RecipeArticlePageEntity> fetchRecipeArticle;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchRecipeArticle = FetchRecipeArticleUseCase(recipeArticlePageRepository: RecipeArticlePageRepositoryImpl(recipeArticlePageOnlineDataSource: RecipeArticlePageOnlineDataSource())).call(widget.articleRecipeEntity?.url ?? widget.recipeUrl ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipe Article Page"),
      ),
      body: Column(
        children: [
          Image.network(widget.articleRecipeEntity?.imageUrl ?? ""),
          Text(widget.articleRecipeEntity?.title ?? ""),
          Expanded(
            child: FutureBuilder(
              future: fetchRecipeArticle,
              builder: (context,snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }else if(snapshot.hasError){
                  return Center(child: Text(snapshot.error.toString()),);
                }else{
                  final data = snapshot.data!;
                  if(data.recipes.isEmpty){
                    return Center(child: Text("No recipes found"),);
                  }
                  return ListView.builder(
                    itemCount: data.recipes.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(data.recipes[index].title),
                        subtitle: Text(data.recipes[index].description),
                        leading: SizedBox(
                          child: Image.network(data.recipes[index].imageUrl)
                        ),
                        trailing: Text(data.recipes[index].credit),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>RecipePage(articleRecipeEntity: data.recipes[index],recipe: null,recipeUrl: data.recipes[index].url,)));
                        },
                      );
                    }
                  );
                }
              }
            )
          ),
        ],
      ),
    );
  }
}
