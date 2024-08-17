import 'package:trending_list/data/datasources/remote_datasources.dart';
import 'package:trending_list/domain/entity/repository_entity.dart';
import 'package:trending_list/domain/repository/repos.dart';

class ReposImplementation implements Repos {
  final RemoteDataSources remoteDataSources;

  ReposImplementation({required this.remoteDataSources});

  @override
  Future<List<RepositoryEntity>> fetchRepositories(String organization) async {
    try {
      final result = await remoteDataSources.getRepositories(organization);
      return result.map((e) {
        return e.toEntity();
      }).toList();
    } catch (e) {
      rethrow;
    }
  }
}
