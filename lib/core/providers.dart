import 'package:dio/dio.dart';
import 'package:doza_flutter/data/repositories/auth/auth_repository.dart';
import 'package:doza_flutter/data/repositories/auth/auth_repository_remote.dart';
import 'package:doza_flutter/data/repositories/cart/cart_repository.dart';
import 'package:doza_flutter/data/repositories/cart/cart_repository_remote.dart';
import 'package:doza_flutter/data/repositories/categories/categories_repository.dart';
import 'package:doza_flutter/data/repositories/categories/categories_repository.remote.dart';
import 'package:doza_flutter/data/repositories/favorites/favorites_repository.dart';
import 'package:doza_flutter/data/repositories/favorites/favorites_repository_remote.dart';
import 'package:doza_flutter/data/repositories/payment_method/payment_method_repository.dart';
import 'package:doza_flutter/data/repositories/payment_method/payment_method_repository_remote.dart';
import 'package:doza_flutter/data/repositories/product_details/product_details_repository.dart';
import 'package:doza_flutter/data/repositories/product_details/product_details_repository_remote.dart';
import 'package:doza_flutter/data/repositories/products/products_repository.dart';
import 'package:doza_flutter/data/repositories/products/products_repository_remote.dart';
import 'package:doza_flutter/data/repositories/subscription/subscription_repository.dart';
import 'package:doza_flutter/data/repositories/subscription/subscription_repository_remote.dart';
import 'package:doza_flutter/data/repositories/user_info/user_info_repository.dart';
import 'package:doza_flutter/data/repositories/user_info/user_info_repository_remote.dart';
import 'package:doza_flutter/data/services/api_client.dart';
import 'package:doza_flutter/data/services/auth_api_client.dart';
import 'package:doza_flutter/data/services/auth_interceptor.dart';
import 'package:doza_flutter/data/services/auth_state_notifier.dart';
import 'package:doza_flutter/data/services/subscription_state_notifier.dart';
import 'package:doza_flutter/ui/payment_method_section/payment_method_section_view_model.dart';
import 'package:doza_flutter/ui/screens/subscription/view_models/subscription_view_model.dart';
import 'package:doza_flutter/ui/view_models/cart_state_notifier.dart';
import 'package:doza_flutter/ui/view_models/catalog_view_model.dart';
import 'package:doza_flutter/ui/view_models/general_favorites_view_model.dart';
import 'package:doza_flutter/ui/view_models/user_info_view_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

Future<List<SingleChildWidget>> get providers async {
  final dio = Dio();
  final storage = FlutterSecureStorage();
  final authStateNotifier = AuthStateNotifier();
  await authStateNotifier.initialize();
  final apiClient = ApiClient(dio);
  final authApiClient = AuthApiClient();
  dio.interceptors.add(
    AuthInterceptor(authApiClient, storage, authStateNotifier),
  );

  return [
    Provider<Dio>.value(value: dio),
    Provider<ApiClient>.value(value: apiClient),
    Provider<AuthApiClient>.value(value: authApiClient),
    ChangeNotifierProvider<AuthStateNotifier>.value(value: authStateNotifier),
    Provider<AuthRepository>(
      create: (context) => AuthRepositoryRemote(authApiClient: authApiClient),
    ),
    Provider<SubscriptionRepository>(
      create: (_) => SubscriptionRepositoryRemote(apiClient: apiClient),
    ),
    Provider<CategoriesRepository>(
      create: (_) => CategoriesRepositoriesRemote(apiClient: apiClient),
    ),
    Provider<ProductsRepository>(
        create: (_) => ProductsRepositoryRemote(apiClient: apiClient)),
    Provider<FavoritesRepository>(
        create: (_) => FavoritesRepositoryRemote(apiClient: apiClient)),
    Provider<ProductDetailsRepository>(
        create: (_) => ProductDetailsRepositoryRemote(apiClient: apiClient)),
    Provider<CartRepository>(
        create: (_) => CartRepositoryRemote(apiClient: apiClient)),
    Provider<UserInfoRepository>(
        create: (_) => UserInfoRepositoryRemote(apiClient: apiClient)),
    Provider<PaymentMethodRepository>(
        create: (_) => PaymentMethodRepositoryRemote(apiClient: apiClient)),
    ChangeNotifierProvider<SubscriptionStateNotifier>(
        create: (context) =>
            SubscriptionStateNotifier(context.read<SubscriptionRepository>())),
    ChangeNotifierProvider(
        create: (context) => UserInfoViewModel(
            userInfoRepository: context.read<UserInfoRepository>(),
            subscriptionStateNotifier:
                context.read<SubscriptionStateNotifier>())),
    ChangeNotifierProvider(
        create: (context) =>
            CartStateNotifier(cartRepository: context.read<CartRepository>())),
    ChangeNotifierProvider(
        create: (context) => GeneralFavoritesViewModel(
            favoritesRepository: context.read<FavoritesRepository>())),
    ChangeNotifierProvider<SubscriptionViewModel>(
        create: (context) => SubscriptionViewModel(
            subscriptionRepository: context.read<SubscriptionRepository>(),
            authStateNotifier: context.read<AuthStateNotifier>())),
    ChangeNotifierProvider<CatalogViewModel>(
        create: (context) => CatalogViewModel(
            categoriesRepository: context.read<CategoriesRepository>(),
            productsRepository: context.read<ProductsRepository>())),
    ChangeNotifierProvider<PaymentMethodSectionViewModel>(
        create: (context) => PaymentMethodSectionViewModel(
            paymentMethodRepository: context.read<PaymentMethodRepository>())),
    // ChangeNotifierProvider(create: (context) => ProfileViewModel( userInfoRepository: context.read<UserInfoRepository>(),
    //                     subscriptionRepository:
    //                         context.read<SubscriptionRepository>(),
    //                     cartRepository: context.read<CartRepository>()))
  ];
}
