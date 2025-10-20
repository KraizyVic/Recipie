
class ProfileEntity{
  final int id;
  final String name;
  final String imageLink;
  final int createdAt;
  final int? updatedAt;

  ProfileEntity({
    required this.id,
    required this.name,
    required this.imageLink,
    required this.createdAt,
    required this.updatedAt,
  });
}

class LookAndFeelEntity {
  final int id;
  final int themeMode;
  final bool keepScreenOnOnRecipePage;
  final int color;
  final String language;

  LookAndFeelEntity({
    required this.id,
    required this.themeMode,
    required this.keepScreenOnOnRecipePage,
    required this.color,
    required this.language
  });
}

class SearchHistoryEntity{
  final int id;
  final String query;
  final int createdAt;

  SearchHistoryEntity({
    required this.id,
    required this.query,
    required this.createdAt
  });
}

class CookHistoryEntity{
  final int id;
  final int recipeId;
  final int createdAt;
  final String link;

  CookHistoryEntity({
    required this.id,
    required this.recipeId,
    required this.createdAt,
    required this.link
  });
}
