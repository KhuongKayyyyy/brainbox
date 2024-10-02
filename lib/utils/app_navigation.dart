import 'package:brainbox/main_wrapper.dart';
import 'package:brainbox/utils/routes.dart';
import 'package:brainbox/view/account/account_landing_page.dart';
import 'package:brainbox/view/assistant/assistant_landing_page.dart';
import 'package:brainbox/view/authentication/login_page.dart';
import 'package:brainbox/view/authentication/phone_otp_verification_page.dart';
import 'package:brainbox/view/authentication/phone_verification_page.dart';
import 'package:brainbox/view/authentication/sign_in_page.dart';
import 'package:brainbox/view/history/history_landing_page.dart';
import 'package:brainbox/view/splash/on_boarding_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../view/home/home_landing_page.dart';
import '../view/splash/splash.dart';

class AppNavigation {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorHomeKey =
      GlobalKey<NavigatorState>(debugLabel: "shellHome");
  static final _shellNavigatorAssistantKey =
      GlobalKey<NavigatorState>(debugLabel: "shellAssistant");
  static final _shellNavigatorHistoryKey =
      GlobalKey<NavigatorState>(debugLabel: "shellHistory");
  static final _shellNavigatorAccountKey =
      GlobalKey<NavigatorState>(debugLabel: "shellAccount");

  static final GoRouter router = GoRouter(
      initialLocation: Routes.splashScreen,
      navigatorKey: _rootNavigatorKey,
      routes: [
        //on board
        GoRoute(
          path: Routes.splashScreen,
          name: Routes.splashScreen,
          builder: (BuildContext context, GoRouterState state) =>
              const SplashScreen(),
        ),

        GoRoute(
          path: Routes.onBoardPage,
          name: Routes.onBoardPage,
          builder: (BuildContext context, GoRouterState state) =>
              const OnBoardingPage(),
        ),

        //authentication
        GoRoute(
          path: Routes.login,
          name: Routes.login,
          builder: (BuildContext context, GoRouterState state) =>
              const LoginPage(),
        ),
        GoRoute(
          path: Routes.signUp,
          name: Routes.signUp,
          builder: (BuildContext context, GoRouterState state) =>
              const SignUpPage(),
        ),

        GoRoute(
          path: Routes.phoneVerification,
          name: Routes.phoneVerification,
          builder: (BuildContext context, GoRouterState state) =>
              const PhoneVerificationPage(),
        ),
        GoRoute(
          path: '${Routes.phoneOTPVerification}/:phoneNumber',
          name: Routes.phoneOTPVerification,
          builder: (BuildContext context, GoRouterState state) {
            final phoneNumber = state.pathParameters['phoneNumber']!;
            return PhoneOTPVerificationPage(phoneNumber: phoneNumber);
          },
        ),
        //  main wrapper route
        StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) {
              return MainWrapper(
                navigationShell: navigationShell,
              );
            },
            branches: [
              //  branch Home:
              StatefulShellBranch(
                  navigatorKey: _shellNavigatorHomeKey,
                  routes: [
                    GoRoute(
                      path: Routes.homeLandingPage,
                      name: Routes.homeLandingPage,
                      builder: (BuildContext context, GoRouterState state) =>
                          const HomeLandingPage(),
                    )
                  ]),

              //  branch Assistant:
              StatefulShellBranch(
                  navigatorKey: _shellNavigatorAssistantKey,
                  routes: [
                    GoRoute(
                      path: Routes.assistantLandingPage,
                      name: Routes.assistantLandingPage,
                      builder: (BuildContext context, GoRouterState state) =>
                          const AssistantLandingPage(),
                    )
                  ]),

              //  branch History:
              StatefulShellBranch(
                  navigatorKey: _shellNavigatorHistoryKey,
                  routes: [
                    GoRoute(
                      path: Routes.historyLandingPage,
                      name: Routes.historyLandingPage,
                      builder: (BuildContext context, GoRouterState state) =>
                          const HistoryLandingPage(),
                    )
                  ]),

              //  branch Account:
              StatefulShellBranch(
                  navigatorKey: _shellNavigatorAccountKey,
                  routes: [
                    GoRoute(
                      path: Routes.accountLandingPage,
                      name: Routes.accountLandingPage,
                      builder: (BuildContext context, GoRouterState state) =>
                          const AccountLandingPage(),
                    )
                  ]),
            ])
      ]);
}
