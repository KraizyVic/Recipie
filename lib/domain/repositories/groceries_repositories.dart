import '../entities/grocery_entity.dart';

abstract class GroceryRepository{
  /// Add a single grocery OR a batch of groceries.
  /// If grocery != null → add just that one.
  /// If massAdd != null → add all of them.
  Future<void> addGroceryItem(GroceryItemEntity? grocery, List<GroceryItemEntity>? massAdd,);

  /// Stream of recipe groups WITH their loaded items.
  /// Always returns at least one group: “Uncategorized” or user-created groups.
  Stream<List<GroceryItemEntity>> getGroceryItems();
  Stream<List<GroceryRecipeGroupEntity>> getGroceryGroupItems();

  /// Toggle isChecked on a grocery item.
  Future<void> toggleGroceryItem(int id);

  /// Delete a single grocery OR many groceries at once.
  Future<void> removeGroceryItem(int? id, List<int>? massDeleteIds,);

  /// Delete an entire recipe group.
  /// Implementation MUST:
  /// - Move its groceries into “Uncategorized”
  ///       OR
  /// - Delete them too (depending on your design)
  Future<void> removeGroceryGroup(int groupId);

  /// Create a grocery group (like a recipe category)
  Future<void> createGroceryGroup(GroceryRecipeGroupEntity group);

  /// Rename / edit a group
  Future<void> updateGroceryGroup(GroceryRecipeGroupEntity group);

  /// Assign an item to a group
  Future<void> assignItemToGroup({
    required int itemId,
    required int groupId,
  });
}
