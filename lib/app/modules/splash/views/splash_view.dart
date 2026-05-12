import 'dart:async';
import 'package:between_us/app/routes/app_routes.dart';
import 'package:between_us/data/providers/firebase_provider.dart';
import 'package:between_us/data/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/values/colors.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _textController;

  late Animation<double> scale;
  late Animation<double> rotation;
  late Animation<double> textOpacity;

  @override
  void initState() {
    super.initState();

    //  Logo Animation
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    scale = Tween(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeOutBack),
    );

    rotation = Tween(
      begin: -0.3,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _logoController, curve: Curves.easeOut));

    // Text Animation
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    textOpacity = Tween(begin: 0.0, end: 1.0).animate(_textController);

    // Start animation sequence
    startAnimation();
  }

  void startAnimation() async {
    await _logoController.forward();
    await _textController.forward();

    await Future.delayed(const Duration(seconds: 1));

    final isConnected = await checkConnection();

    if (isConnected) {
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.offAllNamed(Routes.ONBOARDING);
    }
  }

  Future<bool> checkConnection() async {
    try {
      final auth = AuthRepository();
      final provider = FirebaseProvider();

      final userId = auth.userId;

      final doc = await provider.getUser(userId);

      if (!doc.exists) return false;

      final data = doc.data() as Map<String, dynamic>?;

      return data?['partnerId'] != null;
    } catch (e) {
      return false;
    }
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(gradient: AppColors.primaryGradient),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //  Animated Logo
            AnimatedBuilder(
              animation: _logoController,
              builder: (context, child) {
                return Transform.rotate(
                  angle: rotation.value,
                  child: Transform.scale(
                    scale: scale.value,
                    child: Container(
                      height: 120.h,
                      width: 120.w,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.primaryPink,
                        size: 50.r,
                      ),
                    ),
                  ),
                );
              },
            ),

            SizedBox(height: 30.h),

            //  Text Fade
            FadeTransition(
              opacity: textOpacity,
              child: Column(
                children: [
                  Text(
                    "Moments",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "For two",
                    style: TextStyle(color: Colors.white70, fontSize: 14.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
