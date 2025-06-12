import 'package:flutter/material.dart';
import 'package:recipa/data/data_source/online/home_page_online_data_source.dart';
import 'package:recipa/data/repositories/home_page_repository_impl.dart';
import 'package:recipa/domain/entities/home_page_entity.dart';
import 'package:recipa/domain/use_cases/home_page_use_cases.dart';
import 'package:recipa/presentation/pages/recipe_article_page.dart';
import 'package:recipa/presentation/pages/recipe_page.dart';
import 'package:recipa/presentation/pages/search_page.dart';
import 'package:recipa/presentation/widgets/custom_tiles.dart';

import '../../core/locator.dart';
import '../state_management/home_page_cubit.dart';
import '../widgets/home_page_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late Future<HomePageEntity> _homePageItemsFuture;
  double expandedHeight = 250;
  bool isSearchFocused = false;

  @override
  void initState() {
    super.initState();
    _homePageItemsFuture = sl<FetchHomeItemsUseCase>().call();
  }

  Future<void> _refreshData() async {
    // For manual refresh
    setState(() {
      _homePageItemsFuture = FetchHomeItemsUseCase(homePageRepository: HomePageRepositoryImpl(homePageOnlineDataSource: HomePageOnlineDataSource())).call();
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if(constraints.maxWidth > 600){
              return Container();
            }
            return FutureBuilder(
              future: _homePageItemsFuture,
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }else if(snapshot.hasError){
                  return Center(child: Text(snapshot.error.toString()),);
                }
                final data = snapshot.data!;
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      expandedHeight: isSearchFocused ? 500 : 250,
                      floating: false,
                      pinned: true,
                      snap: false,
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      scrolledUnderElevation: 0,
                      flexibleSpace: FlexibleSpaceBar(
                        background: HomeGreetingAndSearch(
                          onHasFocus: (){
                            isSearchFocused = true;
                          },
                          onLooseFocus: (){
                            isSearchFocused = false;
                          },
                          isSearchFocused: isSearchFocused,
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: RefreshIndicator(
                        onRefresh: _refreshData,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text("Articles",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,)),
                            ),
                            Padding(
                              padding: EdgeInsetsGeometry.symmetric(vertical: 10),
                              child: SizedBox(
                                height: 130,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: data.randomArticles.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                                      child: articleTile(
                                        context: context,
                                        article: data.randomArticles[index],
                                        onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>RecipeArticlePage(articleRecipeEntity: data.randomArticles[index],recipeUrl: data.randomArticles[index].url,)))
                                      ),
                                    );
                                  }
                                )
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                              child: Text("Recipes",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,)),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsetsGeometry.symmetric(horizontal: 5),
                              child: GridView(
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: constraints.maxWidth > 550 ? 3 : 2,childAspectRatio: 0.7,crossAxisSpacing: 10,mainAxisSpacing: 10),
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                children: data.randomRecipes.map((recipe)=>recipeTiles(
                                    context: context,
                                    recipe: recipe,
                                    width: double.maxFinite,
                                    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>RecipePage(recipe: recipe, recipeUrl: recipe.url, articleRecipeEntity: null,)))
                                )).toList()
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }
            );
          }
        ),
      ),
    );
  }
}
