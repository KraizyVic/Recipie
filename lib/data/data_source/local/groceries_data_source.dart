import 'package:isar_community/isar.dart';
import 'package:recipie/data/models/grocery_model.dart';

class GroceriesDataSource {
  final Isar isar ;
  GroceriesDataSource({
    required this.isar,
  });
  Stream<List<GroceryItemModel>> getGroceries() {
    return isar.groceryItemModels.where().watch(fireImmediately: true).map((event) => event.toList());
  }
  Future<void> addGrocery(GroceryItemModel? grocery,List<GroceryItemModel>?groceries) async {
    if(groceries!=null){
      await isar.writeTxn(() async {
        await isar.groceryItemModels.putAll(groceries);
      });
    }
    await isar.writeTxn(() async {
      await isar.groceryItemModels.put(grocery!);
    });
  }
  Future<void> updateGrocery(int id) async {
    final grocery = await isar.groceryItemModels.get(id);
    if (grocery == null) {
      throw Exception('Grocery not found');
    }
    grocery.isChecked = !grocery.isChecked;
    await isar.writeTxn(() async {
      await isar.groceryItemModels.put(grocery);
    });
  }
  Future<void> deleteGrocery(int? id,List<int>?groceriesIds) async {
    if(groceriesIds!=null){
      await isar.writeTxn(() async {
        await isar.groceryItemModels.deleteAll(groceriesIds);
      });
    }
    await isar.writeTxn(() async {
      await isar.groceryItemModels.delete(id!);
    });
  }
}