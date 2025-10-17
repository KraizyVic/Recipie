import 'package:get_it/get_it.dart';
import 'package:isar_community/isar.dart';
import 'package:recipie/core/models/recipe_n_article_card_model.dart';
import 'package:recipie/data/data_source/local/cook_book_data_source.dart';
import 'package:recipie/data/data_source/local/groceries_data_source.dart';
import 'package:recipie/data/models/cook_book_recipe_model.dart';
import 'package:recipie/data/models/grocery_model.dart';
import 'package:recipie/data/repositories/grocery_repository_impl.dart';
import 'package:recipie/domain/repositories/groceries_repositories.dart';
import 'package:recipie/domain/use_cases/cook_book_use_cases.dart';
import 'package:recipie/domain/use_cases/grocery_use_cases.dart';
import '../data/data_source/online/a_to_z_online_data_source.dart';
import '../data/data_source/online/home_page_online_data_source.dart';
import '../data/repositories/a_to_z_repository_impl.dart';
import '../data/repositories/cook_book_repository_impl.dart';
import '../data/repositories/home_page_repository_impl.dart';
import '../domain/repositories/a_to_z_repository.dart';
import '../domain/repositories/cook_book_repository.dart';
import '../domain/repositories/home_page_repository.dart';
import '../domain/use_cases/a_to_z_use_cases.dart';
import '../domain/use_cases/home_page_use_cases.dart';
import 'package:path_provider/path_provider.dart';

final sl = GetIt.instance; // sl = service locator


void setupLocator() async{
  // ISAR Stuff
  final dir = await getApplicationDocumentsDirectory();
  final Isar isar = await Isar.open(
      [GroceryItemModelSchema,RecipeCardModelSchema ],
      directory: dir.path,
  );


  // #######  Data sources  #######
  sl.registerLazySingleton<HomePageOnlineDataSource>(() => HomePageOnlineDataSource());
  sl.registerLazySingleton<AToZOnlineDataSource>(()=> AToZOnlineDataSource());

  sl.registerLazySingleton<GroceriesDataSource>(()=> GroceriesDataSource(isar: isar));
  sl.registerLazySingleton<CookBookDataSource>(()=> CookBookDataSource(isar: isar));


  // #######  Repositories  #######
  sl.registerLazySingleton<HomePageRepository>(() => HomePageRepositoryImpl(homePageOnlineDataSource: sl<HomePageOnlineDataSource>()),);
  sl.registerLazySingleton<AToZRepository>(() => AToZRepositoryImpl(aToZOnlineDataSource: sl<AToZOnlineDataSource>()),);
  sl.registerLazySingleton<GroceryItemRepository>(() => GroceryRepositoryImpl(groceriesDataSource: sl<GroceriesDataSource>()),);
  sl.registerLazySingleton<CookBookRepository>(() => CookBookRepositoryImpl(cookBookDataSource: sl<CookBookDataSource>()),);

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

}
