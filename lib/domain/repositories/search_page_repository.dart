import 'package:recipa/domain/entities/search_page_entity.dart';

abstract class SearchPageRepository{
  Future<SearchPageEntity> fetchSearchResults(String query);
  Future<SearchPageEntity> fetchNextPage(String url);
}