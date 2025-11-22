
import 'package:recipie/data/data_source/local/groceries_data_source.dart';

import 'package:recipie/domain/entities/grocery_entity.dart';
import 'package:recipie/domain/repositories/groceries_repositories.dart';
import 'package:recipie/data/models/grocery_model.dart';


// ***** G R O C E R Y - I T E M - R E P O - I M P L *****
class GroceryRepositoryImpl implements GroceryRepository {
  final GroceriesDataSource groceriesDataSource;

  GroceryRepositoryImpl({required this.groceriesDataSource});

  @override
  Stream<List<GroceryItemEntity>> getGroceryItems() {
    // TODO: implement getGroceryItems
    return groceriesDataSource.getGroceries().map((models) => models.map((m) => m.toGroceryItemEntity()).toList());
  }

  @override
  Stream<List<GroceryRecipeGroupEntity>> getGroceryGroupItems() {
    return groceriesDataSource.getGroceryGroups().map(
          (models) => models.map((m) => m.toGroceryRecipeGroupEntity()).toList(),
    );
  }

  @override
  Future<void> addGroceryItem(GroceryItemEntity? grocery, List<GroceryItemEntity>? massAdd,) async {
    final groupId = grocery?.recipeGroupId ?? massAdd?.first.recipeGroupId ?? 0;
    await groceriesDataSource.addGrocery(
      groupId: groupId,
      grocery: grocery != null ? GroceryItemModel.toGroceryItemModel(grocery) : null,
      massGroceries: massAdd?.map((e) => GroceryItemModel.toGroceryItemModel(e)).toList(),
    );
  }

  @override
  Future<void> toggleGroceryItem(int id) {
    return groceriesDataSource.toggleGrocery(id);
  }

  @override
  Future<void> removeGroceryItem(int? id, List<int>? massDeleteIds) {
    return groceriesDataSource.deleteGroceries(id: id, ids: massDeleteIds);
  }

  @override
  Future<void> removeGroceryGroup(int groupId) {
    return groceriesDataSource.deleteGroup(groupId);
  }

  @override
  Future<void> createGroceryGroup(GroceryRecipeGroupEntity group) {
    final groupModel = GroceryRecipeGroupModel.toGroceryRecipeGroupModel(group);
    final itemsModels = group.items.map(GroceryItemModel.toGroceryItemModel).toList();
    return groceriesDataSource.createGroup(groupModel, items: itemsModels);
  }


  @override
  Future<void> updateGroceryGroup(GroceryRecipeGroupEntity group) {
    return groceriesDataSource.updateGroup(
      GroceryRecipeGroupModel.toGroceryRecipeGroupModel(group),
    );
  }

  @override
  Future<void> assignItemToGroup({
    required int itemId,
    required int groupId,
  }) {
    return groceriesDataSource.assignItemToGroup(
      itemId: itemId,
      groupId: groupId,
    );
  }


}

