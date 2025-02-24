import 'package:bases_web/services/navigation_service.dart';
import 'package:get_it/get_it.dart';

// En cualquier lugar de mi app puede hacer referencia a este locator, teniendo acceso
// a mi NavigationService.
GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}
