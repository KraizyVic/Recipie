import '../entities/a_to_z_item_page_entity.dart';

abstract class AToZItemPageRepository{
  Future<AToZItemPageEntity> fetchAToZItemPage(String url);
}