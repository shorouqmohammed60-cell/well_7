import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:new_strucuture/core/exports.dart';
import 'package:new_strucuture/features/home/screens/widgets/categories_section.dart';
import 'package:new_strucuture/features/home/screens/widgets/home_appbar.dart';
import 'package:new_strucuture/features/home/screens/widgets/product_section.dart';
import 'package:new_strucuture/features/home/screens/widgets/row_of_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: homeAppbar(),

        body: SafeArea(
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 10 .h),

                // Categories
                RowOfTitle(

                  title: 'categories'.tr(),
                ),

                

                 CategoriesSection(),

                SizedBox(height: 25.h),

                RowOfTitle(
                  title: 'most_sale_products'.tr(),
                ),

                SizedBox(height: 15.h),

                //ProductsSection(),

                SizedBox(height: 25.h),

               
                RowOfTitle(
                  title: 'Recent_products'.tr(),
                ),

                SizedBox(height: 15.h),

                //ProductsSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}