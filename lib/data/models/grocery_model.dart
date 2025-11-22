import 'package:isar_community/isar.dart';

import '../../domain/entities/grocery_entity.dart';

part 'grocery_model.g.dart';

@collection
class GroceryRecipeGroupModel {
  Id id = Isar.autoIncrement + 1;

  @Index(unique: true)
  String name;
  String? link;
  bool isCreatedByUser;

  final groceries = IsarLinks<GroceryItemModel>();

  GroceryRecipeGroupModel({
    this.id = Isar.autoIncrement,
    required this.name,
    required this.link,
    required this.isCreatedByUser,
  });

  GroceryRecipeGroupEntity toGroceryRecipeGroupEntity() {
    return GroceryRecipeGroupEntity(
      id: id,
      name: name,
      link: link,
      isCreatedByUser: isCreatedByUser,
      items: groceries.map((e) => e.toGroceryItemEntity()).toList(),
    );
  }

  static GroceryRecipeGroupModel toGroceryRecipeGroupModel(GroceryRecipeGroupEntity e) {
    return GroceryRecipeGroupModel(
      id: e.id,
      name: e.name,
      link: e.link,
      isCreatedByUser: e.isCreatedByUser,
    );
  }
}

@collection
class GroceryItemModel {
  Id id = Isar.autoIncrement;

  String name;
  bool isChecked;

  GroceryItemModel({
    this.id = Isar.autoIncrement,
    required this.name,
    this.isChecked = false,
  });

  GroceryItemEntity toGroceryItemEntity() {
    return GroceryItemEntity(
      id: id,
      name: name,
      isChecked: isChecked,
    );
  }

  static GroceryItemModel toGroceryItemModel(GroceryItemEntity e) {
    return GroceryItemModel(
      id: e.id,
      name: e.name,
      isChecked: e.isChecked,
    );
  }
}


