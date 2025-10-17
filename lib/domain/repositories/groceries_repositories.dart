import '../entities/grocery_entity.dart';

abstract class GroceryItemRepository{
  Future<void> addGroceryItem(GroceryItemEntity? grocery,List<GroceryItemEntity>? massAddOfGroceries);
  Stream<List<GroceryItemEntity>> getGroceryItems();
  Future<void> toggleGroceryItem(int id);
  Future<void> removeGroceryItem(int? id,List<int>? massDeleteIds);
  //Future<void> updateGroceryItemName(int id,String name);
}