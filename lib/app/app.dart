import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:trending_list/presentation/pages/no_connection/no_connection_page.dart';
import 'package:trending_list/presentation/pages/trendings/trendings_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final connectivity = ValueNotifier<List<ConnectivityResult>?>(null);

  @override
  void initState() {
    super.initState();

    Connectivity().onConnectivityChanged.listen((event) {
      connectivity.value = event;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ValueListenableBuilder<List<ConnectivityResult>?>(
          valueListenable: connectivity,
          builder: (context, value, child) {
            if (value != null && value.contains(ConnectivityResult.none)) {
              return const NoConnectionPage();
            }

            return const TrendingsPage();
          }),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
