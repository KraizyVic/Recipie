import 'package:recipie/core/constants.dart';
import 'package:recipie/data/data_source/local/settings_page_data_source.dart';
import 'package:recipie/data/models/settings_page_model.dart';
import 'package:recipie/domain/entities/settings_page_entities.dart';
import 'package:recipie/domain/repositories/settings_page_repository.dart';

class SettingsPageRepositoryImpl extends SettingsPageRepository {
  final SettingsPageDataSource settingsPageDataSource;

  SettingsPageRepositoryImpl({required this.settingsPageDataSource});

  // Profile Repo impls

  @override
  Future<void> createProfile(ProfileEntity profileEntity) async{
    await settingsPageDataSource.createProfile(ProfileModel.toProfileModel(profileEntity));
  }
  @override
  Future<ProfileEntity> readProfile(int id) async{
    return await settingsPageDataSource.readProfile(id).then((value) => value!.toProfileEntity());
  }
  @override
  Future<void> updateProfile(ProfileEntity profileEntity) async{
    await settingsPageDataSource.updateProfile(ProfileModel.toProfileModel(profileEntity));
  }
  @override
  Future<void> deleteProfile(int id) async{
    await settingsPageDataSource.deleteProfile(id);
  }

  // Look and Feel Repo impls

  @override
  Future<void> setTheme(LookAndFeelEntity lookAndFeelEntity) async{
    await settingsPageDataSource.setLookAndFeelSettings(LookAndFeelModel.toLookAndFeelModel(lookAndFeelEntity));
  }
  @override
  Future<LookAndFeelEntity> readLookAndFeelSettings(int id) async{
    return await settingsPageDataSource.readLookAndFeelSettings(id).then((value) => value?.toLookAndFeelEntity() ?? defaultLookAndFeel);
  }
  @override
  Future<void> resetLookAndFeelSettings() async{
    await settingsPageDataSource.resetLookAndFeelSettings();
  }
  @override
  Future<void> updateLookAndFeelSettings(LookAndFeelEntity lookAndFeelEntity) async{
    await settingsPageDataSource.updateLookAndFeelSettings(LookAndFeelModel.toLookAndFeelModel(lookAndFeelEntity));
  }

  // Search History Repo impls

  @override
  Future<void> addSearchQuery(SearchHistoryEntity searchHistoryEntity) async{
    await settingsPageDataSource.addSearchQueryToHistory(SearchHistoryModel.toSearchHistoryModel(searchHistoryEntity));
  }
  @override
  Future<List<SearchHistoryEntity>> readSearchHistory() async{
    return await settingsPageDataSource.readSearchHistory().then((value) => value.map((e) => e.toSearchHistoryEntity()).toList());
  }
  @override
  Future<void> deleteFromSearchHistory(int id) async{
    await settingsPageDataSource.deleteSearchHistory(id);
  }
  @override
  Future<void> clearSearchHistory() async{
    await settingsPageDataSource.clearSearchHistory();
  }

  // Cook History Repo impls

  @override
  Future<void> addCookedRecipe(CookHistoryEntity cookHistoryEntity) async{
    await settingsPageDataSource.addRecipeToHistory(CookHistoryModel.toCookHistoryModel(cookHistoryEntity));
  }
  @override
  Future<List<CookHistoryEntity>> readCookHistory() async{
    return await settingsPageDataSource.readRecipeHistory().then((value) => value.map((e) => e.toCookHistoryEntity()).toList());
  }
  @override
  Future<void> deleteFromCookHistory(int id) async {
    await settingsPageDataSource.deleteRecipeHistory(id);
  }
  @override
  Future<void> clearCookHistory() async{
    await settingsPageDataSource.clearRecipeHistory();
  }
}