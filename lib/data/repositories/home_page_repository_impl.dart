import 'package:recipa/data/data_source/online/home_page_online_data_source.dart';
import 'package:recipa/domain/entities/home_page_entity.dart';
import 'package:recipa/domain/repositories/home_page_repository.dart';

class HomePageReproditoryImpl implements HomePageRepository{
  @override
  Future<HomePageEntity> fetchHomePage() {
    // TODO: implement fetchHomePage
    return HomePageOnlineDataSource().fetchHomePageDetails().then((value) => value.toEntity());
  }
}