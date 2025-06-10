import 'package:recipa/domain/repositories/search_page_repository.dart';

import '../entities/search_page_entity.dart';

class SearchUseCase{
  final SearchPageRepository searchPageRepository;
  SearchUseCase({required this.searchPageRepository});
  Future<SearchPageEntity> fetchSearchResults(String query){
    return searchPageRepository.fetchSearchResults(query);
  }
}

class NextPageUseCase{
  final SearchPageRepository searchPageRepository;
  NextPageUseCase({required this.searchPageRepository});
  Future<SearchPageEntity> fetchNextPage(String url){
    return searchPageRepository.fetchNextPage(url);
  }
}