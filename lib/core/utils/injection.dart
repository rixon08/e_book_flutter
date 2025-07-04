import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_book_flutter/core/network/dio_network.dart';
import 'package:e_book_flutter/core/network/network_info.dart';
import 'package:e_book_flutter/features/e_book/data/datasources/e_book_local_source.dart';
import 'package:e_book_flutter/features/e_book/data/models/e_book_model.dart';
import 'package:e_book_flutter/features/e_book/data/models/liked_e_book_model.dart';
import 'package:e_book_flutter/features/e_book/data/repositories/get_e_book_impl.dart';
import 'package:e_book_flutter/features/e_book/data/repositories/get_liked_e_book_impl.dart';
import 'package:e_book_flutter/features/e_book/domain/repositories/e_book_repository.dart';
import 'package:e_book_flutter/features/e_book/domain/repositories/liked_e_book_repository.dart';
import 'package:e_book_flutter/features/e_book/domain/usecases/get_data_e_book_usecase.dart';
import 'package:e_book_flutter/features/e_book/domain/usecases/get_data_is_liked_e_book_usecase.dart';
import 'package:e_book_flutter/features/e_book/domain/usecases/get_data_liked_e_book_usecase.dart';
import 'package:e_book_flutter/features/e_book/domain/usecases/set_like_e_book_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

final getIt = GetIt.instance;

Future<void> initInjections() async {
  initDioInjections();
  await setupInjection();
}

initDioInjections() async {
  getIt.registerSingleton<DioNetwork>(DioNetwork());
}

setupInjection() async {
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
      directory: dir.path, [EBookModelSchema, LikedEBookModelSchema]);
  getIt.registerSingleton<Isar>(isar);
  getIt.registerSingleton<EBookLocalSource>(EBookLocalSource(isar));
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());
  getIt.registerLazySingleton<NetworkImpl>(() => NetworkImpl(getIt()));
  getIt.registerLazySingleton<EBookRepository>(() => GetEBookImpl());
  getIt.registerLazySingleton<LikedEBookRepository>(() => GetLikedEBookImpl());
  getIt.registerLazySingleton(() => GetDataEBookUsecase(getIt()));
  getIt.registerLazySingleton(() => GetDataLikedEBookUsecase(getIt()));
  getIt.registerLazySingleton(() => GetDataIsLikedEBookUsecase(getIt()));
  getIt.registerLazySingleton(() => SetLikeEBookUsecase(getIt()));
}
