import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/splash/presentation/pages/splash_page.dart';
import '../features/onboarding/presentation/pages/onboarding_page.dart';
import '../features/auth/presentation/pages/auth_entry_page.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../features/auth/presentation/pages/signup_page.dart';
import '../features/auth/presentation/pages/forgot_password_page.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/upload/presentation/pages/upload_page.dart';
import '../features/projects/presentation/pages/projects_page.dart';
import '../features/projects/presentation/pages/project_detail_page.dart';
import '../features/processing/presentation/pages/live_processing_page.dart';
import '../features/tools/presentation/pages/tools_page.dart';
import '../features/profile/presentation/pages/profile_page.dart';
import '../features/export/presentation/pages/export_page.dart';
import '../shared/layouts/main_layout.dart';

class AppRouter {
  AppRouter._();

  // === ROUTE NAMES ===
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String authEntry = '/auth';
  static const String login = '/auth/login';
  static const String signup = '/auth/signup';
  static const String forgotPassword = '/auth/forgot-password';
  static const String home = '/home';
  static const String upload = '/upload';
  static const String projects = '/projects';
  static const String projectDetail = '/projects/:id';
  static const String liveProcessing = '/processing/:id';
  static const String tools = '/tools';
  static const String profile = '/profile';
  static const String export = '/export/:id';

  static final GoRouter router = GoRouter(
    initialLocation: splash,
    debugLogDiagnostics: true,
    routes: [
      // SPLASH
      GoRoute(
        path: splash,
        name: 'splash',
        builder: (context, state) => const SplashPage(),
      ),

      // ONBOARDING
      GoRoute(
        path: onboarding,
        name: 'onboarding',
        builder: (context, state) => const OnboardingPage(),
      ),

      // AUTH
      GoRoute(
        path: authEntry,
        name: 'authEntry',
        builder: (context, state) => const AuthEntryPage(),
        routes: [
          GoRoute(
            path: 'login',
            name: 'login',
            builder: (context, state) => const LoginPage(),
          ),
          GoRoute(
            path: 'signup',
            name: 'signup',
            builder: (context, state) => const SignupPage(),
          ),
          GoRoute(
            path: 'forgot-password',
            name: 'forgotPassword',
            builder: (context, state) => const ForgotPasswordPage(),
          ),
        ],
      ),

      // MAIN APP (with bottom nav)
      ShellRoute(
        builder: (context, state, child) => MainLayout(child: child),
        routes: [
          GoRoute(
            path: home,
            name: 'home',
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: projects,
            name: 'projects',
            builder: (context, state) => const ProjectsPage(),
          ),
          GoRoute(
            path: tools,
            name: 'tools',
            builder: (context, state) => const ToolsPage(),
          ),
          GoRoute(
            path: profile,
            name: 'profile',
            builder: (context, state) => const ProfilePage(),
          ),
        ],
      ),

      // STANDALONE PAGES (full screen)
      GoRoute(
        path: upload,
        name: 'upload',
        builder: (context, state) => const UploadPage(),
      ),
      GoRoute(
        path: '/projects/:id',
        name: 'projectDetail',
        builder: (context, state) => ProjectDetailPage(
          projectId: state.pathParameters['id'] ?? '',
        ),
      ),
      GoRoute(
        path: '/processing/:id',
        name: 'liveProcessing',
        builder: (context, state) => LiveProcessingPage(
          projectId: state.pathParameters['id'] ?? '',
        ),
      ),
      GoRoute(
        path: '/export/:id',
        name: 'export',
        builder: (context, state) => ExportPage(
          projectId: state.pathParameters['id'] ?? '',
        ),
      ),
    ],

    // ERROR PAGE
    errorBuilder: (context, state) => Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 64),
            const SizedBox(height: 16),
            Text(
              'Page not found',
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            TextButton(
              onPressed: () => context.go(home),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    ),
  );
}
