import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/colors.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Obx(() {
          if (controller.partnerId.value.isEmpty) {
            return const CircularProgressIndicator();
          }

          return Text(
            "Connected ❤️\nPartner ID:\n${controller.partnerId.value}",
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          );
        }),
      ),
    );
  }
}
