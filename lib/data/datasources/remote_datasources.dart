import 'package:dio/dio.dart';
import 'package:trending_list/data/model/repositories_list/repository_model.dart';

class RemoteDataSources {
  final Dio dio;

  RemoteDataSources({required this.dio});

  Future<List<RepositoryModel>> getRepositories(String organization) async {
    try {
      final response = await dio.get('/orgs/$organization/repos');
      return response.data
          .map<RepositoryModel>((json) => RepositoryModel.fromJson(json))
          .toList();
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
