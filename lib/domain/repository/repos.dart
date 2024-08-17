import 'package:trending_list/domain/entity/repository_entity.dart';

abstract class Repos {
  Future<List<RepositoryEntity>> fetchRepositories(String organization);
}
