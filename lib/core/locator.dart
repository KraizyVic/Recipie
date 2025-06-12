import 'package:get_it/get_it.dart';
import 'package:recipa/data/data_source/online/a_to_z_online_data_source.dart';

import '../data/data_source/online/home_page_online_data_source.dart';
import '../data/repositories/a_to_z_repository_impl.dart';
import '../data/repositories/home_page_repository_impl.dart';
import '../domain/repositories/a_to_z_repository.dart';
import '../domain/repositories/home_page_repository.dart';
import '../domain/use_cases/a_to_z_use_cases.dart';
import '../domain/use_cases/home_page_use_cases.dart';

final sl = GetIt.instance; // sl = service locator

void setupLocator() {
  // Data sources
  sl.registerLazySingleton<HomePageOnlineDataSource>(() => HomePageOnlineDataSource());
  sl.registerLazySingleton<AToZOnlineDataSource>(()=> AToZOnlineDataSource());

  // Repositories
  sl.registerLazySingleton<HomePageRepository>(() => HomePageRepositoryImpl(homePageOnlineDataSource: sl<HomePageOnlineDataSource>()),);
  sl.registerLazySingleton<AToZRepository>(() => AToZRepositoryImpl(aToZOnlineDataSource: sl<AToZOnlineDataSource>()),);

  // Use cases
  sl.registerLazySingleton<FetchHomeItemsUseCase>(() => FetchHomeItemsUseCase(homePageRepository: sl<HomePageRepository>()),);
  sl.registerLazySingleton<FetchAToZUseCase>(() => FetchAToZUseCase(aToZRepository: sl<AToZRepository>()),);
}
