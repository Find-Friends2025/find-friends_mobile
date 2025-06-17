// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:find_friends/data/auth/repository/auth_repository.dart'
    as _i1037;
import 'package:find_friends/data/auth/repository/auth_repository_impl.dart'
    as _i130;
import 'package:find_friends/data/core/di/dio_module.dart' as _i385;
import 'package:find_friends/data/firebase/repository/firebase_repository.dart'
    as _i783;
import 'package:find_friends/data/firebase/repository/firebase_repository_impl.dart'
    as _i606;
import 'package:find_friends/ui/signin/view_model/sign_in_view_model.dart'
    as _i859;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.lazySingleton<_i859.SignInViewModel>(() => _i859.SignInViewModel());
    gh.lazySingleton<_i385.AuthInterceptor>(() => _i385.AuthInterceptor());
    gh.lazySingleton<_i1037.AuthRepository>(() => _i130.AuthRepositoryImpl());
    gh.lazySingleton<_i783.FirebaseRepository>(
      () => _i606.FirebaseRepositoryImpl(),
    );
    gh.lazySingleton<_i361.Dio>(
      () => dioModule.dio(gh<_i385.AuthInterceptor>()),
    );
    return this;
  }
}

class _$DioModule extends _i385.DioModule {}
