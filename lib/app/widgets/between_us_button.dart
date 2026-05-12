import 'package:flutter/material.dart';
import 'package:between_us/app/core/values/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BetweenUsButton extends StatelessWidget {
  const BetweenUsButton({
    super.key,
    required this.text,
    required this.onTap,
    this.icon,
    this.gradient,
    this.height = 48,
    this.borderRadius = 40,
  });

  final String text;
  final VoidCallback onTap;
  final IconData? icon;
  final LinearGradient? gradient;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.pinkGlow,
            blurRadius: 20.r,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius.r),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Ink(
              decoration: BoxDecoration(
                gradient: gradient ?? AppColors.primaryGradient,
              ),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (icon != null) ...[
                      SizedBox(width: 10.w),
                      Icon(icon, color: AppColors.white, size: 20.r),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
