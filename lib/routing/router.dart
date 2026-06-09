import 'package:doza_flutter/data/repositories/auth/auth_repository.dart';
import 'package:doza_flutter/data/repositories/subscription/subscription_repository.dart';
import 'package:doza_flutter/data/services/auth_api_client.dart';
import 'package:doza_flutter/data/services/auth_state_notifier.dart';
import 'package:doza_flutter/data/services/call_state_service.dart';
import 'package:doza_flutter/routing/routes.dart';
import 'package:doza_flutter/ui/auth/auth_screen.dart';
import 'package:doza_flutter/ui/auth/view_models/auth_view_models.dart';
import 'package:doza_flutter/ui/core/widgets/navigation_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

Future<GoRouter> router(
  AuthApiClient authApiClient,
  AuthStateNotifier authStateNotifier,
) async => GoRouter(
  initialLocation: Routes.home,
  debugLogDiagnostics: true,
  redirect: await _redirect(authApiClient, authStateNotifier),
  refreshListenable: Listenable.merge([authStateNotifier]),
  onException: (context, state, router) {
    if (state.uri.scheme == 'dozaapp') {
      router.go(Routes.home);
    }
  },
  routes: [
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        List<String> excludePaths = [Routes.auth];
        if (state.fullPath != null) {
          bool isAuthPath = excludePaths.any(
            (excludePath) => state.fullPath!.startsWith(excludePath),
          );

          if (!isAuthPath) {
            return NavigationBottom(child: child);
          }
          return SafeArea(bottom: false, top: false, child: child);
        }
        return SafeArea(bottom: false, top: false, child: child);
      },
      routes: [
        GoRoute(
          path: Routes.auth,
          builder: (context, state) {
            final callStateService = CallStateService();
            final viewModel = AuthViewModel(
              authRepository: context.read<AuthRepository>(),
              callStateService: callStateService,
              authStateNotifier: context.read<AuthStateNotifier>(),
            );
            return AuthScreen(authViewModel: viewModel);
          },
        ),
        // GoRoute(
        //   path: Routes.home,
        //   builder: (context, state) {
        //     final viewModel = CatalogViewModel(
        //       catalogRepository: context.read(),
        //     );
        //     return CatalogScreen(viewModel: viewModel);
        //   },
        // ),
        // GoRoute(
        //   path: Routes.profile,
        //   builder: (context, state) {
        //     final viewModel = ProfileViewModel(
        //       subscriptionRepository: context.read<SubscriptionRepository>(),
        //       authStateNotifier: context.read<AuthStateNotifier>(),
        //     );
        //     return ProfileScreen(viewModel: viewModel);
        //   },
        // ),
      ],
    ),
  ],
);

Future<Future<String?> Function(BuildContext context, GoRouterState state)>
_redirect(
  AuthApiClient authApiClient,
  AuthStateNotifier authStateNotifier,
) async {
  return (BuildContext context, GoRouterState state) async {
    final FlutterSecureStorage storage = .new();
    final Logger log = Logger('router');

    if (authStateNotifier.isLogged) {
      // Подписка только что активирована — перенаправить на home
      if (authStateNotifier.consumeHomeRedirect()) {
        return Routes.home;
      }
      // Новый пользователь — показать экран выбора подписки,
      // но если у него уже есть активная платная подписка — сразу на home
      if (authStateNotifier.isNewUserRegistration) {
        final subscriptionRepo = context.read<SubscriptionRepository>();
        final result = await subscriptionRepo.getStatus();

        // Страховочная проверка: если у нового пользователя уже есть
        // платная подписка (нестандартный случай) — не показываем экран выбора
        final hasActiveSubscription = result.fold(
          (status) => status.hasActiveSubscription,
          (_) => false,
        );
        if (hasActiveSubscription) {
          authStateNotifier.clearNewUserRegistration();
          return Routes.home;
        }

        // Новый пользователь без платной подписки → экран выбора
        // (пробный период уже выдан автоматически сервером)
        if (state.matchedLocation == Routes.subscriptionSelect) return null;
        return Routes.subscriptionSelect;
      }
      // 402 — подписка требуется, перенаправить на экран подписки
      if (authStateNotifier.isSubscriptionRequired) {
        if (state.matchedLocation == Routes.subscription) return null;
        return Routes.subscription;
      }
      // Возвращающийся пользователь только что прошёл аутентификацию:
      // проверяем статус подписки/триала и направляем соответственно
      if (state.matchedLocation == Routes.auth) {
        final subscriptionRepo = context.read<SubscriptionRepository>();
        final result = await subscriptionRepo.getStatus();
        final hasAccess = result.fold(
          (status) => status.hasActiveSubscription || status.isTrialActive,
          (_) => true, // при ошибке сети не блокируем пользователя
        );
        if (!hasAccess) {
          return Routes.subscription; // триал истёк и нет платной подписки
        }
        return Routes.home;
      }
      // Иначе — не мешать навигации
      return null;
    } else {
      // Не залогинен: не трогать /auth и /phoneError, всё остальное → /auth
      final isPublicRoute = state.matchedLocation == Routes.auth;
      return isPublicRoute ? null : Routes.auth;
    }
  };
}
