import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/values/colors.dart';
import '../../../widgets/between_us_button.dart';
import '../controllers/connect_controller.dart';

class ConnectView extends GetView<ConnectController> {
  const ConnectView({super.key});

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

              // 🔥 Title
              Text(
                "Connect with your partner",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),

              SizedBox(height: 12.h),

              // Subtitle
              Text(
                "Enter your partner’s code or create one",
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.white70, fontSize: 16.sp),
              ),

              SizedBox(height: 40.h),

              // 🔥 Generated Code Display
              Obx(() {
                if (controller.generatedCode.value.isEmpty) {
                  return const SizedBox();
                }

                return Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 16.h,
                    horizontal: 20.w,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.glassWhite,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    controller.generatedCode.value,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 22.sp,
                      letterSpacing: 3,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }),

              SizedBox(height: 20.h),

              // 🔥 Create Code Button
              BetweenUsButton(
                text: "Create Code",
                onTap: controller.createCode,
              ),

              SizedBox(height: 30.h),

              // Divider
              Text(
                "OR",
                style: TextStyle(color: AppColors.white70, fontSize: 14.sp),
              ),

              SizedBox(height: 30.h),

              // 🔥 Input Field
              TextField(
                onChanged: (value) => controller.enteredCode.value = value,
                style: TextStyle(color: AppColors.white),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Enter Code",
                  hintStyle: TextStyle(color: AppColors.white70),
                  filled: true,
                  fillColor: AppColors.glassWhite,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              Obx(
                () => BetweenUsButton(
                  text: "Connect",
                  onTap: controller.enteredCode.value.isEmpty
                      ? null
                      : controller.joinCode,
                ),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
