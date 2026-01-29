// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

import '../../features/todo/data/datasources/todo_remote_data_source.dart'
    as _i262;
import '../../features/todo/data/repositories/todo_repository_impl.dart'
    as _i767;
import '../../features/todo/domain/repositories/todo_repository.dart' as _i136;
import '../../features/todo/domain/usecases/todo_usecases.dart' as _i879;
import '../../features/todo/presentation/state/remote/todo_cubit.dart' as _i337;
import 'supabase_module.dart' as _i695;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final supabaseModule = _$SupabaseModule();
    gh.lazySingleton<_i454.SupabaseClient>(() => supabaseModule.supabaseClient);
    gh.lazySingleton<_i262.TodoRemoteDataSource>(
      () => _i262.TodoRemoteDataSourceImpl(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i136.TodoRepository>(
      () => _i767.TodoRepositoryImpl(gh<_i262.TodoRemoteDataSource>()),
    );
    gh.factory<_i879.GetTodosUseCase>(
      () => _i879.GetTodosUseCase(gh<_i136.TodoRepository>()),
    );
    gh.factory<_i879.AddTodoUseCase>(
      () => _i879.AddTodoUseCase(gh<_i136.TodoRepository>()),
    );
    gh.factory<_i879.UpdateTodoUseCase>(
      () => _i879.UpdateTodoUseCase(gh<_i136.TodoRepository>()),
    );
    gh.factory<_i879.DeleteTodoUseCase>(
      () => _i879.DeleteTodoUseCase(gh<_i136.TodoRepository>()),
    );
    gh.factory<_i337.TodoCubit>(
      () => _i337.TodoCubit(
        gh<_i879.GetTodosUseCase>(),
        gh<_i879.AddTodoUseCase>(),
        gh<_i879.UpdateTodoUseCase>(),
        gh<_i879.DeleteTodoUseCase>(),
      ),
    );
    return this;
  }
}

class _$SupabaseModule extends _i695.SupabaseModule {}
