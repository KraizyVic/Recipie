import 'package:isar_community/isar.dart';
import 'package:recipie/domain/entities/settings_page_entities.dart';

part 'settings_page_model.g.dart';

@Collection()
class ProfileModel {
  Id id = 0;
  final String name;
  final String imageLink;
  final int createdAt;
  final int? updatedAt;
  ProfileModel({
    required this.id,
    required this.name,
    required this.imageLink,
    required this.createdAt,
    required this.updatedAt,
  });

  ProfileEntity toProfileEntity() {
    return ProfileEntity(
      id: id,
      name: name,
      imageLink: imageLink,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  static ProfileModel toProfileModel(ProfileEntity profileEntity) {
    return ProfileModel(
      id: profileEntity.id,
      name: profileEntity.name,
      imageLink: profileEntity.imageLink,
      createdAt: profileEntity.createdAt,
      updatedAt: profileEntity.updatedAt,
    );
  }

  // copy with function
  ProfileModel copyWith({
    Id? id,
    String? name,
    String? imageLink,
    int? createdAt,
    int? updatedAt,
  }) {
    return ProfileModel(
      id: id ?? this.id,
      name: name ?? this.name,
      imageLink: imageLink ?? this.imageLink,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

@Collection()
class LookAndFeelModel {
  Id id = 0;
  final int themeMode;
  final bool keepScreenOnOnRecipePage;
  final int seedColor;
  final int primaryColor;
  final String language;
  LookAndFeelModel({
    required this.id,
    required this.themeMode,
    required this.keepScreenOnOnRecipePage,
    required this.seedColor,
    required this.primaryColor,
    required this.language,
  });

  LookAndFeelEntity toLookAndFeelEntity() {
    return LookAndFeelEntity(
      id: id,
      themeMode: themeMode,
      keepScreenOnOnRecipePage: keepScreenOnOnRecipePage,
      seedColor: seedColor,
      primaryColor: primaryColor,
      language: language,
    );
  }

  static LookAndFeelModel toLookAndFeelModel(
    LookAndFeelEntity lookAndFeelEntity,
  ) {
    return LookAndFeelModel(
      id: lookAndFeelEntity.id,
      themeMode: lookAndFeelEntity.themeMode,
      keepScreenOnOnRecipePage: lookAndFeelEntity.keepScreenOnOnRecipePage,
      seedColor: lookAndFeelEntity.seedColor,
      primaryColor: lookAndFeelEntity.primaryColor,
      language: lookAndFeelEntity.language,
    );
  }

  // copy with function
  LookAndFeelModel copyWith({
    Id? id,
    int? themeMode,
    bool? keepScreenOnOnRecipePage,
    int? seedColor,
    int? primaryColor,
    String? language,
  }) {
    return LookAndFeelModel(
      id: id ?? this.id,
      themeMode: themeMode ?? this.themeMode,
      keepScreenOnOnRecipePage:
      keepScreenOnOnRecipePage ?? this.keepScreenOnOnRecipePage,
      seedColor: seedColor ?? this.seedColor,
      primaryColor: primaryColor ?? this.primaryColor,
      language: language ?? this.language,
    );
  }
}

@Collection()
class SearchHistoryModel {
  Id id = Isar.autoIncrement;
  final String query;
  final int createdAt;
  SearchHistoryModel({
    required this.id,
    required this.query,
    required this.createdAt,
  });

  SearchHistoryEntity toSearchHistoryEntity() {
    return SearchHistoryEntity(id: id, query: query, createdAt: createdAt);
  }

  static SearchHistoryModel toSearchHistoryModel(
    SearchHistoryEntity searchHistoryEntity,
  ) {
    return SearchHistoryModel(
      id: searchHistoryEntity.id,
      query: searchHistoryEntity.query,
      createdAt: searchHistoryEntity.createdAt,
    );
  }
  // NO COPY WITH FUNCTION NEEDED BECAUSE NO UPDATE OPERATION FOR SEARCH HISTORY
}

@Collection()
class CookHistoryModel {
  Id id = Isar.autoIncrement;
  final int recipeId;
  final int createdAt;
  final String link;
  CookHistoryModel({
    required this.id,
    required this.recipeId,
    required this.createdAt,
    required this.link,
  });
  CookHistoryEntity toCookHistoryEntity() {
    return CookHistoryEntity(
      id: id,
      recipeId: recipeId,
      createdAt: createdAt,
      link: link,
    );
  }
  static CookHistoryModel toCookHistoryModel(CookHistoryEntity cookHistoryEntity) {
    return CookHistoryModel(
      id: cookHistoryEntity.id,
      recipeId: cookHistoryEntity.recipeId,
      createdAt: cookHistoryEntity.createdAt,
      link: cookHistoryEntity.link,
    );
  }

  // NO COPY WITH FUNCTION NEEDED BECAUSE NO UPDATE OPERATION FOR COOK HISTORY
}
