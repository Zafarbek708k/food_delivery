import "package:flutter/cupertino.dart";
import "package:food_delivery/src/core/routes/app_route_name.dart";
import "package:food_delivery/src/feature/auth/view/pages/login_page.dart";
import "package:food_delivery/src/feature/auth/view/pages/register_page.dart";
import "package:food_delivery/src/feature/auth/view/pages/resset_email.dart";
import "package:food_delivery/src/feature/auth/view/pages/resset_password_page.dart";
import "package:food_delivery/src/feature/auth/view/pages/resset_verfication_code_page.dart";
import "package:food_delivery/src/feature/auth/view/pages/verificationcode_page.dart";
import "package:food_delivery/src/feature/home/view/pages/discovery_page.dart";
import "package:food_delivery/src/feature/home/view/pages/home_page.dart";
import "package:food_delivery/src/feature/home/view/pages/splash_page.dart";
import "package:food_delivery/src/feature/home/view/pages/welcome_page.dart";
import "package:go_router/go_router.dart";

import "../../feature/favourite/view/pages/favourite_page.dart";
import "../../feature/profile/view/pages/empty_page.dart";
import "../../feature/profile/view/pages/my_profile_edit_page.dart";
import "../../feature/profile/view/pages/profile_page.dart";
import "../../feature/restaurant/view/page/delivery_map_page.dart";
import "../../feature/restaurant/view/page/restaraunt_page.dart";
import "../../feature/restaurant/view/page/restaurant_detail_page.dart";
import "../../feature/search/view/pages/search_page.dart";

GlobalKey<NavigatorState> parentNavigatorkey = GlobalKey<NavigatorState>();

@immutable
final class AppRouter {
  const AppRouter._();

  ///
  ///bottom navigation bar siz chiqadigan pagelar
  ///

  static final GoRoute restaurantDetailPage = GoRoute(
    name: "RestaurantDetailPage",
    parentNavigatorKey: parentNavigatorkey,
    path: AppRouteName.restaurantDetailPage,
    pageBuilder: (BuildContext context, GoRouterState state) =>
        _customEachTransitionAnimation(context, state, const RestaurantDetail()),
  );

  static final GoRoute mapDeliveryPage = GoRoute(
    name: "MapDeliveryPage",
    parentNavigatorKey: parentNavigatorkey,
    path: AppRouteName.mapDeliveryPage,
    pageBuilder: (BuildContext context, GoRouterState state) =>
        _customEachTransitionAnimation(context, state, const MapDeliveryPage()),
  );

  static final GoRoute profileEditPage = GoRoute(
    name: "ProfileEditPage",
    parentNavigatorKey: parentNavigatorkey,
    path: AppRouteName.profileEditPage,
    pageBuilder: (BuildContext context, GoRouterState state) =>
        _customEachTransitionAnimation(context, state, const MyProfileEditPage()),
  );

  static final GoRoute profileEmptyPage = GoRoute(
    name: "ProfileEmptyPage",
    parentNavigatorKey: parentNavigatorkey,
    path: AppRouteName.profileEditPage,
    pageBuilder: (BuildContext context, GoRouterState state) =>
        _customEachTransitionAnimation(context, state, const EmptyProfilePage()),
  );

  ///
////Routing System
  ///

  static GoRouter routes = GoRouter(
    initialLocation: AppRouteName.splash,
    navigatorKey: parentNavigatorkey,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        name: "SplashPage",
        path: AppRouteName.splash,
        builder: (BuildContext context, GoRouterState state) => const SplashPage(),
      ),

      GoRoute(
        name: "Welcome",
        path: AppRouteName.welcomePage,
        builder: (BuildContext context, GoRouterState state) => const WelcomePage(),
      ),

