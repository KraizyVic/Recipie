import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipie/presentation/pages/recipe_article_page.dart';
import 'package:recipie/presentation/pages/recipe_page.dart';
import 'package:recipie/presentation/state_management/settings_page_cubit.dart';
import '../../core/dependency_injector.dart';
import '../../data/data_source/online/home_page_online_data_source.dart';
import '../../data/data_source/online/search_page_online_local_data_source.dart';
import '../../data/repositories/home_page_repository_impl.dart';
import '../../data/repositories/search_page_repository_impl.dart';
import '../../domain/entities/home_page_entity.dart';
import '../../domain/entities/search_page_entity.dart';
import '../../domain/use_cases/home_page_use_cases.dart';
import '../../domain/use_cases/search_page_use_cases.dart';
import '../widgets/custom_tiles.dart';
import '../widgets/custom_widgets.dart';
import '../widgets/home_page_widgets.dart';
import '../widgets/search_widgets.dart';
import 'a_to_z_page.dart';

class HomePage extends StatefulWidget {
  final HomePageEntity homePageEntity;
  const HomePage({super.key, required this.homePageEntity});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<HomePageEntity> _homePageItemsFuture;
  double expandedHeight = 250;
  bool isSearchFocused = false;
  late Future<SearchPageEntity> _searchResults = Future.value(
    SearchPageEntity(recipeResults: [], nestPageLinks: []),
  );
  final TextEditingController _textEditingController = TextEditingController();
  int articleIndex = 0;
  PageController pageController = PageController();
  @override
  void initState() {
    super.initState();
    _homePageItemsFuture = Future.value(widget.homePageEntity);
  }

  Future<void> _refreshData() async {
    // For manual refresh
    setState(() {
      _homePageItemsFuture = sl<FetchHomeItemsUseCase>().call();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (isPoped, obj) {
          if (isSearchFocused) {
            _textEditingController.clear();
            FocusScope.of(context).unfocus();
            isSearchFocused = false;
            pageController.previousPage(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
            setState(() {
              _searchResults = Future.value(
                SearchPageEntity(recipeResults: [], nestPageLinks: []),
              );
            });
          } else {
            exit(0);
          }
        },
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              expandedHeight: 250,
              floating: false,
              pinned: true,
              snap: false,
              backgroundColor: Theme.of(context).colorScheme.surface,
              scrolledUnderElevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                background: HomeGreetingAndSearch(
                  search: CustomTextField(
                    textEditingController: _textEditingController,
                    hintText: "What's on your mind?",
                    borderRadius: 15,
                    isGlassMorphic: true,
                    isFilled: false,
                    onTap: () {
                      isSearchFocused = true;
                      pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    onSubmit: (value) {
                      context.read<SearchHistoryCubit>().addHistory(value);
                      setState(() {
                        _searchResults = SearchUseCase(
                          searchPageRepository: SearchPageRepositoryImpl(
                            onlineLocalDataSource:
                                SearchPageOnlineLocalDataSource(),
                          ),
                        ).fetchSearchResults(value);
                      });
                    },
                  ),
                  onCancel: () {
                    /*if(isSearchFocused || _textEditingController.text.isNotEmpty){ _textEditingController.clear(); FocusScope.of(context).unfocus(); isSearchFocused = false; pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut); setState(() { _searchResults = Future.value(SearchPageEntity(recipeResults: [], nestPageLinks: [])); }); }else{ Navigator.push(context, MaterialPageRoute(builder: (context)=>AToZPage())); }*/
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AToZPage()),
                    );
                  },
                  isSearchFocused: isSearchFocused,
                ),
              ),
            ),
            SliverFillRemaining(
              child: SizedBox(
                //height: constraints.maxHeight,
                child: PageView(
                  controller: pageController,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    FutureBuilder(
                      future: _homePageItemsFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(child: Text(snapshot.error.toString()));
                        }
                        final data = snapshot.data!;
                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "Articles",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                    Row(
                                      children: data.randomArticles
                                          .where(
                                            (articleElement) =>
                                                articleElement.isArticle,
                                          )
                                          .map(
                                            (article) => Padding(
                                              padding: const EdgeInsets.only(
                                                left: 3,
                                              ),
                                              child: AnimatedContainer(
                                                duration: Duration(
                                                  milliseconds: 300,
                                                ),
                                                height: 10,
                                                width: 10,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:
                                                      data.randomArticles
                                                              .where(
                                                                (
                                                                  articleElement,
                                                                ) => articleElement
                                                                    .isArticle,
                                                              )
                                                              .toList()
                                                              .indexOf(
                                                                article,
                                                              ) ==
                                                          articleIndex
                                                      ? Theme.of(context)
                                                            .colorScheme
                                                            .primary
                                                            .withAlpha(200)
                                                      : Theme.of(context)
                                                            .colorScheme
                                                            .primary
                                                            .withAlpha(50),
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 150,
                                child: PageView(
                                  scrollDirection: Axis.horizontal,
                                  onPageChanged: (value) {
                                    setState(() {
                                      articleIndex = value;
                                    });
                                  },
                                  children: data.randomArticles
                                      .where((article) => article.isArticle)
                                      .map(
                                        (article) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 5,
                                          ),
                                          child: articleTile(
                                            context: context,
                                            article: article,
                                            onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    RecipeArticlePage(
                                                      articleRecipeEntity:
                                                          article,
                                                      recipeUrl: article.url,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                child: Text(
                                  "Recipes",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsGeometry.symmetric(
                                  horizontal: 5,
                                ),
                                child: GridView(
                                  padding: EdgeInsets.zero,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.7,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                      ),
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  children: data.randomRecipes
                                      .map(
                                        (recipe) => recipeTiles(
                                          context: context,
                                          recipe: recipe,
                                          isGlassMorphic: false,
                                          width: double.maxFinite,
                                          onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => RecipePage(
                                                recipe: recipe,
                                                recipeUrl: recipe.url,
                                                articleRecipeEntity: null,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    FutureBuilder(
                      future: _searchResults,
                      builder: (context, snapshot) {
                        final histories = context
                            .watch<SearchHistoryCubit>()
                            .state;
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(child: Text(snapshot.error.toString()));
                        } else {
                          if (snapshot.data!.recipeResults.isEmpty) {
                            return histories.isEmpty
                                ? Center(child: Text("Nothing to show"))
                                : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: histories.reversed
                                          .map(
                                            (history) => ListTile(
                                              title: Text(history.query),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              trailing: IconButton(
                                                onPressed: () {
                                                  context
                                                      .read<
                                                        SearchHistoryCubit
                                                      >()
                                                      .deleteHistory(
                                                        history.id,
                                                      );
                                                },
                                                icon: Icon(Icons.remove),
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  _textEditingController.text =
                                                      history.query;
                                                  _searchResults = SearchUseCase(
                                                    searchPageRepository:
                                                        SearchPageRepositoryImpl(
                                                          onlineLocalDataSource:
                                                              SearchPageOnlineLocalDataSource(),
                                                        ),
                                                  ).fetchSearchResults(history.query);
                                                });
                                              },
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  );
                          }
                          return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.8,
                                ),
                            padding: EdgeInsets.zero,
                            itemCount: snapshot.data!.recipeResults.length,
                            itemBuilder: (context, index) {
                              return searchTiles(
                                context: context,
                                search: snapshot.data!.recipeResults[index],
                              );
                            },
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
