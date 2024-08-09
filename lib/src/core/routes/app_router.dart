import "package:flutter/cupertino.dart";
import "package:food_delivery/src/core/routes/app_route_name.dart";
import "package:food_delivery/src/feature/auth/view/pages/login_page.dart";
import "package:food_delivery/src/feature/auth/view/pages/register_page.dart";
import "package:food_delivery/src/feature/auth/view/pages/resset_email.dart";
import "package:food_delivery/src/feature/auth/view/pages/resset_password_page.dart";
import "package:food_delivery/src/feature/auth/view/pages/resset_verfication_code_page.dart";
import "package:food_delivery/src/feature/auth/view/pages/verificationcode_page.dart";
import "package:food_delivery/src/feature/favourite/pages/favourite_page.dart";
import "package:food_delivery/src/feature/home/view/pages/discovery_page.dart";
import "package:food_delivery/src/feature/home/view/pages/home_page.dart";
import "package:food_delivery/src/feature/home/view/pages/splash_page.dart";
import "package:food_delivery/src/feature/home/view/pages/welcome_page.dart";
import "package:food_delivery/src/feature/profile/pages/profile_page.dart";
import "package:food_delivery/src/feature/restaurant/page/restaraunt_page.dart";
import "package:food_delivery/src/feature/restaurant/page/restaurant_detail_page.dart";
import "package:food_delivery/src/feature/search/pages/search_page.dart";
import "package:go_router/go_router.dart";

GlobalKey<NavigatorState> parentNavigatorkey = GlobalKey<NavigatorState>();

@immutable
final class AppRouter {
  const AppRouter._();
  static GoRouter routes = GoRouter(
    initialLocation: AppRouteName.splash,
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
            name: "Reset Email",
            path: AppRouteName.reSetEmail,
            builder: (BuildContext context, GoRouterState state) => const RessetEmail(),
            routes: [
              GoRoute(
                name: "RessetVerification",
                path: AppRouteName.reSetVerification,
                builder: (BuildContext context, GoRouterState state) => const RessetVerficationCodePage(),
                routes: [
                  GoRoute(
                    name: "RessetPassword",
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
            builder: (BuildContext context, GoRouterState state) => const DiscoveryPage(),
          ),
          GoRoute(
            name: "Restaurant",
            path: AppRouteName.restaurantPage,
            builder: (BuildContext context, GoRouterState state) => const RestaurantsPage(),
            routes: [
              GoRoute(
                name: AppRouteName.restaurantDetailPage,
                path: AppRouteName.restaurantDetailPage,
                builder: (BuildContext context, GoRouterState state) => const RestaurantDetail(),
              ),
            ],
          ),
          GoRoute(
            name: "Search",
            path: AppRouteName.searchPage,
            builder: (BuildContext context, GoRouterState state) => SearchPage(),
          ),
          GoRoute(
            name: "Favorite",
            path: AppRouteName.favoritePage,
            builder: (BuildContext context, GoRouterState state) => FavouritePage(),
          ),
          GoRoute(
            name: "Profile",
            path: AppRouteName.profilePage,
            builder: (BuildContext context, GoRouterState state) => const ProfilePage(),
          ),
        ],
      ),
    ],
  );
}
