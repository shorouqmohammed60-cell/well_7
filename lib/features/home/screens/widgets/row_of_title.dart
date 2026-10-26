import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_strucuture/core/exports.dart';

class RowOfTitle extends StatelessWidget {
  final String title;

  const RowOfTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 8.w,
          height: 28.h,
          decoration: BoxDecoration(
            color: AppColors.lightyellow,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(27.r),
              bottomRight: Radius.circular(27.r),
            ),
          ),
        ),

        SizedBox(width: 12.w),

        Text(
          title,
          style: getTitleBoldStyle(fontSize:20.sp,),
          ),
        
      ],
    );
  }
}