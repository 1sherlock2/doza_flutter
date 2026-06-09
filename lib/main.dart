import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:doza_flutter/data/services/auth_api_client.dart';
import 'package:doza_flutter/data/services/auth_state_notifier.dart';
import 'package:doza_flutter/routing/router.dart';
import 'package:doza_flutter/routing/routes.dart';
import 'package:doza_flutter/ui/core/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

void main() async {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    // ignore: avoid_print
    print(
      '${record.level.name}: ${record.time}: ${record.loggerName}: ${record.message}',
    );
  });
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  // Регистрация глобального обработчика исключений для flutter_command
  Command.globalExceptionHandler = (context, error) {
    Logger('Command').severe('Command error: $error');
  };

  WidgetsFlutterBinding.ensureInitialized();
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late final Future<GoRouter> _routerFuture;
  GoRouter? _router;
  StreamSubscription<Uri>? _deepLinkSub;

  @override
  void initState() {
    super.initState();
    _routerFuture =
        router(
          context.read<AuthApiClient>(),
          context.read<AuthStateNotifier>(),
        ).then((r) {
          _router = r;
          return r;
        });

    _deepLinkSub = AppLinks().uriLinkStream.listen((uri) {
      if (uri.scheme == 'trackingapp') {
        _router?.go(Routes.subscription);
      }
    });
  }

  @override
  void dispose() {
    _deepLinkSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _routerFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MaterialApp.router(
            routerConfig: snapshot.data,
            themeMode: ThemeMode.system,
            theme: AppTheme.lightTheme,
          );
        }
        return const MaterialApp(
          home: Scaffold(body: Center(child: CircularProgressIndicator())),
        );
      },
    );
  }
}
