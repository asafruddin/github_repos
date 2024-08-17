import 'package:get_it/get_it.dart';
import 'package:trending_list/core/network/client.dart';
import 'package:trending_list/data/datasources/remote_datasources.dart';
import 'package:trending_list/data/repository_impl/repos_impl.dart';
import 'package:trending_list/domain/repository/repos.dart';
import 'package:trending_list/domain/use_case/fetch_repositories/fetch_repositories_usecase.dart';
import 'package:trending_list/presentation/bloc/trendings_repository/trendings_repository_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => NetworkClient());

  sl.registerLazySingleton(() => sl<NetworkClient>().dio);

  sl.registerFactory(() => RemoteDataSources(dio: sl()));

  sl.registerFactory<Repos>(() => ReposImplementation(remoteDataSources: sl()));

  sl.registerFactory(() => FetchRepositoriesUseCase(repos: sl()));

  sl.registerFactory(() => TrendingsRepositoryBloc(sl()));
}
