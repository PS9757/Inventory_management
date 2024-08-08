import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:task/core/injectable_module/injection_container.config.dart';

final di = GetIt.I;

@InjectableInit()
Future<void> configureDependencies() async {
  di.init();
}
