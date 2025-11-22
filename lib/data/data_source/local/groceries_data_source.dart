import 'package:isar_community/isar.dart';
import 'package:recipie/data/models/grocery_model.dart';

class GroceriesDataSource {
  final Isar isar;

  GroceriesDataSource({required this.isar});

  Stream<List<GroceryItemModel>> getGroceries() {
    return isar.groceryItemModels.where().watch(fireImmediately: true);
  }

  /// ---------- STREAM GROUPS + ITEMS ----------
  Stream<List<GroceryRecipeGroupModel>> getGroceryGroups() {
    return isar.groceryRecipeGroupModels.where().watch(fireImmediately: true).asyncMap((groups) async {
      for (var g in groups) {
        await g.groceries.load();
      }
      return groups;
    });
  }

  /// ---------- ADD SINGLE OR BATCH ITEMS ----------
  Future<void> addGrocery({
    required int groupId,
    GroceryItemModel? grocery,
    List<GroceryItemModel>? massGroceries,
  }) async {
    final group = await isar.groceryRecipeGroupModels.get(groupId);
    if (group == null) {
      await isar.writeTxn(() async {
        await isar.groceryRecipeGroupModels.put(GroceryRecipeGroupModel(id: groupId, name: 'Custom', link: '', isCreatedByUser: true));
      });
      throw Exception('Group not found');
    }

    await isar.writeTxn(() async {
      await group.groceries.load();

      // MASS ADD
      if (massGroceries != null && massGroceries.isNotEmpty) {
        await isar.groceryItemModels.putAll(massGroceries);
        group.groceries.addAll(massGroceries);
      }

      // SINGLE ADD
      if (grocery != null) {
        await isar.groceryItemModels.put(grocery);
        group.groceries.add(grocery);
      }

      await group.groceries.save();
    });
  }

  /// ---------- TOGGLE ITEM ----------
  Future<void> toggleGrocery(int itemId) async {
    await isar.writeTxn(() async {
      final item = await isar.groceryItemModels.get(itemId);
      if (item == null) throw Exception('Item not found');
      item.isChecked = !item.isChecked;
      await isar.groceryItemModels.put(item);
    });
  }

  /// ---------- DELETE SINGLE OR BATCH ITEMS ----------
  Future<void> deleteGroceries({
    int? id,
    List<int>? ids,
  }) async {
    await isar.writeTxn(() async {
      // BATCH DELETE
      if (ids != null && ids.isNotEmpty) {
        await isar.groceryItemModels.deleteAll(ids);
      }
      // SINGLE DELETE
      if (id != null) {
        await isar.groceryItemModels.delete(id);
      }

      // Also remove from any group's links
      final allGroups = await isar.groceryRecipeGroupModels.where().findAll();
      for (var g in allGroups) {
        await g.groceries.load();
        if (id != null) g.groceries.removeWhere((e) => e.id == id);
        if (ids != null) g.groceries.removeWhere((e) => ids.contains(e.id));
        await g.groceries.save();
      }
    });
  }

  /// ---------- DELETE GROUP + MOVE ITEMS TO UNCATEGORIZED ----------
  Future<void> deleteGroup(int groupId) async {
    await isar.writeTxn(() async {
      final group = await isar.groceryRecipeGroupModels.get(groupId);
      if (group == null) return;

      // Load groceries links
      await group.groceries.load();

      // Optional: delete groceries too (if you want them gone completely)
      // await isar.groceryItemModels.deleteAll(group.groceries.map((g) => g.id));

      // Or just clear the links if you want groceries to remain but unlinked
      group.groceries.clear();
      await group.groceries.save();

      // Delete the group itself
      await isar.groceryRecipeGroupModels.delete(groupId);
    });
  }


  /// ---------- CREATE GROUP ----------
  Future<void> createGroup(GroceryRecipeGroupModel group, {List<GroceryItemModel>? items}) async {
    await isar.writeTxn(() async {
      // 1️⃣ Put all items first
      if (items != null && items.isNotEmpty) {
        await isar.groceryItemModels.putAll(items);
        group.groceries.addAll(items); // attach to links
      }

      // 2️⃣ Put the group
      await isar.groceryRecipeGroupModels.put(group);
      await group.groceries.save(); // save links
    });
  }


  /// ---------- UPDATE GROUP ----------
  Future<void> updateGroup(GroceryRecipeGroupModel group) async {
    await isar.writeTxn(() async {
      await isar.groceryRecipeGroupModels.put(group);
    });
  }

  /// ---------- ASSIGN ITEM TO GROUP ----------
  Future<void> assignItemToGroup({
    required int itemId,
    required int groupId,
  }) async {
    await isar.writeTxn(() async {
      final item = await isar.groceryItemModels.get(itemId);
      final group = await isar.groceryRecipeGroupModels.get(groupId);
      if (item == null || group == null) return;

      // Remove item from any other group
      final allGroups = await isar.groceryRecipeGroupModels.where().findAll();
      for (var g in allGroups) {
        await g.groceries.load();
        g.groceries.removeWhere((e) => e.id == itemId);
        await g.groceries.save();
      }

      // Add to new group
      group.groceries.add(item);
      await group.groceries.save();
    });
  }

  /// ---------- HELPER: GET OR CREATE UNCATEGORIZED GROUP ----------
  Future<GroceryRecipeGroupModel> _getOrCreateUngrouped() async {
    const groupName = 'Uncategorized';
    var group = await isar.groceryRecipeGroupModels.filter().nameEqualTo(groupName).findFirst();
    if (group != null) return group;
    final newGroup = GroceryRecipeGroupModel(name: groupName, link: '',isCreatedByUser: true);
    await isar.writeTxn(() async {
      await isar.groceryRecipeGroupModels.put(newGroup);
    });
    return newGroup;
  }
}
