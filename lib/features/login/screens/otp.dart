import 'package:easy_localization/easy_localization.dart';
import 'package:new_strucuture/config/routes/app_routes.dart';
import 'package:new_strucuture/core/exports.dart';
import 'package:new_strucuture/core/widgets/custom_button2.dart';
import 'package:new_strucuture/features/login/cubit/cubit.dart';
import 'package:new_strucuture/features/register/screens/register.dart';


import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 55.h),
            Text(
              'verify_your_phone'.tr(),
                    style: getTitleBoldStyle(
                      fontSize: 14.sp,
                      weight: FontWeight.w400,
                    ),
                  ),

            RichText(
              text: TextSpan(
                
                
                children: [
                  
                 
                  TextSpan(text: '(${context.read<LoginCubit>().selectedCountry?.code})' ,style: getTitleBoldStyle(
                      fontSize: 16.sp,
                      weight: FontWeight.w400,
                      
                    ),),
                  TextSpan(text: ' ${context.read<LoginCubit>().phone}',style: getTitleBoldStyle(
                      fontSize: 16.sp,
                      weight: FontWeight.w400,
                      color: AppColors.primary,

                    ),)
                ],
              ),
              
            ),
            SizedBox(height: 35.h),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal:100),
              child: Image.asset(
                ImageAssets.OTPImage,
              
              ),
            ),
            SizedBox(height: 35.h),
            Text(
              'Enter_your_verification_code'.tr(),
              style: getTitleBoldStyle(
                fontSize: 18.sp,
                weight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 35.h),
            // verification code Widget
            Center(
              child: Pinput(
                length: 5,
                showCursor: false,
                onCompleted: (pin) => print(pin),
                defaultPinTheme: PinTheme(
                  width: 56,
                  height: 56,
                  textStyle: getBoldStyle(
                    fontSize: 24,
                    color: AppColors.primary,
                  ),
                
                  decoration: BoxDecoration(
                    border: BorderDirectional(bottom: BorderSide( color:AppColors.gray)),
                    // borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40.h),
            CustomButton(
              text: 'submit'.tr(),
              width: 200,
              height: 48,
              borderRadius: 28,

              onPressed: () {
                Navigator.pushNamed(
                  context,
                  Routes.registerRout,
                  );
          
              }
          
              
            ),
      
      ],
      
        ),
      )
    );
    
  }
}