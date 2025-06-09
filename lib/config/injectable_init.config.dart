// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:find_friends/data/di/dio_module.dart' as _i313;
import 'package:find_friends/data/firebase/firebase_repository.dart' as _i119;
import 'package:find_friends/data/firebase/firebase_repository_impl.dart'
    as _i34;
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
    gh.factory<_i859.SignInViewModel>(() => _i859.SignInViewModel());
    gh.lazySingleton<_i313.AuthInterceptor>(() => _i313.AuthInterceptor());
    gh.lazySingleton<_i119.FirebaseRepository>(
      () => _i34.FirebaseRepositoryImpl(),
    );
    gh.lazySingleton<_i361.Dio>(
      () => dioModule.dio(gh<_i313.AuthInterceptor>()),
    );
    return this;
  }
}

class _$DioModule extends _i313.DioModule {}
