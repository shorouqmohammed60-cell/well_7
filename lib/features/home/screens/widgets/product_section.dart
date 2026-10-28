import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_strucuture/core/exports.dart';
import 'product_card.dart';

class ProductsSection extends StatelessWidget {
  final Color backgroundColor;

  const ProductsSection({
    super.key,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    final products = [
      {
        'image': ImageAssets.logoImage,
        'title': 'olive , Black olive',
        
      },
      {
        'image': ImageAssets.OTPImage,
        'title': 'Biryani Basmati Fried rice',
       
      },
      {
        'image': ImageAssets.OTPImage,
        'title': 'Black olive',
        
      },
    ];

    return Container(
      
      decoration:BoxDecoration(
      
      ),
      padding: EdgeInsets.symmetric(
        vertical: 18.h,
      ),
      child: SizedBox(
        height: 251.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
          ),
          itemCount: products.length,
          separatorBuilder: (_, index) =>
              SizedBox(width: 10.w),
          itemBuilder: (context, index) {
            final product = products[index];

            return ProductCard(
              image: product['image']!,
              title: product['title']!,
            
            );
          },
        ),
      ),
    );
  }
}