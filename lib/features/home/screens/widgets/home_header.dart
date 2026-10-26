import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_strucuture/core/utils/assets_manager.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Logo
        leading: Padding(
          padding: EdgeInsets.all(8.w),
          child: SvgPicture.asset(
            ImageAssets.home,
            width: 30.w,
            height: 30.h,
          ),
        ),

        // Search
        title: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: 1.h,
            ),
            hintText: 'search_for_product'.tr(),
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24.r),
            ),
          ),
        ),

        // Notification
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: Stack(
              children: [
                Icon(
                  Icons.notifications_none,
                  size: 30.sp,
                ),

                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 18.w,
                    height: 18.h,
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '2',
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}