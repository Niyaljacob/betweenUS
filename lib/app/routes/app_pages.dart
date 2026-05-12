import 'package:between_us/app/modules/connect/bindings/connect_binding.dart';
import 'package:between_us/app/modules/connect/views/connect_view.dart';
import 'package:between_us/app/modules/home/bindings/home_binding.dart';
import 'package:between_us/app/modules/home/views/home_view.dart';
import 'package:between_us/app/modules/splash/views/splash_view.dart';
import 'package:get/get.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: Routes.SPLASH, page: () => const SplashView()),
    GetPage(
      name: Routes.ONBOARDING,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: Routes.CONNECT,
      page: () => const ConnectView(),
      binding: ConnectBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
