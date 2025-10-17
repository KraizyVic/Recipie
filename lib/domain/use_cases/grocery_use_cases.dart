import 'package:recipie/domain/entities/grocery_entity.dart';
import 'package:recipie/domain/repositories/groceries_repositories.dart';

class AddGrocery{
  final GroceryItemRepository groceryItemRepository;
  AddGrocery({required this.groceryItemRepository});

  Future<void> addGrocery(GroceryItemEntity? groceryItem, List<GroceryItemEntity>? groceries) async {
    await groceryItemRepository.addGroceryItem(groceryItem,groceries);
  }
}

class GetGroceries {
  final GroceryItemRepository groceryItemRepository;
  GetGroceries({required this.groceryItemRepository});

  Stream<List<GroceryItemEntity>> getGroceries() {
    return groceryItemRepository.getGroceryItems();
  }
}


class ToggleGrocery {
  final GroceryItemRepository groceryItemRepository;
  ToggleGrocery({required this.groceryItemRepository});

  Future<void> toggleGrocery(int id) async {
    await groceryItemRepository.toggleGroceryItem(id);
  }
}

class DeleteGrocery {
  final GroceryItemRepository groceryItemRepository;
  DeleteGrocery({required this.groceryItemRepository});

  Future<void> deleteGrocery(int? id, List<int>? ingredients) async {
    await groceryItemRepository.removeGroceryItem(id,ingredients);
  }
}