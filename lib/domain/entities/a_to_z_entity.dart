class AToZEntity{
  final List<AToZGroupEntity> groups;

  AToZEntity({
    required this.groups
  });
}

class AToZGroupEntity{
  final String title;
  final List<AToZItemsEntity> entities;

  AToZGroupEntity({
    required this.title,
    required this.entities
  });
}

class AToZItemsEntity{
  final String link;
  final String item;

  AToZItemsEntity({
    required this.link,
    required this.item,
  });
}