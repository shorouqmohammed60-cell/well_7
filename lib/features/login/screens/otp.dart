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
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 55.h),

            RichText(
              text: TextSpan(
                
                
                children: [
                  TextSpan(
                    text: 'we sent an code to verify your phone\n \n',
                    style: getTitleBoldStyle(
                      fontSize: 14.sp,
                      weight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(text: '(${context.read<LoginCubit>().selectedCountry?.code})', style: getTitleBoldStyle(
                      fontSize: 16.sp,
                      weight: FontWeight.w400,
                      color: AppColors.primary,
                    ),),
                  TextSpan(text: '${context.read<LoginCubit>().phone}',style: getTitleBoldStyle(
                      fontSize: 16.sp,
                      weight: FontWeight.w400,
                      color: AppColors.primary,

                    ),)
                ],
              ),
            ),
            SizedBox(height: 45.h),

            Image.asset(
              ImageAssets.OTPImage,
              width: 162,
              height: 140,
            ),
            SizedBox(height: 35.h),
            Text(
              'Enter your verification code',
              style: getTitleBoldStyle(
                fontSize: 18.sp,
                weight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 35.h),
            // verification code Widget
            Pinput(
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
                  border: BorderDirectional(bottom: BorderSide()),
                  // borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 40.h),
            CustomButton(
              text: 'submit',
              width: 200,
              height: 48,
              borderRadius: 28,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Register(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}