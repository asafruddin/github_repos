part of 'trendings_repository_bloc.dart';

class TrendingsRepositoryEvent extends Equatable {
  const TrendingsRepositoryEvent();

  @override
  List<Object> get props => [];
}

class OnFetchReposEvent extends TrendingsRepositoryEvent {
  const OnFetchReposEvent();

  @override
  List<Object> get props => [];
}

class ToggleOpenDetailTailList extends TrendingsRepositoryEvent {
  final int index;

  const ToggleOpenDetailTailList({required this.index});

  @override
  List<Object> get props => [index];
}

class ToggleSortTypeEvent extends TrendingsRepositoryEvent {
  final SortType sortType;

  const ToggleSortTypeEvent({required this.sortType});

  @override
  List<Object> get props => [sortType];
}
