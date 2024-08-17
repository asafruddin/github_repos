import 'package:freezed_annotation/freezed_annotation.dart';

part "repository_entity.freezed.dart";

@freezed
class RepositoryEntity with _$RepositoryEntity {
  const RepositoryEntity._();
  const factory RepositoryEntity({
    required String name,
    required String organizationName,
    required String fork,
    required String languageTools,
    required String stars,
    required String descriptions,
    required String avatarUrl,
    required String staredUrl,
    required String forkUrl,
  }) = _RepositoryEntity;

  factory RepositoryEntity.empty() {
    return const RepositoryEntity(
      name: '',
      organizationName: '',
      fork: '0',
      languageTools: '',
      stars: '0',
      descriptions: '',
      avatarUrl: '',
      staredUrl: '',
      forkUrl: '',
    );
  }
}
