// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:trending_list/core/injector/injector.dart';
import 'package:trending_list/presentation/bloc/trendings_repository/trendings_repository_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trending_list/presentation/pages/error_page/error_page.dart';
import 'package:trending_list/presentation/pages/error_page/no_connection_page.dart';
import 'package:trending_list/presentation/pages/trendings/components/repos_tile.dart';

class TrendingsPage extends StatelessWidget {
  const TrendingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<TrendingsRepositoryBloc>()..add(const OnFetchReposEvent()),
      child: BlocListener<TrendingsRepositoryBloc, TrendingsRepositoryState>(
        listener: (context, state) {
          if (state.dioErrorType != null) {
            if (state.dioErrorType! == DioExceptionType.badResponse) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ErrorPage(message: state.errorMessage),
                ),
              ).then((value) {
                context
                    .read<TrendingsRepositoryBloc>()
                    .add(const OnFetchReposEvent());
              });
            }
            if (state.dioErrorType! == DioExceptionType.connectionError) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NoConnectionPage(),
                ),
              ).then((value) {
                context
                    .read<TrendingsRepositoryBloc>()
                    .add(const OnFetchReposEvent());
              });
            }
            return;
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Trendings'),
            actions: [
              BlocBuilder<TrendingsRepositoryBloc, TrendingsRepositoryState>(
                builder: (context, state) {
                  return PopupMenuButton(
                    color: Colors.white,
                    onSelected: (value) {
                      context
                          .read<TrendingsRepositoryBloc>()
                          .add(ToggleSortTypeEvent(sortType: value));
                    },
                    itemBuilder: (context) {
                      return [
                        const PopupMenuItem(
                          value: SortType.star,
                          child: Text('Sort by stars'),
                        ),
                        const PopupMenuItem(
                          value: SortType.name,
                          child: Text('Sort by name'),
                        ),
                      ];
                    },
                    child: const Icon(Icons.more_vert),
                  );
                },
              ),
            ],
          ),
          body: BlocBuilder<TrendingsRepositoryBloc, TrendingsRepositoryState>(
            builder: (context, state) {
              if (state.isFetching) {
                return const Center(child: CircularProgressIndicator());
              }

              return RefreshIndicator(
                onRefresh: () async => context
                    .read<TrendingsRepositoryBloc>()
                    .add(const OnFetchReposEvent()),
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final repo = state.trendingsRepos[index];

                    final isOpen = state.openDetailTile.contains(index);

                    return RepoTile(repo: repo, isOpen: isOpen, index: index);
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: state.trendingsRepos.length,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
