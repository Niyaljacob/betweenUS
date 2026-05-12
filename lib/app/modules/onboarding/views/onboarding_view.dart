import 'package:between_us/app/widgets/between_us_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/values/colors.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              const Spacer(),

              //  Main Illustration
              Container(
                height: 320.h,
                width: 320.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.r),
                  gradient: AppColors.cardGradient,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 220.h,
                      width: 220.w,
                      decoration: BoxDecoration(
                        color: AppColors.glassWhite,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                    Icon(
                      Icons.favorite_rounded,
                      color: AppColors.white,
                      size: 90.r,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 50.h),

              //  Title
              Text(
                "Stay close,\neven far away",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 34.sp,
                  height: 1.2.h,
                  fontWeight: FontWeight.w700,
                ),
              ),

              SizedBox(height: 18.h),

              // ✨ Subtitle
              Text(
                "Send private moments directly\nto your partner’s home screen.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.white70,
                  fontSize: 16.sp,
                  height: 1.5.h,
                ),
              ),

              const Spacer(),

              //  Button
              BetweenUsButton(
                text: 'Get Started',
                onTap: () {
                  controller.onGetStarted;
                },
              ),

              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
