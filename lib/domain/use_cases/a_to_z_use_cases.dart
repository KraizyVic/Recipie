import 'package:recipa/domain/entities/a_to_z_entity.dart';
import 'package:recipa/domain/repositories/a_to_z_repository.dart';

import '../entities/a_to_z_item_page_entity.dart';
import '../repositories/a_to_z_item_page_repository.dart';

class FetchAToZUseCase{
  final AToZRepository aToZRepository;

  FetchAToZUseCase({
    required this.aToZRepository,
  });

  Future<AToZEntity> call(){
    return aToZRepository.fetchAToZ();
  }
}

// Fetch selected item Page details

class FetchAToZItemPageUseCase{
  final AToZItemPageRepository aToZItemPageRepository;

  FetchAToZItemPageUseCase({
    required this.aToZItemPageRepository,
  });

  Future<AToZItemPageEntity> call(String url){
    return aToZItemPageRepository.fetchAToZItemPage(url);
  }
}