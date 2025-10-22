
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