// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:task/data/home/datasource/home_datasource.dart' as _i10;
import 'package:task/data/home/repository_implementation/home_repository_implementation.dart'
    as _i809;
import 'package:task/domain/home/repository/home_repository.dart' as _i546;
import 'package:task/domain/home/usecase/get_data_usecase.dart' as _i349;
import 'package:task/presentation/home/bloc/search_data_cubit.dart' as _i300;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i10.HomeDataSource>(() => _i10.HomeDatasourceImpl());
    gh.lazySingleton<_i546.HomeRepository>(
        () => _i809.HomeRepositoryImplementation(gh<_i10.HomeDataSource>()));
    gh.lazySingleton<_i349.GetDataUsecase>(
        () => _i349.GetDataUsecase(gh<_i546.HomeRepository>()));
    gh.factory<_i300.SearchDataCubit>(
        () => _i300.SearchDataCubit(gh<_i349.GetDataUsecase>()));
    return this;
  }
}
