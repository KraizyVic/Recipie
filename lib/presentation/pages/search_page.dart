import 'package:flutter/material.dart';
import 'package:recipa/domain/entities/search_page_entity.dart';
import 'package:recipa/domain/use_cases/search_page_use_cases.dart';
import 'package:recipa/presentation/pages/recipe_page.dart';
import '../../data/data_source/online/search_page_online_local_data_source.dart';
import '../../data/repositories/search_page_repository_impl.dart';
import '../widgets/custom_widgets.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _textEditingController = TextEditingController();
  late Future<SearchPageEntity> searchFuture;// =  Future.value(SearchPageEntity(recipeResults: [], nestPageLinks: []));
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchFuture = Future.value(SearchPageEntity(recipeResults: [], nestPageLinks: [])); //SearchUseCase(searchPageRepository: SearchPageRepositoryImpl(onlineLocalDataSource: SearchPageOnlineLocalDataSource())).fetchSearchResults(_textEditingController.text);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Page"),
      ),
      body: Column(
        children: [
          CustomTextField(
            hintText: "Search",
            onSubmit: (value){
              setState(() {
                searchFuture = SearchUseCase(searchPageRepository: SearchPageRepositoryImpl(onlineLocalDataSource: SearchPageOnlineLocalDataSource())).fetchSearchResults(value);
              });
            },
            borderRadius: 50,
            onTap: (){},
            onFocus: (){},
            onFocusChange: (hasFocus){}
          ),
          Expanded(
            child: FutureBuilder(
              future: searchFuture,
              builder: (context,snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator());
                }else if(snapshot.hasError){
                  return Center(child: Text(snapshot.error.toString()));
                }else{
                  /*if(snapshot.data!.recipeResults.isEmpty){
                    return Center(child: Text("No results found"));
                  }*/
                  return ListView.builder(
                    itemCount: snapshot.data!.recipeResults.length,
                    itemBuilder: (context,index){
                      return ListTile(
                        title: Text(snapshot.data!.recipeResults[index].title),
                        subtitle: Text(snapshot.data!.recipeResults[index].category),
                        leading: Image.network(snapshot.data!.recipeResults[index].imageUrl),
                        trailing: Icon(Icons.arrow_forward),
                        onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>RecipePage(recipe: snapshot.data!.recipeResults[index], articleRecipeEntity: null, recipeUrl: null))),
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
