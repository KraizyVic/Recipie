import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipa/domain/entities/home_page_entity.dart';

import '../../data/repositories/home_page_repository_impl.dart';
import '../../domain/use_cases/home_page_use_cases.dart';

class HomePageCubit extends Cubit<HomePageEntity>{

  HomePageCubit() : super(HomePageEntity(mainArticle: MainArticleEntity(url:"",title: "", imageUrl: "", description: ""), randomRecipes: [], randomArticles: []));

  Future<HomePageEntity> fetchHomePAgeDetails(){
    return FetchHomeItemsUseCase(homePageRepository: HomePageReproditoryImpl()).call();
  }
}