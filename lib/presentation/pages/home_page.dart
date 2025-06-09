import 'package:flutter/material.dart';
import 'package:recipa/domain/entities/home_page_entity.dart';

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
    homePageItems = HomePageCubit().fetchHomePAgeDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
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
                        width: 50,
                        height: 50,
                        child: Image.network(data.randomArticles[index].imageUrl)
                      ),
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
