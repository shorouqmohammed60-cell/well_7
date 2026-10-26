  import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import "package:new_strucuture/core/utils/assets_manager.dart";
import 'package:easy_localization/easy_localization.dart';
import 'package:new_strucuture/core/exports.dart';


  AppBar homeAppbar() {
    return AppBar(
      elevation: 12,
      
      shadowColor: Colors.grey.withOpacity(0.1),
surfaceTintColor: Colors.transparent,
      // Logo
      leading: Padding(
        padding: EdgeInsets.all(3.w),
        child: Image.asset(
          ImageAssets.homeImage,
          
    

        ),
      ),

      // Search
      title: SizedBox(
        width:250.w,
        height:33.w,
        
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 1.h,
            ),
            hintText: 'search_for_product'.tr(),
            hintStyle: TextStyle(color:AppColors.hintGreyColor),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                        ImageAssets.searchIcon,
                         width: 17.w,
                  height: 17.h),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24.r),
              borderSide: BorderSide(
                color:AppColors.darkGrey,
                width: 1.sp,
              ),
            
              
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24.r),
              borderSide: BorderSide(
                color:AppColors.primary,
                width: 1.5.sp,
              ),
            
              
            ),
          ),
        ),
      ),

      // Notification
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 10.w),
          child: Stack(
            children: [
             Padding(
              padding: const EdgeInsets.all(4.0),
              child: SvgPicture.asset(
                        ImageAssets.notificationIcon,
                         width: 24.w,
                         height: 24.w,

                  ),
            ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 18.w,
                  height: 18.h,
                  decoration: BoxDecoration(
                   color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '2',
                      style: getHintStyle(fontSize: 11.sp,color: AppColors.hintColor ),
                      ),
                    ),
                  ),
                ),
              
            ],
          ),
        ),
      ],
    );
  }


