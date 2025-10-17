import 'package:flutter/material.dart';
import 'package:recipie/presentation/pages/recipe_page.dart';

import '../../core/entities/recipe_n_article_card_entity.dart';
import '../../data/repositories/a_to_z_repository_impl.dart';
import '../../domain/entities/a_to_z_entity.dart';
import '../../domain/entities/a_to_z_item_page_entity.dart';
import '../../domain/use_cases/a_to_z_use_cases.dart';
import '../widgets/custom_tiles.dart';

class AToZItemPage extends StatefulWidget {
  final AToZItemsEntity aToZEntity;
  const AToZItemPage({super.key, required this.aToZEntity});

  @override
  State<AToZItemPage> createState() => _AToZItemPageState();
}

class _AToZItemPageState extends State<AToZItemPage> {
  late final Future<AToZItemPageEntity> _aToZItemPageFuture;

  @override
  void initState() {
    super.initState();

    _aToZItemPageFuture = FetchAToZItemPageUseCase(
      aToZItemPageRepository: AToZItemPageRepositoryImpl(),
    ).call(widget.aToZEntity.link);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        //title: Text(widget.aToZEntity.item),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _aToZItemPageFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          final data = snapshot.data!;
          final List<RecipeCardEntity> recipes = data.recipes
              .where((recipe) => !recipe.isArticle)
              .toList();
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  data.image == null
                      ? Container()
                      : ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(10),
                          child: Image.network(
                            data.image ?? "",
                            fit: BoxFit.cover,
                            height: 150,
                            width: double.infinity,
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      data.title,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  data.description == null
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(data.description ?? ""),
                        ),
                  SizedBox(height: 8.0),
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: recipes.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return recipeTiles(
                        context: context,
                        recipe: recipes[index],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RecipePage(
                                recipe: recipes[index],
                                articleRecipeEntity: null,
                                recipeUrl: null,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
