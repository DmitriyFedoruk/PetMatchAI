import 'package:go_router/go_router.dart';
import 'package:pet_match_ai/core/navigation/routes/route_path.dart';
import 'package:pet_match_ai/presentation/screens/intro_screen.dart';
import 'package:pet_match_ai/presentation/screens/quiz_screen.dart';
import 'package:pet_match_ai/presentation/screens/result_screen.dart';
import 'package:pet_match_ai/presentation/screens/splash_screen.dart';

final List<GoRoute> rootRoutes = [
  GoRoute(
    path: RoutePaths.splashScreen,
    builder: (context, state) {
      return const SplashScreen();
    },
  ),
  GoRoute(
    path: RoutePaths.introScreen,
    builder: (context, state) {
      return IntroScreen();
    },
  ),
  GoRoute(
    path: RoutePaths.quizScreen,
    builder: (context, state) {
      return QuizScreen();
    },
  ),
  GoRoute(
    path: RoutePaths.resultScreen,
    builder: (context, state) {
      return ResultScreen();
    },
  ),
];
