import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:trending_list/domain/entity/repository_entity.dart';
import 'package:trending_list/domain/use_case/fetch_repositories/fetch_repositories_usecase.dart';

part 'trendings_repository_event.dart';
part 'trendings_repository_state.dart';

class TrendingsRepositoryBloc
    extends Bloc<TrendingsRepositoryEvent, TrendingsRepositoryState> {
  final FetchRepositoriesUseCase fetchRepositoriesUseCase;

  TrendingsRepositoryBloc(this.fetchRepositoriesUseCase)
      : super(TrendingsRepositoryState.initial()) {
    on<OnFetchReposEvent>((event, emit) async {
      emit(state.copyWith(isFetching: true));
      try {
        final res = await fetchRepositoriesUseCase.call("octokit");
        emit(state.copyWith(trendingsRepos: res, isFetching: false));
      } on DioException catch (e) {
        emit(state.copyWith(dioErrorType: e.type, isFetching: false));
      } catch (e) {
        log('ERROR: $e');
        emit(state.copyWith(trendingsRepos: [], isFetching: false));
      }
    });

    on<ToggleOpenDetailTailList>((event, emit) {
      final index = event.index;
      final openDetailTile = [...state.openDetailTile];
      if (openDetailTile.contains(index)) {
        openDetailTile.remove(index);
      } else {
        openDetailTile.add(index);
      }
      emit(state.copyWith(openDetailTile: openDetailTile));
    });

    on<ToggleSortTypeEvent>((event, emit) {
      final repos = state.trendingsRepos;

      if (event.sortType == SortType.star) {
        repos.sort((a, b) => int.parse(b.stars).compareTo(int.parse(a.stars)));
      } else {
        repos.sort((a, b) => a.name.compareTo(b.name));
      }

      emit(state.copyWith(sortType: event.sortType, trendingsRepos: repos));
    });
  }
}
