import 'package:new_strucuture/core/exports.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final double width;
  final double height;
  final double borderRadius;
  final VoidCallback? onPressed;
  final Color? backgroundColor;

  const CustomButton({
    super.key,
    required this.text,
    this.textStyle,
    this.width = 200,
    this.height = 48,
    this.borderRadius = 28,
    this.onPressed,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: ElevatedButton(
        onPressed: onPressed,

        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.black,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius.r,
            ),
          ),

          elevation: 0,
        ),

        child: Text(
  text,
  style: TextStyle(
    fontSize: 14.sp,
    color: AppColors.white,
    
  ),
),
      ),
    );
  }
}