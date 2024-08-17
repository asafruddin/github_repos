import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReposAtribute extends StatelessWidget {
  const ReposAtribute({
    super.key,
    required this.content,
    this.imgUrl,
  });

  final String content;
  final String? imgUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (imgUrl != null)
          SvgPicture.asset(
            imgUrl!,
            height: 18,
            width: 18,
          ),
        if (imgUrl == null)
          Text('●', style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(width: 5),
        Text(content, style: Theme.of(context).textTheme.labelSmall),
      ],
    );
  }
}
