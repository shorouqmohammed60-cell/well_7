import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_strucuture/core/exports.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String title;

  const ProductCard({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 164.w,
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColors.lightGrey2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image + Bookmark
          Stack(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 4.w,
                    vertical: 10.h,
                  ),
                  child: Image.asset(
                    image,
                    height: 120.h,
                    width: 120.w,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              Positioned(
                top: 0,
                right: 0,
                child: SvgPicture.asset(
                  ImageAssets.bookMark,
                  width: 20.w,
                  height: 20.h,
                ),
              ),
            ],
          ),

          SizedBox(height: 8.h),

          // Title
          SizedBox(
            height: 40,
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: getRegularStyle(
                fontSize: 14.sp,
                weight: FontWeight.w400,
              ),
            ),
          ),

          SizedBox(height: 8.h),

          // Cart - Far Right
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 32.w,
              height: 32.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primary,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: Image.asset(
                  ImageAssets.productCart,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}