      /// Auth
      GoRoute(
        name: "SignIn",
        path: AppRouteName.signIn,
        builder: (BuildContext context, GoRouterState state) => const LoginPage(),
        routes: [
          GoRoute(
            name: "SignUp",
            path: AppRouteName.signUp,
            builder: (BuildContext context, GoRouterState state) => const RegisterPage(),
            routes: [
              GoRoute(
                name: "Verification",
                path: AppRouteName.verification,
                builder: (BuildContext context, GoRouterState state) => const VerificationcodePage(),
              ),
            ],
          ),
          GoRoute(
            name: "ResetEmail",
            path: AppRouteName.reSetEmail,
            builder: (BuildContext context, GoRouterState state) => const RessetEmail(),
            routes: [
              GoRoute(
                name: "ResetVerification",
                path: AppRouteName.reSetVerification,
                builder: (BuildContext context, GoRouterState state) => const RessetVerficationCodePage(),
                routes: [
                  GoRoute(
                    name: "ResetPassword",
                    path: AppRouteName.reSetPassword,
                    builder: (BuildContext context, GoRouterState state) => const RessetPasswordPage(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),

      /// Home Page
      ShellRoute(
        builder: (context, state, child) => MyHomePage(child: child),
        routes: [
          GoRoute(
            name: "Discovery",
            path: AppRouteName.discoveryPage,
            pageBuilder: (BuildContext context, GoRouterState state) => _customNavigatorTransitionAnimation(
              context,
              state,
              const DiscoveryPage(),
            ), //const DiscoveryPage(),
          ),
          GoRoute(
            name: "Restaurant",
            path: AppRouteName.restaurantPage,
            pageBuilder: (BuildContext context, GoRouterState state) => _customNavigatorTransitionAnimation(
              context,
              state,
              const RestaurantsPage(),
            ),
            routes: [
              restaurantDetailPage,
            ],
          ),
          GoRoute(
            name: "Search",
            path: AppRouteName.searchPage,
            pageBuilder: (BuildContext context, GoRouterState state) =>
                _customNavigatorTransitionAnimation(context, state, SearchPage()),
          ),
          GoRoute(
            name: "Favorite",
            path: AppRouteName.favoritePage,
            pageBuilder: (BuildContext context, GoRouterState state) =>
                _customNavigatorTransitionAnimation(context, state, FavouritePage()),
          ),
          GoRoute(
            name: "Profile",
            path: AppRouteName.profilePage,
            pageBuilder: (BuildContext context, GoRouterState state) =>
                _customNavigatorTransitionAnimation(context, state, const ProfilePage()),
            routes: [
              profileEditPage,
              profileEmptyPage,
            ],
          ),
        ],
      ),
    ],
  );

////TransitionAnimation

  static Page<dynamic> _customEachTransitionAnimation(
    BuildContext context,
    GoRouterState state,
    Widget child,
  ) =>
      CustomTransitionPage<Object>(
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          // var begin = Offset(1.0, 0.0); // From right
          // var end = Offset.zero;
          // var tween = Tween(begin: begin, end: end);
          // var offsetAnimation = animation.drive(tween);
          //
          // return SlideTransition(
          //   position: offsetAnimation,
          //   child: child,
          // );

          final tween = Tween<double>(begin: 0, end: 1);
          final scaleAnimation = animation.drive(tween);

          return ScaleTransition(
            scale: scaleAnimation,
            child: child,
          );

          // var tween = Tween<double>(begin: 0.6, end: 1.0);
          // var sizeAnimation = animation.drive(tween);
          //
          // return SizeTransition(
          //   sizeFactor: sizeAnimation,
          //   child: child,
          // );

          // var tween = Tween<double>(begin: 0.5, end: 1); // Full rotation
          // var rotationAnimation = animation.drive(tween);
          //
          // return RotationTransition(
          //   turns: rotationAnimation,
          //   child: child,
          // );

          // return FadeTransition(
          //   opacity: animation,
          //   child: child,
          // );
        },
        child: child,
      );

  static Page<dynamic> _customNavigatorTransitionAnimation(
    BuildContext context,
    GoRouterState state,
    Widget child,
  ) =>
      CustomTransitionPage<Object>(
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          // var begin = Offset(1.0, 0.0); // From right
          // var end = Offset.zero;
          // var tween = Tween(begin: begin, end: end);
          // var offsetAnimation = animation.drive(tween);
          //
          // return SlideTransition(
          //   position: offsetAnimation,
          //   child: child,
          // );

          // var tween = Tween<double>(begin: 0, end: 1);
          // var scaleAnimation = animation.drive(tween);
          //
          // return ScaleTransition(
          //   scale: scaleAnimation,
          //   child: child,
          // );

          final tween = Tween<double>(begin: 0.6, end: 1);
          final sizeAnimation = animation.drive(tween);

          return SizeTransition(
            sizeFactor: sizeAnimation,
            child: child,
          );

          // final tween = Tween<double>(begin: 0.5, end: 1); // Full rotation
          // final rotationAnimation = animation.drive(tween);

          // return RotationTransition(
          //   turns: rotationAnimation,
          //   child: child,
          // );

          // return FadeTransition(
          //   opacity: animation,
          //   child: child,
          // );
        },
        child: child,
      );
}
