import 'package:flutter/material.dart';
import 'package:recipa/presentation/pages/recipe_page.dart';

import '../../data/repositories/a_to_z_repository_impl.dart';
import '../../domain/entities/a_to_z_entity.dart';
import '../../domain/entities/a_to_z_item_page_entity.dart';
import '../../domain/use_cases/a_to_z_use_cases.dart';

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

    _aToZItemPageFuture = FetchAToZItemPageUseCase(aToZItemPageRepository: AToZItemPageRepositoryImpl()).call(widget.aToZEntity.link);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: _aToZItemPageFuture,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()),);
          }
          final data = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              children: [
                data.image == null ? Container() : Image.network(data.image ?? ""),
                Text(data.title),
                data.description == null ? Container() : Text(data.description ?? ""),
                Column(
                  children: data.recipes.where((recipe) => recipe.isArticle == false).map((recipe)=> ListTile(
                    title: Text(recipe.title),
                    subtitle: Text(recipe.category),
                    leading: SizedBox(
                        child: Image.network(recipe.imageUrl)
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RecipePage(recipe: recipe, articleRecipeEntity: null, recipeUrl: null)));
                    },
                  )).toList(),
                )
              ]
            )
          );
        }
      )
    );
  }
}
