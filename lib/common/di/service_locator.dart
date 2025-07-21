import 'package:get_it/get_it.dart';
import 'package:skapi_obligations/common/utils/network_client/dio_handler.dart';
import 'package:skapi_obligations/features/obligations/data/data_source/obligations_remote_data_source.dart';
import 'package:skapi_obligations/features/obligations/domain/repository/obligations_repository.dart';
import 'package:skapi_obligations/features/obligations/presentation/bloc/obligations_bloc.dart';

import '../../features/obligations/data/repository/obligations_repositor_impl.dart';

final getIt = GetIt.instance;

void setupLocator() {
  // Register DioHandler singleton
  getIt.registerLazySingleton<DioHandler>(() => DioHandler());

  // Register data source with Dio instance from DioHandler
  getIt.registerLazySingleton<ObligationsRemoteDataSource>(
    () => ObligationsRemoteDataSource(getIt<DioHandler>().dio),
  );

  // Register repository
  getIt.registerLazySingleton<ObligationsRepository>(
    () => ObligationsRepositoryImpl(getIt<ObligationsRemoteDataSource>()),
  );

  // Register bloc (factory)
  getIt.registerFactory(() => ObligationsBloc(getIt<ObligationsRepository>()));
}
