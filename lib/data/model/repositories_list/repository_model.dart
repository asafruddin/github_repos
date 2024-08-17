import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trending_list/domain/entity/repository_entity.dart';

part 'repository_model.freezed.dart';
part 'repository_model.g.dart';

@freezed
class RepositoryModel with _$RepositoryModel {
  const RepositoryModel._();
  const factory RepositoryModel({
    int? id,
    String? nodeId,
    String? name,
    String? fullName,
    bool? private,
    Owner? owner,
    String? htmlUrl,
    String? description,
    bool? fork,
    String? url,
    String? forksUrl,
    String? keysUrl,
    String? collaboratorsUrl,
    String? teamsUrl,
    String? hooksUrl,
    String? issueEventsUrl,
    String? eventsUrl,
    String? assigneesUrl,
    String? branchesUrl,
    String? tagsUrl,
    String? blobsUrl,
    String? gitTagsUrl,
    String? gitRefsUrl,
    String? treesUrl,
    String? statusesUrl,
    String? languagesUrl,
    String? stargazersUrl,
    String? contributorsUrl,
    String? subscribersUrl,
    String? subscriptionUrl,
    String? commitsUrl,
    String? gitCommitsUrl,
    String? commentsUrl,
    String? issueCommentUrl,
    String? contentsUrl,
    String? compareUrl,
    String? mergesUrl,
    String? archiveUrl,
    String? downloadsUrl,
    String? issuesUrl,
    String? pullsUrl,
    String? milestonesUrl,
    String? notificationsUrl,
    String? labelsUrl,
    String? releasesUrl,
    String? deploymentsUrl,
    String? createdAt,
    String? updatedAt,
    String? pushedAt,
    String? gitUrl,
    String? sshUrl,
    String? cloneUrl,
    String? svnUrl,
    String? homepage,
    int? size,
    int? stargazersCount,
    int? watchersCount,
    String? language,
    bool? hasIssues,
    bool? hasProjects,
    bool? hasDownloads,
    bool? hasWiki,
    bool? hasPages,
    bool? hasDiscussions,
    int? forksCount,
    String? mirrorUrl,
    bool? archived,
    bool? disabled,
    int? openIssuesCount,
    License? license,
    bool? allowForking,
    bool? isTemplate,
    bool? webCommitSignoffRequired,
    List<String>? topics,
    String? visibility,
    int? forks,
    int? openIssues,
    int? watchers,
    String? defaultBranch,
    Permissions? permissions,
  }) = _RepositoryModel;

  factory RepositoryModel.fromJson(Map<String, dynamic> json) =>
      _$RepositoryModelFromJson(json);

  RepositoryEntity toEntity() {
    return RepositoryEntity(
      name: name ?? '',
      organizationName: owner?.login ?? '',
      fork: '${forksCount ?? 0}',
      languageTools: language ?? 'no language',
      stars: '${stargazersCount ?? 0}',
      descriptions: description ?? '',
      avatarUrl: owner?.avatarUrl ?? '',
      staredUrl: owner?.starredUrl ?? '',
      forkUrl: forksUrl ?? '',
    );
  }
}

@freezed
class Owner with _$Owner {
  const Owner._();
  const factory Owner({
    String? login,
    int? id,
    String? nodeId,
    String? avatarUrl,
    String? gravatarId,
    String? url,
    String? htmlUrl,
    String? followersUrl,
    String? followingUrl,
    String? gistsUrl,
    String? starredUrl,
    String? subscriptionsUrl,
    String? organizationsUrl,
    String? reposUrl,
    String? eventsUrl,
    String? receivedEventsUrl,
    String? type,
    bool? siteAdmin,
  }) = _Owner;

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
}

@freezed
class License with _$License {
  const License._();
  const factory License({
    String? key,
    String? name,
    String? spdxId,
    String? url,
    String? nodeId,
  }) = _License;

  factory License.fromJson(Map<String, dynamic> json) =>
      _$LicenseFromJson(json);
}

@freezed
class Permissions with _$Permissions {
  const Permissions._();
  const factory Permissions({
    bool? admin,
    bool? maintain,
    bool? push,
    bool? triage,
    bool? pull,
  }) = _Permissions;

  factory Permissions.fromJson(Map<String, dynamic> json) =>
      _$PermissionsFromJson(json);
}
