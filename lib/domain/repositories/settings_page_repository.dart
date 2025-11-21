import 'package:recipie/domain/entities/settings_page_entities.dart';

abstract class SettingsPageRepository {
  // Account Functions
  Future<void> createProfile(ProfileEntity profileEntity);
  Future<ProfileEntity> readProfile(int id);
  Future<void> updateProfile(ProfileEntity profileEntity);
  Future<void> deleteProfile(int id);

  // General Settings Functions
  Future<void> setGeneralSettings(GeneralSettingsEntity generalSettingsEntity);
  Future<void> updateGeneralSettings(GeneralSettingsEntity generalSettingsEntity);
  Future<GeneralSettingsEntity> readGeneralSettings(int id);
  Future<void> resetGeneralSettings();

  // Theme Functions
  Future<void> setTheme(LookAndFeelEntity lookAndFeelEntity);
  Future<LookAndFeelEntity> readLookAndFeelSettings(int id);
  Future<void> updateLookAndFeelSettings(LookAndFeelEntity lookAndFeelEntity);
  Future<void> resetLookAndFeelSettings();

  // Search History Functions
  Future<void> addSearchQuery(SearchHistoryEntity searchHistoryEntity);
  Future<List<SearchHistoryEntity>> readSearchHistory();
  Future<void> deleteFromSearchHistory(int id);
  Future<void> clearSearchHistory();

  // Cook History Functions
  Future<void> addCookedRecipe(CookHistoryEntity cookHistoryEntity);
  Future<List<CookHistoryEntity>> readCookHistory();
  Future<void> deleteFromCookHistory(int id);
  Future<void> clearCookHistory();
}