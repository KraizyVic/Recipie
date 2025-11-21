
class GeneralSettingsEntity{
  final int id;

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

  GeneralSettingsEntity({
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
}

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
  final bool isAmoledBackground;
  final bool keepScreenOnOnRecipePage;
  final int seedColor;
  final int primaryColor;
  final String language;

  LookAndFeelEntity({
    required this.id,
    required this.themeMode,
    required this.isAmoledBackground,
    required this.keepScreenOnOnRecipePage,
    required this.seedColor,
    required this.primaryColor,
    required this.language
  });
}

class SearchHistoryEntity{
  final int id;
  final String query;
  final DateTime createdAt;

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
