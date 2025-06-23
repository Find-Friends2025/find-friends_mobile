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
import 'package:find_friends/data/chat/repository/chat_repository_impl.dart'
    as _i581;
import 'package:find_friends/data/core/di/dio_module.dart' as _i385;
import 'package:find_friends/data/core/storage/token_storage.dart' as _i513;
import 'package:find_friends/data/firebase/repository/firebase_repository.dart'
    as _i783;
import 'package:find_friends/data/firebase/repository/firebase_repository_impl.dart'
    as _i606;
import 'package:find_friends/data/user/repository/user_repository_impl.dart'
    as _i907;
import 'package:find_friends/domain/repository/chat_repository.dart' as _i492;
import 'package:find_friends/domain/repository/user_repository.dart' as _i376;
import 'package:find_friends/ui/chat/chat_viewmodel.dart' as _i348;
import 'package:find_friends/ui/chatdetail/chat_detail_viewmodel.dart' as _i368;
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
    gh.lazySingleton<_i385.AuthInterceptor>(() => _i385.AuthInterceptor());
    gh.lazySingleton<_i513.TokenStorage>(() => _i513.TokenStorage());
    gh.lazySingleton<_i783.FirebaseRepository>(
      () => _i606.FirebaseRepositoryImpl(),
    );
    gh.lazySingleton<_i361.Dio>(
      () => dioModule.dioForSocket(gh<_i385.AuthInterceptor>()),
      instanceName: 'socket',
    );
    gh.lazySingleton<_i361.Dio>(
      () => dioModule.dio(gh<_i385.AuthInterceptor>()),
      instanceName: 'api',
    );
    gh.lazySingleton<_i1037.AuthRepository>(
      () => _i130.AuthRepositoryImpl(gh<_i361.Dio>(instanceName: 'api')),
    );
    gh.lazySingleton<_i492.ChatRepository>(
      () => _i581.ChatRepositoryImpl(
        gh<_i361.Dio>(instanceName: 'api'),
        gh<_i361.Dio>(instanceName: 'socket'),
      ),
    );
    gh.factory<_i348.ChatViewModel>(
      () => _i348.ChatViewModel(gh<_i492.ChatRepository>()),
    );
    gh.lazySingleton<_i376.UserRepository>(
      () => _i907.UserRepositoryImpl(gh<_i361.Dio>(instanceName: 'api')),
    );
    gh.lazySingleton<_i859.SignInViewModel>(
      () => _i859.SignInViewModel(
        gh<_i783.FirebaseRepository>(),
        gh<_i1037.AuthRepository>(),
        gh<_i513.TokenStorage>(),
      ),
    );
    gh.factory<_i368.ChatDetailViewModel>(
      () => _i368.ChatDetailViewModel(
        gh<_i492.ChatRepository>(),
        gh<_i376.UserRepository>(),
      ),
    );
    return this;
  }
}

class _$DioModule extends _i385.DioModule {}
