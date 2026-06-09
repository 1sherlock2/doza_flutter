import 'package:dio/dio.dart';
import 'package:doza_flutter/data/repositories/auth/auth_repository.dart';
import 'package:doza_flutter/data/repositories/auth/auth_repository_remote.dart';
import 'package:doza_flutter/data/services/api_client.dart';
import 'package:doza_flutter/data/services/auth_api_client.dart';
import 'package:doza_flutter/data/services/auth_interceptor.dart';
import 'package:doza_flutter/data/services/auth_state_notifier.dart';
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
    //  Provider<SubscriptionRepository>(
    //   create: (_) => SubscriptionRepositoryRemote(apiClient: apiClient),
    // ),
    // Provider<SupportRepository>(
    //   create: (_) => SupportRepositoryRemote(apiClient: apiClient),
    // ),
  ];
}
