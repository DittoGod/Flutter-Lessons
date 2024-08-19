import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy/constants.dart';
import 'package:yummy/home.dart';
import 'package:yummy/models/models.dart';
import 'package:yummy/screens/screens.dart';

void main() {
  runApp(const Yummy());
}

/// Allows the ability to scroll by dragging with touch, mouse, and trackpad.
class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad
      };
}

class Yummy extends StatefulWidget {
  const Yummy({super.key});

  @override
  State<Yummy> createState() => _YummyState();
}

class _YummyState extends State<Yummy> {
  ThemeMode themeMode = ThemeMode.light;
  ColorSelection colorSelected = ColorSelection.pink;

  /// Authentication to manage user login session
  // ignore: unused_field
  final YummyAuth _auth = YummyAuth();

  /// Manage user's shopping cart for the items they order.
  final CartManager _cartManager = CartManager();

  /// Manage user's orders submitted
  final OrderManager _orderManager = OrderManager();

  // Initialises an instance of GoRouter, a declarative router for Flutter.
  late final _router = GoRouter(
      // Sets the initialLocation that the app will navigate to. When the user
      // opens the app they will navigate to the login page.
      initialLocation: '/login',
      redirect: _appRedirect,
      // routes contains a list of possible routes for the application. Each route
      // will typically be defined with a path, builder or redirect function.
      routes: [
        GoRoute(
          // The route is set to /login. When the URL or path matches /login go
          // to the login route.
          path: '/login',
          // The builder() function creates the widget to display when the user
          // hits a route.
          builder: (context, state) =>
              // The function returns a login widget.
              LoginPage(
            // The Login widget takes a callback called onLogIn which returns
            // the user credentials.
            onLogIn: (Credentials credentials) async {
              // Use the credentials to login.
              _auth
                  .signIn(credentials.username, credentials.password)
                  // If the login is successful, navigate to the path /0,
                  // which is the first tab.
                  .then((_) => context.go('/${YummyTab.home.value}'));
            },
          ),
        ),
        // The route is set to /. When the URL or path matches / go to the home
        // route. :tab is a path parameter used to switch between different tabs.
        GoRoute(
          path: '/:tab',
          builder: (context, state) {
            // The builder function returns a Home widget.
            return Home(
              // Pass auth for handling authentication.
              auth: _auth,
              // Use cartManager to manage the items that the user has added to
              // the cart.
              cartManager: _cartManager,
              // Use ordersManager to manage all the orders submitted.
              ordersManager: _orderManager,
              // Set a callback to handle user changes from light to dark mode.
              changeTheme: changeThemeMode,
              // Set a callback to handle user app colour theme changes.
              changeColor: changeColor,
              // Pass the currently selected colour theme.
              colorSelected: colorSelected,
              // Set the current tab, default to 0 if the path parameter is
              // absent or not an integer.
              tab: int.tryParse(state.pathParameters['tab'] ?? '') ?? 0,
            );
          },
          //
          routes: [
            // TODO: Add Restaurant Route.
          ],
        ),
      ],
      errorPageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: Scaffold(
            body: Center(
              child: Text(state.error.toString()),
            ),
          ),
        );
      });

  // _appRedirect() is an asynchronous function that returns a future, optional
  // string. It takes in a build context and the go router state.
  Future<String?> _appRedirect(
      BuildContext context, GoRouterState state) async {
    // Get the login status.
    final loggedIn = await _auth.loggedIn;
    // Check if the user is currently on the login page.
    final isOnLoginPage = state.matchedLocation == '/login';

    // If the user is not logged in yet, redirect to the login page.
    // Go to /login if the user is not signed in.
    if(!loggedIn) {
      return '/login';
    }
    // If the user s logged in and is on the login page, redirect to the home
    // page.
    // Go to root if the user is already signed in.
    else if (loggedIn && isOnLoginPage) {
      return '/${YummyTab.home.value}';
    }

    // Don't redirect if no condition is met.
    // no redirect
    return null;
  }

  void changeThemeMode(bool useLightMode) {
    setState(() {
      themeMode = useLightMode
          ? ThemeMode.light //
          : ThemeMode.dark;
    });
  }

  void changeColor(int value) {
    setState(() {
      colorSelected = ColorSelection.values[value];
    });
  }

  @override
  Widget build(BuildContext context) {
    // MaterialApp.router() is used for apps with a navigator that uses
    // declarative routing approach. It takes a router configuration rather than
    // a set of routes.
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // routeConfig reads _router to know about navigation properties. This
      // will help the MaterialApp to set up the essential parts of a router.
      // Under the hood, it will configure routerDelegate,
      // routeInformationParser, and routeInformationProvider.
      routerConfig: _router,
      // TODO: Add custom scroll behaviour.
      title: 'Yummy',
      scrollBehavior: CustomScrollBehavior(),
      themeMode: themeMode,
      theme: ThemeData(
        colorSchemeSeed: colorSelected.color,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: colorSelected.color,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
    );
  }
}
