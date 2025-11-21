import 'package:get_it/get_it.dart';
import 'package:isar_community/isar.dart';
import 'package:recipie/core/models/recipe_n_article_card_model.dart';
import 'package:recipie/data/data_source/local/cook_book_data_source.dart';
import 'package:recipie/data/data_source/local/groceries_data_source.dart';
import 'package:recipie/data/data_source/local/settings_page_data_source.dart';
import 'package:recipie/data/models/grocery_model.dart';
import 'package:recipie/data/repositories/grocery_repository_impl.dart';
import 'package:recipie/domain/repositories/groceries_repositories.dart';
import 'package:recipie/domain/use_cases/cook_book_use_cases.dart';
import 'package:recipie/domain/use_cases/grocery_use_cases.dart';
import 'package:recipie/domain/use_cases/settings_page_use_cases.dart';
import '../data/data_source/online/a_to_z_online_data_source.dart';
import '../data/data_source/online/home_page_online_data_source.dart';
import '../data/models/settings_page_model.dart';
import '../data/repositories/a_to_z_repository_impl.dart';
import '../data/repositories/cook_book_repository_impl.dart';
import '../data/repositories/home_page_repository_impl.dart';
import '../data/repositories/settings_page_repository_impl.dart';
import '../domain/repositories/a_to_z_repository.dart';
import '../domain/repositories/cook_book_repository.dart';
import '../domain/repositories/home_page_repository.dart';
import '../domain/repositories/settings_page_repository.dart';
import '../domain/use_cases/a_to_z_use_cases.dart';
import '../domain/use_cases/home_page_use_cases.dart';
import 'package:path_provider/path_provider.dart';

final sl = GetIt.instance; // sl = service locator


