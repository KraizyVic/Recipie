import 'package:recipa/domain/entities/a_to_z_item_page_entity.dart';

import '../../domain/entities/a_to_z_entity.dart';
import '../../domain/repositories/a_to_z_item_page_repository.dart';
import '../../domain/repositories/a_to_z_repository.dart';
import '../data_source/online/a_to_z_online_data_source.dart';

class AToZRepositoryImpl implements AToZRepository{
  final AToZOnlineDataSource aToZOnlineDataSource;

  AToZRepositoryImpl({
    required this.aToZOnlineDataSource
  });

  @override
  Future<AToZEntity> fetchAToZ(){
    return aToZOnlineDataSource.fetchAToZHtml().then((value) => value.toEntity());
  }
}

class AToZItemPageRepositoryImpl extends AToZItemPageRepository{
  @override
  Future<AToZItemPageEntity> fetchAToZItemPage(String url) {
    return AToZPageOnlineDataSource().fetchAToZItemPageHtml(url).then((value)=>value.toEntity());
  }

}