import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trending_list/domain/entity/repository_entity.dart';
import 'package:trending_list/presentation/bloc/trendings_repository/trendings_repository_bloc.dart';
import 'package:trending_list/presentation/pages/trendings/components/repos_attribute.dart';

class RepoTile extends StatelessWidget {
  const RepoTile({
    super.key,
    required this.repo,
    required this.isOpen,
    required this.index,
  });

  final RepositoryEntity repo;
  final bool isOpen;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context
          .read<TrendingsRepositoryBloc>()
          .add(ToggleOpenDetailTailList(index: index)),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: repo.avatarUrl,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) =>
                    SvgPicture.asset('assets/image_failed.svg'),
                placeholder: (context, url) =>
                    SvgPicture.asset('assets/image_failed.svg'),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(repo.organizationName,
                        style: Theme.of(context).textTheme.bodySmall),
                    const SizedBox(height: 2),
                    Text(repo.name,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.w600)),
                    if (isOpen) const SizedBox(height: 5),
                    if (isOpen)
                      Text(repo.descriptions,
                          style: Theme.of(context).textTheme.bodySmall),
                    if (isOpen) const SizedBox(height: 5),
                    if (isOpen)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ReposAtribute(content: repo.languageTools),
                          const SizedBox(width: 10),
                          ReposAtribute(
                              content: repo.stars, imgUrl: 'assets/star.svg'),
                          const SizedBox(width: 10),
                          ReposAtribute(
                              content: repo.fork, imgUrl: 'assets/fork.svg'),
                        ],
                      )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
