import 'package:flutter/material.dart';
import '../screens/screens.dart';
import '../models/models.dart';

class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  GlobalKey<NavigatorState> navigatorKey;

  final AppStateManager appStateManager;
  final GroceryManager groceryManager;
  final ProfileManager profileManager;

  AppRouter({this.appStateManager, this.groceryManager, this.profileManager})
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
        // splash screen page
        if (!appStateManager.isInitialized) SplashScreen.page(),
        // login screen
        if (appStateManager.isInitialized && !appStateManager.isLoggedIn)
          LoginScreen.page(),
        // onboarding screen
        if (appStateManager.isLoggedIn && !appStateManager.isOnboardingComplete)
          OnboardingScreen.page(),
        // home screen
        if (appStateManager.isOnboardingComplete)
          Home.page(appStateManager.getSelectedTab),
        // create new item screen
        if (groceryManager.isCreatingNewItem)
          GroceryItemScreen.page(
            onCreate: (item) {
              groceryManager.addItem(item);
            },
          ),
        // select grocery item screen
        if (groceryManager.selectedIndex != null)
          GroceryItemScreen.page(
              item: groceryManager.selectedGroceryItem,
              index: groceryManager.selectedIndex,
              onUpdate: (item, index) {
                groceryManager.updateItem(item, index);
              }),
        // profile screen
        if (profileManager.didSelectUser)
          ProfileScreen.page(profileManager.getUser),
        // web view screen
        if (profileManager.didTapOnRaywenderlich) WebViewScreen.page()
      ],
    );
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }

    // handle onboarding and splash
    if (route.settings.name == FooderlichPages.onboardingPath) {
      appStateManager.logout();
    }
    // handle state whenuser closes grocery item screen
    if (route.settings.name == FooderlichPages.groceryItemDetails) {
      groceryManager.groceryItemTapped(null);
    }
    // handle state when user closes profile screen
    if (route.settings.name == FooderlichPages.profilePath) {
      profileManager.tapOnProfile(false);
    }
    // handle state when user closes WebView screen
    if (route.settings.name == FooderlichPages.raywenderlich) {
      profileManager.tapOnRaywenderlich(false);
    }

    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) async => null;
}
