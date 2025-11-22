import 'package:recipie/domain/entities/grocery_entity.dart';
import 'package:recipie/domain/repositories/groceries_repositories.dart';

// ---------- ADD GROCERY ----------
class AddGrocery {
  final GroceryRepository groceryRepository;
  AddGrocery({required this.groceryRepository});
  Future<void> addGrocery({GroceryItemEntity? grocery, List<GroceryItemEntity>? groceries,}) async {
    await groceryRepository.addGroceryItem(grocery, groceries);
  }
}

// ---------- GET GROCERY ITEMS ----------
class GetGroceries {
  final GroceryRepository groceryRepository;
  GetGroceries({required this.groceryRepository});
  Stream<List<GroceryItemEntity>> getGroceries() {
    return groceryRepository.getGroceryItems();
  }
}

// ---------- GET GROCERY GROUPS + ITEMS ----------
class GetGroceriesGroups {
  final GroceryRepository groceryRepository;
  GetGroceriesGroups({required this.groceryRepository});
  Stream<List<GroceryRecipeGroupEntity>> getGroceriesGroups() {
    return groceryRepository.getGroceryGroupItems();
  }
}

// ---------- TOGGLE ITEM ----------
class ToggleGrocery {
  final GroceryRepository groceryRepository;
  ToggleGrocery({required this.groceryRepository});
  Future<void> toggleGroceryItem(int id) async {
    await groceryRepository.toggleGroceryItem(id);
  }
}

// ---------- DELETE SINGLE OR MULTIPLE ITEMS ----------
class DeleteGrocery {
  final GroceryRepository groceryRepository;
  DeleteGrocery({required this.groceryRepository});
  Future<void> deleteGroceryItem({int? id, List<int>? ids,}) async {
    await groceryRepository.removeGroceryItem(id, ids);
  }
}

// ---------- CREATE GROUP ----------
class CreateGroceryGroup {
  final GroceryRepository groceryRepository;
  CreateGroceryGroup({required this.groceryRepository});
  Future<void> createGroceryGroup(GroceryRecipeGroupEntity group) async {
    await groceryRepository.createGroceryGroup(group);
  }
}

// ---------- UPDATE GROUP ----------
class UpdateGroceryGroup {
  final GroceryRepository groceryRepository;
  UpdateGroceryGroup({required this.groceryRepository});
  Future<void> updateGroceryGroup(GroceryRecipeGroupEntity group) async {
    await groceryRepository.updateGroceryGroup(group);
  }
}

// ---------- DELETE GROUP ----------
class DeleteGroceryGroup {
  final GroceryRepository groceryRepository;
  DeleteGroceryGroup({required this.groceryRepository});
  Future<void> deleteGroceryGroup(int groupId) async {
    await groceryRepository.removeGroceryGroup(groupId);
  }
}

// ---------- ASSIGN ITEM TO GROUP ----------
class AssignItemToGroup {
  final GroceryRepository groceryRepository;
  AssignItemToGroup({required this.groceryRepository});
  Future<void> assignItemToGroup({required int itemId, required int groupId}) async {
    await groceryRepository.assignItemToGroup(itemId: itemId, groupId: groupId);
  }
}
