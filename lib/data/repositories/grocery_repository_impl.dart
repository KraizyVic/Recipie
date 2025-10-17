
import 'package:recipie/data/data_source/local/groceries_data_source.dart';

import 'package:recipie/domain/entities/grocery_entity.dart';
import 'package:recipie/domain/repositories/groceries_repositories.dart';
import 'package:recipie/data/models/grocery_model.dart';


// ***** G R O C E R Y - I T E M - R E P O - I M P L *****
//TODO: Add a mass addition method for groceries

class GroceryRepositoryImpl extends GroceryItemRepository{
  final GroceriesDataSource groceriesDataSource;
  GroceryRepositoryImpl({required this.groceriesDataSource});

  @override
  Future<void> addGroceryItem(GroceryItemEntity? grocery,List<GroceryItemEntity>? massAddOfGroceries) async {
    GroceryItemModel? groceryModel = grocery != null ? GroceryItemModel.toGroceryModel(grocery) : null ;
    List<GroceryItemModel>? groceriesModel = [];
    if(massAddOfGroceries != null){
      groceriesModel = massAddOfGroceries.map((e) => GroceryItemModel.toGroceryModel(e)).toList();
      await groceriesDataSource.addGrocery(null,groceriesModel);
    }
    await groceriesDataSource.addGrocery(groceryModel,null);
  }

  @override
  Stream<List<GroceryItemEntity>> getGroceryItems() {
    return groceriesDataSource.getGroceries().map((event) => event.map((e) => e.toEntity()).toList());
  }

  @override
  Future<void> toggleGroceryItem(int id) async{
    await groceriesDataSource.updateGrocery(id);
  }

  @override
  Future<void> removeGroceryItem(int? id,List<int>?massDeleteIds) async{
    if(massDeleteIds != null){
      await groceriesDataSource.deleteGrocery(null,massDeleteIds);
    }
    await groceriesDataSource.deleteGrocery(id,null);
  }
}
