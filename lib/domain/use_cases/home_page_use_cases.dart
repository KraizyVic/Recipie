import '../entities/home_page_entity.dart';
import '../repositories/home_page_repository.dart';

class FetchHomeItemsUseCase{
  final HomePageRepository homePageRepository;

  FetchHomeItemsUseCase({required this.homePageRepository});

  Future<HomePageEntity> call(){
    return homePageRepository.fetchHomePage();
  }
}