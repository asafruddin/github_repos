import 'package:trending_list/domain/entity/repository_entity.dart';
import 'package:trending_list/domain/repository/repos.dart';

class FetchRepositoriesUseCase {
  final Repos repos;

  FetchRepositoriesUseCase({required this.repos});

  Future<List<RepositoryEntity>> call(String organization) async {
    return await repos.fetchRepositories(organization);
  }
}
