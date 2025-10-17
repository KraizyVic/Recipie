import 'package:isar_community/isar.dart';

import '../../domain/entities/grocery_entity.dart';

part 'grocery_model.g.dart';

@collection
class GroceryItemModel{
  Id id = Isar.autoIncrement;
  String name;
  bool isChecked;

  GroceryItemModel({
    required this.id,
    required this.name,
    this.isChecked = false,
  });

  GroceryItemEntity toEntity(){
    return GroceryItemEntity(
      id: id,
      name: name,
      isChecked: isChecked,
    );
  }
  static GroceryItemModel toGroceryModel(GroceryItemEntity entity){
    return GroceryItemModel(
      id: entity.id,
      name: entity.name,
      isChecked: entity.isChecked,
    );
  }
}