Future<void> setupLocator() async{
  // ISAR Stuff
  final dir = await getApplicationDocumentsDirectory();
  final Isar isar = await Isar.open(
    [
      GroceryItemModelSchema,
      RecipeCardModelSchema,
      ProfileModelSchema,
      LookAndFeelModelSchema,
      SearchHistoryModelSchema,
      CookHistoryModelSchema
    ],
    directory: dir.path,
  );
  sl.registerLazySingleton<Isar>(() => isar);

  // #######  Data sources  #######
  sl.registerLazySingleton<HomePageOnlineDataSource>(() => HomePageOnlineDataSource());
  sl.registerLazySingleton<AToZOnlineDataSource>(()=> AToZOnlineDataSource());
  sl.registerLazySingleton<GroceriesDataSource>(()=> GroceriesDataSource(isar: isar));
  sl.registerLazySingleton<CookBookDataSource>(()=> CookBookDataSource(isar: isar));
  sl.registerLazySingleton<SettingsPageDataSource>(()=> SettingsPageDataSource(isar: isar));

  // #######  Repositories  #######
  sl.registerLazySingleton<HomePageRepository>(() => HomePageRepositoryImpl(homePageOnlineDataSource: sl<HomePageOnlineDataSource>()),);
  sl.registerLazySingleton<AToZRepository>(() => AToZRepositoryImpl(aToZOnlineDataSource: sl<AToZOnlineDataSource>()),);
  sl.registerLazySingleton<GroceryItemRepository>(() => GroceryRepositoryImpl(groceriesDataSource: sl<GroceriesDataSource>()),);
  sl.registerLazySingleton<CookBookRepository>(() => CookBookRepositoryImpl(cookBookDataSource: sl<CookBookDataSource>()),);
  sl.registerLazySingleton<SettingsPageRepository>(() => SettingsPageRepositoryImpl(settingsPageDataSource: sl<SettingsPageDataSource>()),);

  // #######  Use cases  #######
  sl.registerLazySingleton<FetchHomeItemsUseCase>(() => FetchHomeItemsUseCase(homePageRepository: sl<HomePageRepository>()),);
  sl.registerLazySingleton<FetchAToZUseCase>(() => FetchAToZUseCase(aToZRepository: sl<AToZRepository>()),);

  // Groceries Use Cases
  sl.registerLazySingleton<AddGrocery>(() => AddGrocery(groceryItemRepository: sl<GroceryItemRepository>()),);
  sl.registerLazySingleton<GetGroceries>(() => GetGroceries(groceryItemRepository: sl<GroceryItemRepository>()),);
  sl.registerLazySingleton<ToggleGrocery>(() => ToggleGrocery(groceryItemRepository: sl<GroceryItemRepository>()),);
  sl.registerLazySingleton<DeleteGrocery>(() => DeleteGrocery(groceryItemRepository: sl<GroceryItemRepository>()),);

  // Cook Book Use Cases
  sl.registerLazySingleton<AddRecipeToCookBook>(() => AddRecipeToCookBook(cookBookRepository: sl<CookBookRepository>()),);
  sl.registerLazySingleton<GetCookBookRecipes>(() => GetCookBookRecipes(cookBookRepository: sl<CookBookRepository>()),);
  sl.registerLazySingleton<RemoveRecipeFromCookBook>(() => RemoveRecipeFromCookBook(cookBookRepository: sl<CookBookRepository>()),);

  // Settings Page Use Cases
  // --Profile
  sl.registerLazySingleton<CreateProfile>(() => CreateProfile(settingsPageRepository: sl<SettingsPageRepository>()),);
  sl.registerLazySingleton<ReadProfile>(() => ReadProfile(settingsPageRepository: sl<SettingsPageRepository>()),);
  sl.registerLazySingleton<UpdateProfile>(() => UpdateProfile(settingsPageRepository: sl<SettingsPageRepository>()),);
  sl.registerLazySingleton<DeleteProfile>(() => DeleteProfile(settingsPageRepository: sl<SettingsPageRepository>()),);
  // --General Settings
  sl.registerLazySingleton<CreateGeneralSettings>(() => CreateGeneralSettings(settingsPageRepository: sl<SettingsPageRepository>()),);
  sl.registerLazySingleton<ReadGeneralSettings>(() => ReadGeneralSettings(settingsPageRepository: sl<SettingsPageRepository>()),);
  sl.registerLazySingleton<UpdateGeneralSettings>(() => UpdateGeneralSettings(settingsPageRepository: sl<SettingsPageRepository>()),);
  sl.registerLazySingleton<ResetGeneralSettings>(() => ResetGeneralSettings(settingsPageRepository: sl<SettingsPageRepository>()),);
  // --Look and Feel
  sl.registerLazySingleton<CreateLookAndFeel>(() => CreateLookAndFeel(settingsPageRepository: sl<SettingsPageRepository>()),);
  sl.registerLazySingleton<ReadLookAndFeel>(() => ReadLookAndFeel(settingsPageRepository: sl<SettingsPageRepository>()),);
  sl.registerLazySingleton<UpdateLookAndFeel>(() => UpdateLookAndFeel(settingsPageRepository: sl<SettingsPageRepository>()),);
  sl.registerLazySingleton<ResetLookAndFeel>(() => ResetLookAndFeel(settingsPageRepository: sl<SettingsPageRepository>()),);
  // --Search History
  sl.registerLazySingleton<CreateSearchHistory>(() => CreateSearchHistory(settingsPageRepository: sl<SettingsPageRepository>()),);
  sl.registerLazySingleton<ReadSearchHistory>(() => ReadSearchHistory(settingsPageRepository: sl<SettingsPageRepository>()),);
  sl.registerLazySingleton<DeleteSearchHistory>(() => DeleteSearchHistory(settingsPageRepository: sl<SettingsPageRepository>()),);
  sl.registerLazySingleton<ClearSearchHistory>(() => ClearSearchHistory(settingsPageRepository: sl<SettingsPageRepository>()),);
  // --Cook History
  sl.registerLazySingleton<CreateCookHistory>(() => CreateCookHistory(settingsPageRepository: sl<SettingsPageRepository>()),);
  sl.registerLazySingleton<ReadCookHistory>(() => ReadCookHistory(settingsPageRepository: sl<SettingsPageRepository>()),);
  sl.registerLazySingleton<DeleteCookHistory>(() => DeleteCookHistory(settingsPageRepository: sl<SettingsPageRepository>()),);
  sl.registerLazySingleton<ClearCookHistory>(() => ClearCookHistory(settingsPageRepository: sl<SettingsPageRepository>()),);
}
