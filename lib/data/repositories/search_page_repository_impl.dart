import '../../domain/entities/search_page_entity.dart';
import '../../domain/repositories/search_page_repository.dart';
import '../data_source/online/search_page_online_local_data_source.dart';

class SearchPageRepositoryImpl extends SearchPageRepository{
  final SearchPageOnlineLocalDataSource onlineLocalDataSource;
  SearchPageRepositoryImpl({required this.onlineLocalDataSource});
  @override
  Future<SearchPageEntity> fetchSearchResults(String query) {
    return onlineLocalDataSource.search(query).then((value) => value.toEntity());
  }

  @override
  Future<SearchPageEntity> fetchNextPage(String url) {
    // TODO: implement fetchNextPage
    throw UnimplementedError();
  }
}