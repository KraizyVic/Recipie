
class GroceryRecipeGroupEntity{
  final int id;
  final String name;
  final String? link;
  final bool isCreatedByUser;
  final List<GroceryItemEntity> items;

  GroceryRecipeGroupEntity({
    required this.id,
    required this.name,
    required this.link,
    required this.isCreatedByUser,
    required this.items,
  });
}

class GroceryItemEntity{
  final int id;
  final String name;
  final bool isChecked;
  final int? folderId;
  final int? recipeGroupId;

  GroceryItemEntity({
    required this.id,
    required this.name,
    this.isChecked = false,
    this.folderId,
    this.recipeGroupId,
  });
}