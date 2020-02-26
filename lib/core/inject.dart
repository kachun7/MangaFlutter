import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'inject.iconfig.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
void configure() => $initGetIt(getIt);
