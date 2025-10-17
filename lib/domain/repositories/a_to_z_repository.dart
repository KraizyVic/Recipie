import '../entities/a_to_z_entity.dart';

abstract class AToZRepository{
  Future<AToZEntity> fetchAToZ();
}