import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/models.dart';
import '../screens/screens.dart';

class AppRouter {
  // Declares AppStateManager. GoRouter will listen to app state changes to
  // handle errors or redirects.
  final AppStateManager appStateManager;
  // Declares ProfileManager to get the user’s profile.
  final ProfileManager profileManager;
  // Declares GroceryManager to manage when the user creates or edits a grocery
  // item.
  final GroceryManager groceryManager;

  AppRouter(
    this.appStateManager,
    this.profileManager,
    this.groceryManager,
  );

  // Creates a variable that holds a GoRouter instance.
  late final router = GoRouter(
    // Enables debugging. This is especially useful to see what path your user
    // is going to and detect any problems with your routes.
    // TODO: remove the debugLogDiagnostics flag before you ship your app
    debugLogDiagnostics: true,
    // Sets your router to listen for app state changes. When the state
    // changes, your router will trigger a rebuild of your routes.
    refreshListenable: appStateManager,
    // Sets the initial location for routing.
    initialLocation: '/login',
    // Defines all the routes you use. You’ll add them later.
    routes: [
      GoRoute(
        // name names the route. If set, you must provide a unique string name;
        // this can’t be empty.
        name: 'login',
        // path is this route’s path.
        path: '/login',
        // builder is this route’s page builder. It’s responsible for building
        // your screen widget.
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: 'onboarding',
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        name: 'home',
        // Defines a path with the tab parameter. The notion is a colon
        // followed by the parameter name.
        path: '/:tab',
        builder: (context, state) {
          // Gets the tab’s value from the GoRouterState params and converts it
          // into an integer.
          final tab = int.tryParse(state.pathParameters['tab'] ?? '') ?? 0;
          // Passes the tab to the Home widget.
          return Home(
            key: state.pageKey,
            currentTab: tab,
          );
        },
        // Within GoRoute, you can have sub-routes. You’ll add to this later.
        routes: [
          GoRoute(
            name: 'item',
            // Defines a subroute item with id as a parameter.
            path: 'item/:id',
            builder: (context, state) {
              // Within the builder, it attempts to extract the itemId.
              final itemId = state.pathParameters['id'] ?? '';
              // Gets the GroceryItem object for the itemId.
              final item = groceryManager.getGroceryItem(itemId);
              // Returns the GroceryItemScreen and passes in the item. Note
              // that if the item is null, the user is creating a new item.
              return GroceryItemScreen(
                originalItem: item,
                onCreate: (item) {
                  // If the user creates a new item, it adds the new item to
                  // the grocery list.
                  groceryManager.addItem(item);
                },
                onUpdate: (item) {
                  // If the user updates an item, it updates the item in the
                  // grocery list.
                  groceryManager.updateItem(item);
                },
              );
            },
          ),
          GoRoute(
            name: 'profile',
            path: 'profile',
            builder: (context, state) {
              final tab = int.tryParse(state.pathParameters['tab'] ?? '') ?? 0;

              return ProfileScreen(
                user: profileManager.getUser,
                currentTab: tab,
              );
            },
            routes: [
              // TODO: Add Webview subroute
            ],
          ),
        ],
      ),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          body: Center(
            child: Text(
              state.error.toString(),
            ),
          ),
        ),
      );
    },
    redirect: (context, state) {
      // Checks to see if the user is logged in.
      final loggedIn = appStateManager.isLoggedIn;
      // Checks to see if the user is at the login location.
      final loggingIn = state.matchedLocation == '/login';
      // Redirects the user to log in if they haven’t yet.
      if (!loggedIn) return loggingIn ? null : '/login';
      // Since the user is already signed in, now you check to see if they’ve
      // completed the onboarding guide.
      final isOnboardingComplete = appStateManager.isOnboardingComplete;
      // Checks to see if the user is at the onboarding location.
      final onboarding = state.matchedLocation == '/onboarding';
      // Redirects the user to onboarding if they haven’t completed it yet.
      if (!isOnboardingComplete) {
        return onboarding ? null : '/onboarding';
      }
      // The user has signed in and completed onboarding. You redirect them to
      // the home page, specifically the explore tab. You’ll add the home route
      // in a bit.
      if (loggingIn || onboarding) return '/${FooderlichTab.explore}';
      // Returns null to stop redirecting.
      return null;
    },
  );
}
