import 'package:flutter/material.dart';
import 'package:recipa/core/entities/recipe_n_article_card_entity.dart';
import 'package:recipa/data/data_source/online/recipe_page_online_data_source.dart';
import 'package:recipa/data/repositories/recipe_page_repository_impl.dart';
import 'package:recipa/domain/entities/recipe_article_page_entity.dart';
import 'package:recipa/domain/use_cases/recipe_page_use_cases.dart';
import 'package:recipa/presentation/widgets/custom_tiles.dart';
import '../../domain/entities/recipe_page_entity.dart';
import '../widgets/recipe_custom_widgets.dart';

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
  List<String> images = [];

  double scaleFactor = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    recipeDetails = FetchRecipeUseCase(recipePageRepository: RecipePageRepositoryImpl(recipePageOnlineDataSource: RecipePageOnlineDataSource())).call(widget.articleRecipeEntity?.url ?? widget.recipe?.url ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      /*appBar: AppBar(
        forceMaterialTransparency: true,
      ),*/
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            floating: false,
            pinned: true,
            snap: false,
            leading: IconButton.filled(onPressed: ()=>Navigator.pop(context), style: ButtonStyle(backgroundColor:  WidgetStatePropertyAll(Theme.of(context).colorScheme.surface),foregroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.primary),),icon: Icon(Icons.arrow_back,)),
            backgroundColor: Theme.of(context).colorScheme.surface,
            actions:[
              IconButton.filled(
                onPressed: (){
                  setState(() {
                  });
                },
                style: ButtonStyle(backgroundColor:  WidgetStatePropertyAll(Theme.of(context).colorScheme.surface),foregroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.primary),), icon: Icon(Icons.bookmark_outline,))
            ],
            scrolledUnderElevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: SizedBox(
                height: 350,
                child: Stack(
                  children: [
                    /*PageView(
                      scrollDirection: Axis.horizontal,
                      children: images.map((image)=>Image.network(image)).toList(),
                    ),*/
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(widget.recipe?.imageUrl ?? widget.articleRecipeEntity?.imageUrl ?? ""),fit: BoxFit.cover),
                      )
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Theme.of(context).colorScheme.surface,
                          ],
                          begin: AlignmentGeometry.topCenter,
                          end: AlignmentGeometry.bottomCenter
                        )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.recipe?.title ?? widget.articleRecipeEntity?.title ?? "",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary),),
                  widget.recipe != null ? Text(widget.recipe?.category ?? "",style: TextStyle(color: Theme.of(context).colorScheme.tertiary.withAlpha(100)),):SizedBox(),
                  //Text("Description",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
                  widget.articleRecipeEntity != null ? Text(widget.articleRecipeEntity?.description ?? ""):SizedBox(),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              child: FutureBuilder(
                future: recipeDetails,
                builder: (context, snapshot) {
                  if(snapshot.hasData){
                    images = snapshot.data!.images;
                    /*setState(() {
                      images = snapshot.data!.images;
                    });*/
                    print(snapshot.data!.images.length);
                    final data = snapshot.data!;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        GridView(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 3/1,crossAxisSpacing: 5,mainAxisSpacing: 5),
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          physics: NeverScrollableScrollPhysics(),
                          children: data.recipeOverallDetails.map((detsail)=>Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Theme.of(context).colorScheme.primary.withAlpha(50),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(detsail.detailName,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                Text(detsail.detailValue,style: TextStyle(),),
                              ],
                            ),
                          )).toList(),
                        ),
                        SizedBox(height: 10,),
                        ingredientGroupTile(context: context, ingredientGroupEntities: data.recipeIngredients),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Instructions",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        ),
                        Column(
                          children: data.recipeInstructions.map((instruction)=> instructionTile(
                            context: context,
                            instruction: instruction,
                            instructionNumber: data.recipeInstructions.indexOf(instruction),
                            onDoubleTap: (){},
                          )).toList(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Nutrition Facts",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        ),
                        data.chefNote != "null" ?Container(
                          child: Text(data.chefNote),
                        ):SizedBox(),
                        GridView(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 3/1,crossAxisSpacing: 5,mainAxisSpacing: 5),
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          physics: NeverScrollableScrollPhysics(),
                          children: data.nutritionFacts.map((fact)=>Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              //color: Theme.of(context).colorScheme.primary.withAlpha(50),
                              border: Border.all(color: Theme.of(context).colorScheme.tertiary.withAlpha(50),width: 1),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(fact.value,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                Text(fact.name,style: TextStyle(),),
                              ],
                            ),
                          )).toList(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Similar Recipes:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        ),
                        SizedBox(
                          height: 250,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: data.similarRecipes.length,
                            itemBuilder: (context,index){
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: recipeTiles(
                                  context: context,
                                  width: 150,
                                  recipe: data.similarRecipes[index],
                                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>RecipePage(recipe: data.similarRecipes[index], recipeUrl: data.similarRecipes[index].url, articleRecipeEntity: null,))),
                                ),
                              );
                            }
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          child: Center(
                            child: Text("Credit: www.allrecipes.com",style: TextStyle(color: Theme.of(context).colorScheme.tertiary.withAlpha(100),),)
                          )
                        )
                      ],
                    );
                  }else if(snapshot.hasError){
                    return SizedBox(
                      height: MediaQuery.of(context).size.height - 250,
                      child: Center(
                        child: Text(snapshot.error.toString()),
                      ),
                    );
                  }else{
                    return SizedBox(
                      height: MediaQuery.of(context).size.height - 250,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                }
              ),
            ),
          )
        ],
      ),
    );
  }
}
