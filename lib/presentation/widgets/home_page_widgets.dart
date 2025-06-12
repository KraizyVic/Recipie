
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:recipa/core/entities/main_article_entity.dart';
import 'package:recipa/domain/entities/search_page_entity.dart';
import 'package:recipa/presentation/widgets/custom_widgets.dart';

Widget mainArticleTile({
  required BuildContext context,
  required MainArticleEntity mainArticle,
}){
  return Container(
    height: 250,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),

      image: DecorationImage(image: NetworkImage(mainArticle.imageUrl),fit: BoxFit.cover),
    ),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [
            //Colors.transparent,
            Theme.of(context).colorScheme.onTertiary.withAlpha(0),
            Theme.of(context).colorScheme.onTertiary.withAlpha(200),
          ],
          begin: AlignmentGeometry.topCenter,
          end: AlignmentGeometry.bottomCenter
        ),
        border: Border.all(
          color: Theme.of(context).colorScheme.tertiary.withAlpha(30),
          width: 1,
        ),
      ),
      child: MaterialButton(
        padding: EdgeInsets.zero,
        hoverColor: Theme.of(context).colorScheme.tertiary.withAlpha(40),
        splashColor: Theme.of(context).colorScheme.tertiary.withAlpha(40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: (){},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(mainArticle.title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary),maxLines: 2,overflow: TextOverflow.ellipsis,),
              Text(mainArticle.description,maxLines: 2,overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
      ),
    ),
  );
}

class HomeGreetingAndSearch extends StatefulWidget {
  final void Function() onHasFocus;
  final void Function() onLooseFocus;
  final bool isSearchFocused;
  const HomeGreetingAndSearch({super.key, required this.onHasFocus, required this.onLooseFocus, required this.isSearchFocused,});

  @override
  State<HomeGreetingAndSearch> createState() => _HomeGreetingAndSearchState();
}

class _HomeGreetingAndSearchState extends State<HomeGreetingAndSearch> {

  late Future<SearchPageEntity> _searchResults = Future.value(SearchPageEntity(recipeResults: [], nestPageLinks: []));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          //image: DecorationImage(image: AssetImage("lib/core/assets/burrito.webp"),fit: BoxFit.cover)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 125,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Olla Bruh!",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                  SizedBox(height: 10,),
                  Text("What dish do you have in mind today?")
                ],
              )
            ),
            SizedBox(
              height: 125,
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      hintText: "What's on your mind?",
                      borderRadius: 15,
                      isGlassMorphic: true,
                      isFilled: false,
                      onTap: (){},
                      onFocus: (){widget.onHasFocus();},
                      onFocusChange: (hasFocus){
                        widget.onLooseFocus();
                      },
                      onSubmit: (value){
                        widget.onLooseFocus();
                        setState(() {
                          _searchResults = Future.value(SearchPageEntity(recipeResults: [], nestPageLinks: []));
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 10,),
                  ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Theme.of(context).colorScheme.tertiary.withAlpha(50),
                          //color: Theme.of(context).colorScheme.primary,
                          border: Border.all(
                              color: Theme.of(context).colorScheme.tertiary.withAlpha(100)
                          )
                        ),
                        child: MaterialButton(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          onPressed: (){
                            FocusScope.of(context).unfocus();
                          },
                          child: Icon(Icons.widgets_outlined,color: Theme.of(context).colorScheme.tertiary.withAlpha(200),)//color: Theme.of(context).colorScheme.onTertiary,),
                        )
                      ),
                    ),
                  )
                ],
              ),
            ),
            !widget.isSearchFocused ? SizedBox() : Expanded(
              child: Center(
                child: FutureBuilder(
                  future: _searchResults,
                  builder: (context,snapshot){
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return CircularProgressIndicator();
                    }else if(snapshot.hasError){
                      return Text(snapshot.error.toString());
                    }else{
                      return ListView.builder(
                        itemCount: snapshot.data!.recipeResults.length,
                        itemBuilder: (context,index){
                          return ListTile(
                            title: Text(snapshot.data!.recipeResults[index].title),
                            subtitle: Text(snapshot.data!.recipeResults[index].category),
                            leading: Image.network(snapshot.data!.recipeResults[index].imageUrl),
                            trailing: Icon(Icons.arrow_forward),
                          );
                        }
                      );
                    }
                  }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
