import 'package:isar_community/isar.dart';
import 'package:recipie/domain/entities/settings_page_entities.dart';


part 'settings_page_model.g.dart';

@Collection()
class GeneralSettingsModel {
  Id id = Isar.autoIncrement;

  // App behavior
  final bool pauseAutoUpdate;
  final bool downloadOverWifiOnly;
  final bool enableNotifications;

  // History
  final bool pauseSearchHistory;
  final bool pauseCookHistory;

  // Privacy / Cache
  final bool sendAnonymousStats;
  final bool clearCacheOnExit;

  // Convenience
  final String measurementSystem; // or "imperial"
  final int defaultServings;
  final bool showTooltips;

  // Future / backup
  final bool enableCloudBackup;
  final bool syncAcrossDevices;

  GeneralSettingsModel({
    required this.id,
    required this.pauseAutoUpdate,
    required this.downloadOverWifiOnly,
    required this.enableNotifications,
    required this.pauseSearchHistory,
    required this.pauseCookHistory,
    required this.sendAnonymousStats,
    required this.clearCacheOnExit,
    required this.measurementSystem,
    required this.defaultServings,
    required this.showTooltips,
    required this.enableCloudBackup,
    required this.syncAcrossDevices
  });

  GeneralSettingsEntity toGeneralSettingsEntity() {
    return GeneralSettingsEntity(
      id: id,
      pauseAutoUpdate: pauseAutoUpdate,
      downloadOverWifiOnly: downloadOverWifiOnly,
      enableNotifications: enableNotifications,
      pauseSearchHistory: pauseSearchHistory,
      pauseCookHistory: pauseCookHistory,
      sendAnonymousStats: sendAnonymousStats,
      clearCacheOnExit: clearCacheOnExit,
      measurementSystem: measurementSystem,
      defaultServings: defaultServings,
      showTooltips: showTooltips,
      enableCloudBackup: enableCloudBackup,
      syncAcrossDevices: syncAcrossDevices,
    );
  }

  static GeneralSettingsModel toGeneralSettingsModel(
    GeneralSettingsEntity generalSettingsEntity,
  ) {
    return GeneralSettingsModel(
      id: generalSettingsEntity.id,
      pauseAutoUpdate: generalSettingsEntity.pauseAutoUpdate,
      downloadOverWifiOnly: generalSettingsEntity.downloadOverWifiOnly,
      enableNotifications: generalSettingsEntity.enableNotifications,
      pauseSearchHistory: generalSettingsEntity.pauseSearchHistory,
      pauseCookHistory: generalSettingsEntity.pauseCookHistory,
      sendAnonymousStats: generalSettingsEntity.sendAnonymousStats,
      clearCacheOnExit: generalSettingsEntity.clearCacheOnExit,
      measurementSystem: generalSettingsEntity.measurementSystem,
      defaultServings: generalSettingsEntity.defaultServings,
      showTooltips: generalSettingsEntity.showTooltips,
      enableCloudBackup: generalSettingsEntity.enableCloudBackup,
      syncAcrossDevices: generalSettingsEntity.syncAcrossDevices,
    );
  }

  GeneralSettingsModel copyWith({
    Id? id,
    bool? pauseAutoUpdate,
    bool? downloadOverWifiOnly,
    bool? enableNotifications,
    bool? pauseSearchHistory,
    bool? pauseCookHistory,
    bool? sendAnonymousStats,
    bool? clearCacheOnExit,
    String? measurementSystem,
    int? defaultServings,
    bool? showTooltips,
    bool? enableCloudBackup,
    bool? syncAcrossDevices,
  }){
    return GeneralSettingsModel(
      id: id ?? this.id,
      pauseAutoUpdate: pauseAutoUpdate ?? this.pauseAutoUpdate,
      downloadOverWifiOnly: downloadOverWifiOnly ?? this.downloadOverWifiOnly,
      enableNotifications: enableNotifications ?? this.enableNotifications,
      pauseSearchHistory: pauseSearchHistory ?? this.pauseSearchHistory,
      pauseCookHistory: pauseCookHistory ?? this.pauseCookHistory,
      sendAnonymousStats: sendAnonymousStats ?? this.sendAnonymousStats,
      clearCacheOnExit: clearCacheOnExit ?? this.clearCacheOnExit,
      measurementSystem: measurementSystem ?? this.measurementSystem,
      defaultServings: defaultServings ?? this.defaultServings,
      showTooltips: showTooltips ?? this.showTooltips,
      enableCloudBackup: enableCloudBackup ?? this.enableCloudBackup,
      syncAcrossDevices: syncAcrossDevices ?? this.syncAcrossDevices,
    );
  }

}


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
  final bool isAmoledBackground;
  final bool keepScreenOnOnRecipePage;
  final int seedColor;
  final int primaryColor;
  final String language;
  LookAndFeelModel({
    required this.id,
    required this.themeMode,
    required this.isAmoledBackground,
    required this.keepScreenOnOnRecipePage,
    required this.seedColor,
    required this.primaryColor,
    required this.language,
  });

  LookAndFeelEntity toLookAndFeelEntity() {
    return LookAndFeelEntity(
      id: id,
      themeMode: themeMode,
      isAmoledBackground: isAmoledBackground,
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
      isAmoledBackground: lookAndFeelEntity.isAmoledBackground,
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
    bool? isAmoledBackground,
    bool? keepScreenOnOnRecipePage,
    int? seedColor,
    int? primaryColor,
    String? language,
  }) {
    return LookAndFeelModel(
      id: id ?? this.id,
      themeMode: themeMode ?? this.themeMode,
      isAmoledBackground: isAmoledBackground ?? this.isAmoledBackground,
      keepScreenOnOnRecipePage: keepScreenOnOnRecipePage ?? this.keepScreenOnOnRecipePage,
      seedColor: seedColor ?? this.seedColor,
      primaryColor: primaryColor ?? this.primaryColor,
      language: language ?? this.language,
    );
  }
}

@Collection()
class SearchHistoryModel {
  Id id = Isar.autoIncrement;
  @Index(unique: true)
  final String query;
  final DateTime createdAt;
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
