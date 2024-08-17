import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NoConnectionPage extends StatelessWidget {
  const NoConnectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/search_signal.svg',
              height: 200,
            ),
            const SizedBox(height: 20),
            Text('No Internet Connection',
                style: Theme.of(context).textTheme.headlineMedium),
            Text('Your phone still looking for connection',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
