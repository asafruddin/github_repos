part of 'trendings_repository_bloc.dart';

class TrendingsRepositoryState extends Equatable {
  final List<RepositoryEntity> trendingsRepos;
  final List<int> openDetailTile;
  final SortType? sortType;
  final bool isFetching;
  final DioExceptionType? dioErrorType;

  const TrendingsRepositoryState({
    required this.trendingsRepos,
    required this.openDetailTile,
    required this.sortType,
    this.isFetching = false,
    this.dioErrorType,
  });

  factory TrendingsRepositoryState.initial() {
    return const TrendingsRepositoryState(
      trendingsRepos: [],
      openDetailTile: [],
      sortType: null,
    );
  }

  TrendingsRepositoryState copyWith({
    List<RepositoryEntity>? trendingsRepos,
    List<int>? openDetailTile,
    SortType? sortType,
    bool? isFetching,
    DioExceptionType? dioErrorType,
  }) {
    return TrendingsRepositoryState(
      trendingsRepos: trendingsRepos ?? this.trendingsRepos,
      openDetailTile: openDetailTile ?? this.openDetailTile,
      sortType: sortType ?? this.sortType,
      isFetching: isFetching ?? this.isFetching,
      dioErrorType: dioErrorType,
    );
  }

  @override
  List<Object?> get props =>
      [trendingsRepos, openDetailTile, sortType, isFetching, dioErrorType];
}

enum SortType { star, name }
