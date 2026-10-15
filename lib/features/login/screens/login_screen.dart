import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:new_strucuture/core/exports.dart';
import 'package:new_strucuture/core/widgets/custom_button2.dart';
import 'package:new_strucuture/features/login/cubit/cubit.dart';
import 'package:new_strucuture/features/login/screens/otp.dart';
import 'package:new_strucuture/features/splash/cubit/cubit.dart';
import 'package:new_strucuture/injector.dart' as injector;

import 'counrty_with_phone.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.showBackButton});
  final bool showBackButton;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();

  final _key = GlobalKey<FormState>();
  @override
  initState() {
    super.initState();
    log("LoginScreen initState showBackButton: ${widget.showBackButton}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(
          title: 'login'.tr(),
          showBackButton: widget.showBackButton,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            children: [
              // Login Image
              Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Image.asset(
                  ImageAssets.loginImage,
                ),
              ),
    
              SizedBox(height: 45.h),
    
              // Welcome Back
              Text(
                'welcome_back'.tr(),
                style: getTitleBoldStyle(
                  fontSize: 24.sp,
                ),
              ),
    
              SizedBox(height: 35.h),
    
              // Phone Number Container
              CustomCountryPhoneWidget(
                controller: phoneController,
              ),
    
              SizedBox(height: 35.h),
    
              CustomButton(
                text: 'Login',
                width: 200,
                height: 48,
                borderRadius: 28,
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    print(" valid");
                      Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OtpScreen()),
                  );
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   const SnackBar(content: Text('Processing Data')),
                    // );
                  } else {
                    print("not valid");
                  }
    
                  // // Navigate to the OTP screen when the button is pressed
                
                },
              ),
    
              // Login Button
              // CustomButton(
              // text: 'Login',
              // onPressed: () {},
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
