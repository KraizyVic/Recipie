import 'package:recipa/data/data_source/online/home_page_online_data_source.dart';
import 'package:recipa/domain/entities/home_page_entity.dart';
import 'package:recipa/domain/repositories/home_page_repository.dart';

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