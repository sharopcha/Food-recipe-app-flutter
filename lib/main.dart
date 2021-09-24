import 'package:flutter/material.dart';
import 'navigation/app_router.dart';

import 'fooderlich_theme.dart';
import 'package:provider/provider.dart';
import 'models/models.dart';

void main() {
  runApp(
    const Fooderlich(),
  );
}

class Fooderlich extends StatefulWidget {
  const Fooderlich({Key key}) : super(key: key);

  @override
  _FooderlichState createState() => _FooderlichState();
}

class _FooderlichState extends State<Fooderlich> {
  final _groceryManager = GroceryManager();
  final _profileManager = ProfileManager();
  final _appStateManager = AppStateManager();

  AppRouter _appRouter;

  // Initialize app router
  @override
  void initState() {
    _appRouter = AppRouter(
        appStateManager: _appStateManager,
        groceryManager: _groceryManager,
        profileManager: _profileManager);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => _groceryManager,
        ),
        ChangeNotifierProvider(
          create: (context) => _profileManager,
        ),
        ChangeNotifierProvider(
          create: (context) => _appStateManager,
        )
      ],
      child: Consumer<ProfileManager>(
        builder: (context, profileManager, child) {
          ThemeData theme;
          if (profileManager.darkMode) {
            theme = FooderlichTheme.dark();
          } else {
            theme = FooderlichTheme.light();
          }

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            title: 'Fooderlich',
            home: Router(
              routerDelegate: _appRouter,
              //  add back button dispatcher
              backButtonDispatcher: RootBackButtonDispatcher(),
            ),
          );
        },
      ),
    );
  }
}
