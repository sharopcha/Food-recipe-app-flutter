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
    //  add listeners
    appStateManager.addListener(notifyListeners);
    groceryManager.addListener(notifyListeners);
    profileManager.addListener(notifyListeners);
  }

  // dispose listeners
  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    groceryManager.removeListener(notifyListeners);
    profileManager.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
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

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }

    // TODO: handle onboarding and splash
    // TODO: handle state whenuser closes grocery item screen
    // TODO: handle state when user closes profile screen
    // TODO: handle state when user closes WebView screen

    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) async => null;
}
