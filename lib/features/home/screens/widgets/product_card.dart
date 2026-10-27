import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_strucuture/core/exports.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const ProductCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210.w,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Product Image
              Expanded(
                child: Center(
                  child: Image.asset(
                    image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              SizedBox(height: 8.h),

              // Product title
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: getTitleBoldStyle(
                  fontSize: 16.sp,
                  weight: FontWeight.w400,
                ),
              ),

              SizedBox(height: 4.h),

              // Product description
              Text(
                description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: getTitleBoldStyle(
                  fontSize: 14.sp,
                  weight: FontWeight.w400,
                ),
              ),

              SizedBox(height: 35.h),
            ],
          ),

          // Bookmark
          Positioned(
            top: 0,
            right: 0,
            child: Icon(
              Icons.bookmark_border,
              size: 28.sp,
              color: Colors.grey,
            ),
          ),

          // Cart button
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primary,
                ),
              ),
              child: Icon(
                Icons.shopping_cart_outlined,
                size: 20.sp,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}