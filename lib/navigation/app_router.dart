import 'package:flutter/material.dart';
import 'package:fooderlich/models/models.dart';

class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  GlobalKey<NavigatorState> navigatorKey;

  final AppStateManager appStateManager;
  final GroceryManager groceryManager;
  final ProfileManager profileManager;

  AppRouter(this.appStateManager, this.groceryManager, this.profileManager)
      : navigatorKey = GlobalKey<NavigatorState>() {
    // TODO: add listeners
  }

  // TODO: dispose listeners

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      // TODO: add onPopPage
      pages: [
        // TODO: splash screen page
        // TODO: login screen
        // TODO: onboarding screen
        // TODO: home screen
        // TODO: create new item screen
        // TODO: select grocery item screen
        // TODO: profile screen
        // TODO: web view screen
      ],
    );
  }

  // TODO: _handlePopPage

  @override
  Future<void> setNewRoutePath(configuration) async => null;
}
