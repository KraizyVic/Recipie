

import '../../domain/entities/home_page_entity.dart';
import '../../domain/repositories/home_page_repository.dart';
import '../data_source/online/home_page_online_data_source.dart';

class HomePageRepositoryImpl implements HomePageRepository{
  // for caching
  final HomePageOnlineDataSource homePageOnlineDataSource;
  HomePageRepositoryImpl({
    required this.homePageOnlineDataSource
  });

  @override
  Future<HomePageEntity> fetchHomePage() async{
    return homePageOnlineDataSource.fetchHomePageDetails().then((value) => value.toEntity());
  }
}