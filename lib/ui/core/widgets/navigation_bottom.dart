import 'package:doza_flutter/routing/routes.dart';
import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class NavigationBottom extends StatefulWidget {
  const NavigationBottom({super.key, required this.child});
  final Widget child;

  @override
  State<NavigationBottom> createState() => _NavigationBottomState();
}

class _NavigationBottomState extends State<NavigationBottom> {
  int _getSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    switch (location) {
      case Routes.home:
        return 0;
      case Routes.map:
        return 1;
      case Routes.profile:
        return 2;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
          height: 70,
          onDestinationSelected: (int index) {
            switch (index) {
              case 0:
                context.go(Routes.home);
                break;
              case 1:
                context.go(Routes.map);
                break;
              case 2:
                context.go(Routes.profile);
              case 3:
                context.go(Routes.basket);
                break;
            }
          },
          backgroundColor: AppColors.white2,
          indicatorColor: AppColors.green2,
          selectedIndex: _getSelectedIndex(context),
          destinations: const [
            NavigationDestination(
              enabled: true,
              icon: Icon(Icons.list_outlined),
              label: 'Каталог',
            ),
            NavigationDestination(
              enabled: true,
              icon: Icon(Icons.heat_pump_rounded),
              label: 'Избранное',
            ),
            NavigationDestination(
              icon: Icon(Icons.shopping_basket),
              label: 'Корзина',
            ),
            NavigationDestination(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Профиль',
            ),
          ],
        ),

        body: widget.child,
      ),
    );
  }
}
