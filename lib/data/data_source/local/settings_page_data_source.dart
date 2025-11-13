import 'package:isar_community/isar.dart';
import 'package:recipie/core/constants.dart';
import 'package:recipie/data/models/settings_page_model.dart';

class SettingsPageDataSource {
  final Isar isar;
  SettingsPageDataSource({required this.isar});

  // Profile Settings
  Future<void> createProfile(ProfileModel profile) async {
    await isar.writeTxn(() async {
      await isar.profileModels.put(profile);
    });
  }

  Future<ProfileModel?> readProfile(int id) async {
    return await isar.profileModels.get(id);
  }

  Future<void> updateProfile(ProfileModel profile) async {
    await isar.writeTxn(() async {
      await isar.profileModels.put(profile);
    });
  }

  Future<void> deleteProfile(int id) async {
    await isar.writeTxn(() async {
      await isar.profileModels.delete(id);
    });
  }

  // Look and Feel Settings
  Future<void> setLookAndFeelSettings(LookAndFeelModel settings) async {
    await isar.writeTxn(() async {
      await isar.lookAndFeelModels.put(settings);
    });
  }
  Future<LookAndFeelModel?> readLookAndFeelSettings(int id) async {
    return await isar.lookAndFeelModels.get(id);
  }
  Future<void> updateLookAndFeelSettings(LookAndFeelModel settings) async {
    await isar.writeTxn(() async {
      await isar.lookAndFeelModels.put(settings);
    });
  }
  Future<void> resetLookAndFeelSettings() async {
    await isar.writeTxn(() async {
      await isar.lookAndFeelModels.put(LookAndFeelModel.toLookAndFeelModel(defaultLookAndFeel));
    });
  }

  // Search History Settings
  Future<void> addSearchQueryToHistory(SearchHistoryModel searchHistory) async {
    await isar.writeTxn(() async {
      await isar.searchHistoryModels.put(searchHistory);
    });
  }
  Future<List<SearchHistoryModel>> readSearchHistory(){
    return isar.searchHistoryModels.where().findAll();
  }
  Future<void> deleteSearchHistory(int id) async {
    await isar.writeTxn(() async {
      await isar.searchHistoryModels.delete(id);
    });
  }
  Future<void> clearSearchHistory() async {
    await isar.writeTxn(() async {
      await isar.searchHistoryModels.clear();
    });
  }

  // Recipe History Settings
  Future<void> addRecipeToHistory(CookHistoryModel recipeHistory) async {
    await isar.writeTxn(() async {
      await isar.cookHistoryModels.put(recipeHistory);
    });
  }
  Future<List<CookHistoryModel>> readRecipeHistory(){
    return isar.cookHistoryModels.where().findAll();
  }
  Future<void> deleteRecipeHistory(int id) async {
    await isar.writeTxn(() async {
      await isar.cookHistoryModels.delete(id);
    });
  }
  Future<void> clearRecipeHistory() async {
    await isar.writeTxn(() async {
      await isar.cookHistoryModels.clear();
    });
  }

  // Other Settings
  // ***** KILL SWITCH *****
  Future<void> clearAppDatabase() async {
    await isar.writeTxn(() async {
      await isar.clear();
    });
  }
}
