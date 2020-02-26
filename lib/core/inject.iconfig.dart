// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:manga/data/datasource/local_datasource.dart';
import 'package:manga/data/datasource/remote_datasource.dart';
import 'package:manga/domain/repository/repository.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  g.registerFactory<LocalDataSource>(() => LocalDataSource());
  g.registerFactory<RemoteDataSource>(() => RemoteDataSource());
  g.registerFactory<Repository>(() => Repository(
        g<LocalDataSource>(),
        g<RemoteDataSource>(),
      ));
}
