import 'package:get_it/get_it.dart';
import 'package:workers/core/services/api.dart';
import 'core/viewmodels/CRUDPerfil.dart';
import 'core/viewmodels/CRUDModel.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => Api('trabajos'));
  locator.registerLazySingleton(() => CRUDModel());
  locator.registerLazySingleton(() => CRUDPerfil());
}