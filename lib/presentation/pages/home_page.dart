import 'package:flutter/material.dart';
import 'package:recipa/data/repositories/home_page_repository_impl.dart';
import 'package:recipa/domain/entities/home_page_entity.dart';
import 'package:recipa/domain/use_cases/home_page_use_cases.dart';
import 'package:recipa/presentation/pages/recipe_article_page.dart';
import 'package:recipa/presentation/pages/recipe_page.dart';
import 'package:recipa/presentation/pages/search_page.dart';

import '../state_management/home_page_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late Future<HomePageEntity> homePageItems;

  @override
  void initState() {
    super.initState();
    homePageItems = FetchHomeItemsUseCase(homePageRepository: HomePageReproditoryImpl()).call();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        scrolledUnderElevation: 0,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: homePageItems,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }else if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()),);
          }
          final data = snapshot.data!;
          return Column(
            children: [
              Image.network(data.mainArticle.imageUrl),
              Text(data.mainArticle.title),
              Expanded(
                child: ListView.builder(
                  itemCount: data.randomArticles.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(data.randomArticles[index].title),
                      subtitle: Text(data.randomArticles[index].category),
                      leading: SizedBox(
                        child: Image.network(data.randomArticles[index].imageUrl)
                      ),
                      //trailing: Text(data.randomRecipes[index].isArticle ? "Article" : "Recipe"),
                      onTap: (){
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>RecipePage(recipe: data.randomRecipes[index],recipeUrl: data.randomRecipes[index].url,similarRecipe: null)));
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>RecipeArticlePage(articleRecipeEntity: data.randomArticles[index],recipeUrl: data.randomArticles[index].url,)));
                      },
                    );
                  }
                )
              ),
              //Expanded(child: Container()),
            ],
          );
        }
      ),
    );
  }
}
