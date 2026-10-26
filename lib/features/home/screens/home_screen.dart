import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_strucuture/core/exports.dart';
import 'package:new_strucuture/features/home/screens/widgets/home_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar:  homeAppbar(),
   
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
          children: [
            
            
            Catwgories()

            // categorieseSeation(),
            //const resentproductsetion(),
            


            
            // categoriese seation >> setion title , category gride >> category card

            //mostSalesproductSetion >> setion title , horizontal product list >> product card


            //resentproductsetion >> setion title , horizontal product list >> product card


          ]
        ),
      ),
    ),
            //boutom navigation bar >>market ,orders ,cart ,profile

    );
  }

  AppBar homeAppbar() {
    return AppBar(
      // Logo
      leading: Padding(
        padding: EdgeInsets.all(8.w),
        child: SvgPicture.asset(
          ImageAssets.home,
          width: 30.sp,
          height: 30.sp,
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
    );
  }
}

class Catwgories extends StatelessWidget {
  const Catwgories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text("body");
  }
}