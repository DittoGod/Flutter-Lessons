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
      // TODO: Add Login Route
      // TODO: Add Onboarding Route
      // TODO: Add Home Route
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

    // TODO: Add Redirect Handler
  );
}
