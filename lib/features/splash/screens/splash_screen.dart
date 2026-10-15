import 'dart:async';
import 'package:flutter/material.dart';
import 'package:new_strucuture/core/exports.dart';
import 'package:new_strucuture/core/utils/assets_manager.dart';
import 'package:new_strucuture/features/splash/cubit/cubit.dart';
import 'package:new_strucuture/features/splash/cubit/state.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
 

  Future<void> getStoreUser() async {
    Navigator.pushReplacementNamed(
      context,
      Routes.loginRoute,
      arguments: false,
    );

    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // if (prefs.getString('onBoarding') != null) {
    //   if (prefs.getString('user') != null) {
    //     Navigator.pushReplacementNamed(context, Routes.mainRoute);
    //   } else {
    //     Navigator.pushNamedAndRemoveUntil(
    //       context,
    //       Routes.loginRoute,
    //       ModalRoute.withName(
    //         Routes.initialRoute,
    //       ),
    //     );
    //   }
    // } else {
    //   Navigator.pushReplacementNamed(
    //     context,
    //     Routes.initialRoute,

    //     ///onBprading
    //   );
    // }
  }

  @override
  void initState() {
    super.initState();
    // context.read<SplashCubit>().getAdsOfApp();

  }

  @override
  void dispose(){
  
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(),
      child: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashNavigateToLogin) {
      Navigator.pushReplacementNamed(
        context,
        Routes.loginRoute,
        arguments: false,
      );
    } else if (state is SplashGoToOnboarding) {
      Navigator.pushReplacementNamed(
        context,
        Routes.onboardingPageScreenRoute,
      );
    }
      
          
          




        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.white,
            body: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: SizedBox(
                    child: Image.asset(
                      ImageAssets.logoImage,
                      height: 200,
                      width: 200,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
    //   },
    // );
  }
}
