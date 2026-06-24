import 'package:doza_flutter/data/repositories/auth/auth_repository.dart';
import 'package:doza_flutter/data/repositories/categories/categories_repository.dart';
import 'package:doza_flutter/data/repositories/favorites/favorites_repository.dart';
import 'package:doza_flutter/data/repositories/products/products_repository.dart';
import 'package:doza_flutter/data/repositories/subscription/subscription_repository.dart';
import 'package:doza_flutter/data/services/auth_api_client.dart';
import 'package:doza_flutter/data/services/auth_state_notifier.dart';
import 'package:doza_flutter/data/services/call_state_service.dart';
import 'package:doza_flutter/routing/routes.dart';
import 'package:doza_flutter/ui/core/widgets/navigation_bottom.dart';
import 'package:doza_flutter/ui/screens/auth/auth_screen.dart';
import 'package:doza_flutter/ui/screens/auth/view_models/auth_view_models.dart';
import 'package:doza_flutter/ui/screens/catalog/catalog_screen.dart';
import 'package:doza_flutter/ui/screens/catalog/view_models/catalog_view_model.dart';
import 'package:doza_flutter/ui/screens/favorites/favorites_screen.dart';
import 'package:doza_flutter/ui/screens/favorites/view_models/favorites_view_model.dart';
import 'package:doza_flutter/ui/screens/subscription/subscription_select_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

GoRouter router(
  AuthApiClient authApiClient,
  AuthStateNotifier authStateNotifier,
) =>
    GoRouter(
      initialLocation: Routes.home,
      debugLogDiagnostics: true,
      redirect: _redirect(authApiClient, authStateNotifier),
      refreshListenable: Listenable.merge([authStateNotifier]),
      onException: (context, state, router) {
        if (state.uri.scheme == 'dozaapp') {
          router.go(Routes.home);
        }
      },
      routes: [
        ShellRoute(
          builder: (BuildContext context, GoRouterState state, Widget child) {
            List<String> excludePaths = [
              Routes.auth,
              Routes.subscriptionSelect
            ];
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
            GoRoute(
              path: Routes.subscriptionSelect,
              builder: (context, state) => SubscriptionSelectScreen(
                authStateNotifier: context.read<AuthStateNotifier>(),
              ),
            ),
            GoRoute(
              path: Routes.home,
              builder: (context, state) {
                final catalogViewModel = CatalogViewModel(
                    categoriesRepository: context.read<CategoriesRepository>(),
                    productsRepository: context.read<ProductsRepository>());
                return CatalogScreen(catalogViewModel: catalogViewModel);
              },
            ),
            GoRoute(
              path: Routes.favorites,
              builder: (context, state) {
                final favoritesViewModel = FavoritesViewModel(
                    favoritesRepository: context.read<FavoritesRepository>());
                return FavoritesScreen(favoritesViewModel: favoritesViewModel);
              },
            ),
            GoRoute(
                path: Routes.productId,
                builder: ((context, state) {
                  final id = state.pathParameters['id'];
                  final viewModel = ProductDetailsViewModel(
                      productRepository: context.read<ProductsRepository>(), productId: id);
                  return ProductDetailsScreen(productDetailViewModel: viewModel)
                }))

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

typedef GoRouterRedirect = Future<String?> Function(
  BuildContext context,
  GoRouterState state,
);

GoRouterRedirect _redirect(
  AuthApiClient authApiClient,
  AuthStateNotifier authStateNotifier,
) {
  return (BuildContext context, GoRouterState state) async {
    final Logger log = Logger('router');

    try {
      if (authStateNotifier.isLogged) {
        // Подписка только что активирована — перенаправить на home
        if (authStateNotifier.consumeHomeRedirect()) {
          log.fine('redirect: homeRedirect → /');
          return Routes.home;
        }
        // Новый пользователь — показать экран выбора подписки,
        // но если у него уже есть активная платная подписка — сразу на home
        if (authStateNotifier.isNewUserRegistration) {
          final subscriptionRepo = context.read<SubscriptionRepository>();
          final result = await subscriptionRepo.getStatus();

          final hasActiveSubscription = result.fold(
            (status) => status.hasActiveSubscription,
            (_) => false,
          );
          if (hasActiveSubscription) {
            authStateNotifier.clearNewUserRegistration();
            log.fine('redirect: newUser+hasActiveSubscription → /');
            return Routes.home;
          }

          if (state.matchedLocation == Routes.subscriptionSelect) return null;
          log.fine('redirect: newUser → /subscription_select');
          return Routes.subscriptionSelect;
        }

        return null;
      } else {
        final isPublicRoute = state.matchedLocation == Routes.auth;
        if (!isPublicRoute) {
          log.fine('redirect: notLogged → /auth');
        }
        return isPublicRoute ? null : Routes.auth;
      }
    } catch (e, stack) {
      log.severe('redirect error: $e\n$stack');
      return null; // при ошибке редиректа не блокируем навигацию
    }
  };
}
