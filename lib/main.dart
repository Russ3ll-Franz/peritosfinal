import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:peritosapp/app/widget/app.dart';

void main() => {
      WidgetsFlutterBinding.ensureInitialized(),
      runApp(ProviderScope(child: App()))
    };

/* final myprovider = Provider((ref) => 'ADASD');
/*  */
class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      routerDelegate: AutoRouterDelegate(
        _appRouter,
        navigatorObservers: () => [AppRouteObserver()],
      ),
      routeInformationProvider: _appRouter.routeInfoProvider(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
} */

/* class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Allemant'),
        ),
        body: Center(
          child: Container(
            child: Text(ref.read<String>(myprovider)),
          ),
        ),
      ),
    );
  }
}
 */
/*
Future<void> main() async {
  runApp(
    ProviderScope(
      overrides: [],
      observers: [],
      child: App(),
    ),
  );
}
 */
