import 'package:recipa/domain/entities/home_page_entity.dart';
import 'package:recipa/domain/repositories/home_page_repository.dart';

class FetchHomeItemsUseCase{
  final HomePageRepository homePageRepository;

  FetchHomeItemsUseCase({required this.homePageRepository});

  Future<HomePageEntity> call(){
    return homePageRepository.fetchHomePage();
  }
}