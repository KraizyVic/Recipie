import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/entities/main_article_entity.dart';

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
  final bool isSearchFocused;
  final Widget search;
  final VoidCallback onCancel;

  const HomeGreetingAndSearch({
    super.key,
    required this.isSearchFocused,
    required this.search,
    required this.onCancel,
  });

  @override
  State<HomeGreetingAndSearch> createState() => _HomeGreetingAndSearchState();
}

class _HomeGreetingAndSearchState extends State<HomeGreetingAndSearch> {

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 1000),
      curve: Curves.ease,
      decoration: BoxDecoration(
        color: widget.isSearchFocused ? Theme.of(context).colorScheme.primary.withAlpha(50) : Theme.of(context).colorScheme.surface,
        //image: DecorationImage(image: AssetImage("lib/core/assets/burrito.webp"),fit: BoxFit.cover)
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Hello Master Chef!",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                  SizedBox(height: 10,),
                  Text("What dish do you have in mind today?")
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 55,
                        child: widget.search,
                      )
                    ),
                    SizedBox(width: 10,),
                    SizedBox(
                      height: 55,
                      width: 55,
                      child: MaterialButton(
                        padding: .symmetric(horizontal: 0,vertical: 15),
                        color: Theme.of(context).colorScheme.tertiary.withAlpha(50),
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),side: BorderSide(color: Theme.of(context).colorScheme.tertiary.withAlpha(100),width: 1)),
                        onPressed: widget.onCancel,
                        child: Icon(Icons.abc,color: Theme.of(context).colorScheme.tertiary.withAlpha(200),),
                        //child: Icon(widget.isSearchFocused ? Icons.close : Icons.abc,color: widget.isSearchFocused ? Colors.red.withAlpha(200) :Theme.of(context).colorScheme.tertiary.withAlpha(200),)//color: Theme.of(context).colorScheme.onTertiary,),
                      ),
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
