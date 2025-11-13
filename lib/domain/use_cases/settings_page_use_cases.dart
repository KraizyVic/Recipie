import 'package:recipie/domain/entities/settings_page_entities.dart';
import 'package:recipie/domain/repositories/settings_page_repository.dart';

/*
#############################################################
********************* Profile Use Cases *********************
#############################################################
*/

class CreateProfile{
  final SettingsPageRepository settingsPageRepository;
  CreateProfile({required this.settingsPageRepository});

  Future<void> createProfile(ProfileEntity profileEntity)async{
    await settingsPageRepository.createProfile(profileEntity);
  }
}
class ReadProfile{
  final SettingsPageRepository settingsPageRepository;
  ReadProfile({required this.settingsPageRepository});

  Future<ProfileEntity> readProfile(int id)async{
    return await settingsPageRepository.readProfile(id);
  }
}
class UpdateProfile{
  final SettingsPageRepository settingsPageRepository;
  UpdateProfile({required this.settingsPageRepository});

  Future<void> updateProfile(ProfileEntity profileEntity)async {
    await settingsPageRepository.updateProfile(profileEntity);
  }
}
class DeleteProfile{
  final SettingsPageRepository settingsPageRepository;
  DeleteProfile({required this.settingsPageRepository});

  Future<void> deleteProfile(int id)async{
    await settingsPageRepository.deleteProfile(id);
  }
}

/*
#############################################################
****************** Look And Feel Use Cases ******************
#############################################################
*/

class CreateLookAndFeel{
  final SettingsPageRepository settingsPageRepository;
  CreateLookAndFeel({required this.settingsPageRepository});

  Future<void> createLookAndFeel(LookAndFeelEntity lookAndFeelEntity)async{
    await settingsPageRepository.setTheme(lookAndFeelEntity);
  }
}
class ReadLookAndFeel{
  final SettingsPageRepository settingsPageRepository;
  ReadLookAndFeel({required this.settingsPageRepository});

  Future<LookAndFeelEntity?> readLookAndFeel(int id)async{
    return await settingsPageRepository.readLookAndFeelSettings(id);
  }
}
class UpdateLookAndFeel{
  final SettingsPageRepository settingsPageRepository;
  UpdateLookAndFeel({required this.settingsPageRepository});

  Future<void> updateLookAndFeel(LookAndFeelEntity lookAndFeelEntity)async{
    await settingsPageRepository.updateLookAndFeelSettings(lookAndFeelEntity);
  }
}
class ResetLookAndFeel{
  final SettingsPageRepository settingsPageRepository;
  ResetLookAndFeel({required this.settingsPageRepository});

  Future<void> resetLookAndFeel()async{
    await settingsPageRepository.resetLookAndFeelSettings();
  }
}

/*
#############################################################
***************** Search History Use Cases ******************
#############################################################
*/

class CreateSearchHistory{
  final SettingsPageRepository settingsPageRepository;
  CreateSearchHistory({required this.settingsPageRepository});

  Future<void> createSearchHistory(SearchHistoryEntity searchHistoryEntity)async{
    await settingsPageRepository.addSearchQuery(searchHistoryEntity);
  }
}
class ReadSearchHistory{
  final SettingsPageRepository settingsPageRepository;
  ReadSearchHistory({required this.settingsPageRepository});

  Future<List<SearchHistoryEntity>> readSearchHistory()async{
    return await settingsPageRepository.readSearchHistory();
  }
}
class DeleteSearchHistory {
  final SettingsPageRepository settingsPageRepository;

  DeleteSearchHistory({required this.settingsPageRepository});

  Future<void> deleteSearchHistory(int id) async {
    await settingsPageRepository.deleteFromSearchHistory(id);
  }
}
class ClearSearchHistory{
  final SettingsPageRepository settingsPageRepository;
  ClearSearchHistory({required this.settingsPageRepository});

  Future<void> clearSearchHistory()async{
    await settingsPageRepository.clearSearchHistory();
  }
}
/*
#############################################################
****************** Cook History Use Cases *******************
#############################################################
*/
class CreateCookHistory{
  final SettingsPageRepository settingsPageRepository;
  CreateCookHistory({required this.settingsPageRepository});

  Future<void> createCookHistory(CookHistoryEntity cookHistoryEntity)async{
    await settingsPageRepository.addCookedRecipe(cookHistoryEntity);
  }
}
class ReadCookHistory{
  final SettingsPageRepository settingsPageRepository;
  ReadCookHistory({required this.settingsPageRepository});

  Future<List<CookHistoryEntity>> readCookHistory()async{
    return await settingsPageRepository.readCookHistory();
  }
}
class DeleteCookHistory {
  final SettingsPageRepository settingsPageRepository;
  DeleteCookHistory({required this.settingsPageRepository});

  Future<void> deleteCookHistory(int id) async {
    await settingsPageRepository.deleteFromCookHistory(id);
  }
}
class ClearCookHistory{
  final SettingsPageRepository settingsPageRepository;
  ClearCookHistory({required this.settingsPageRepository});

  Future<void> clearCookHistory()async{
    await settingsPageRepository.clearCookHistory();
  }
}



