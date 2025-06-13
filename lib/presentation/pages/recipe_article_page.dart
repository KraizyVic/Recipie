import 'package:flutter/material.dart';
import 'package:recipa/core/entities/recipe_n_article_card_entity.dart';
import 'package:recipa/data/repositories/recipe_article_page_repository_impl.dart';
import 'package:recipa/domain/entities/recipe_article_page_entity.dart';
import 'package:recipa/domain/use_cases/recipe_article_page_use_case.dart';
import 'package:recipa/presentation/pages/recipe_page.dart';
import 'package:recipa/presentation/widgets/article_page_items.dart';

import '../../data/data_source/online/recipe_article_page_online_data_source.dart';

class RecipeArticlePage extends StatefulWidget {
  final ArticleCardEntity articleRecipeEntity;
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
    super.initState();
    fetchRecipeArticle = FetchRecipeArticleUseCase(recipeArticlePageRepository: RecipeArticlePageRepositoryImpl(recipeArticlePageOnlineDataSource: RecipeArticlePageOnlineDataSource())).call(widget.articleRecipeEntity?.url ?? widget.recipeUrl ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),*/
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            floating: false,
            snap: false,
            automaticallyImplyLeading: false,
            pinned: true,
            leading: IconButton.filled(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.arrow_back),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.surface),foregroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.primary))),
            backgroundColor: Theme.of(context).colorScheme.surface,
            scrolledUnderElevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: articlePageHeaderTile(context: context, article: widget.articleRecipeEntity,future: fetchRecipeArticle),
            )
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.articleRecipeEntity.title,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,)),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              child: FutureBuilder(
                future: fetchRecipeArticle,
                builder: (context,snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return SizedBox();
                  }else if(snapshot.hasError){
                    return Center(child: Text(snapshot.error.toString()),);
                  }else{
                    final data = snapshot.data!;
                    if(data.recipes.isEmpty){
                      return Center(child: Text("No recipes found"),);
                    }
                    return Column(
                      children: data.recipes.map((recipe)=>articlePageRecipeTiles(
                        context: context,
                        recipe: recipe,
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>RecipePage(articleRecipeEntity: recipe,recipe: null,recipeUrl: recipe.url,)));
                        },
                      )).toList()
                    );
                  }
                }
              )
            ),
          ),
        ],
      ),
    );
  }
}
