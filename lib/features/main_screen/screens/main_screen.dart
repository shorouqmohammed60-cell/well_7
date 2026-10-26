import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_strucuture/core/exports.dart';
import 'package:new_strucuture/features/home/screens/home_screen.dart';
import 'package:new_strucuture/features/home/screens/widgets/home_appbar.dart';
import 'package:new_strucuture/features/main_screen/cubit/cubit.dart';
import 'package:new_strucuture/features/main_screen/cubit/state.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> listwidget = [
    const HomeScreen(),
    Text("orders", style: TextStyle(fontSize: 20)),
    Text("cart", style: TextStyle(fontSize: 20)),
    Text("profile", style: TextStyle(fontSize: 20)),
  ];

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
  final cubit = context.read<MainCubit>();

          return Scaffold(
              backgroundColor: AppColors.white,
             
              body: SafeArea(
                child: Center(
                  child: Container(
                    child: listwidget[state.selectedIndex],
                    
                  ),
                ),
              ),
              bottomNavigationBar: Container(
               
               decoration: 
               
               BoxDecoration(
                boxShadow: [
                   BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        blurRadius: 8,
        spreadRadius: 8,
        offset: const Offset(0, -3),
      ),
                ]
               ),

                child: BottomNavigationBar(
                  backgroundColor: Colors.white,
                  type: BottomNavigationBarType.fixed,
                  elevation: 20,
                  currentIndex: state.selectedIndex,
                
                  onTap: (val) {
                    context.read<MainCubit>().changeBottomNav(val);
                  },
                  selectedItemColor: AppColors.primary,
                   unselectedItemColor: AppColors.hintColor,
                
                
                  showSelectedLabels:true,
                  showUnselectedLabels: true,
                
                  unselectedLabelStyle: TextStyle(
                    color: AppColors.black,
                    fontSize: 12.sp,
                  ),
                  selectedLabelStyle: TextStyle(
                    color: AppColors.primary,
                    fontSize: 12.sp,
                  ),
                
                
                  items: [
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset(ImageAssets.market,colorFilter:ColorFilter.mode(
                          state.selectedIndex == 0
                          ?AppColors.primary :AppColors.hintColor,
                                BlendMode.srcIn,),
                        
                
                        ),
                        label: "Market".tr()),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset(ImageAssets.orders,width: 24.w,
                    height: 24.h,
                        colorFilter:ColorFilter.mode(
                          state.selectedIndex == 1
                          ?AppColors.primary :AppColors.hintColor,
                                BlendMode.srcIn,),
                        ),
                        label: "orders".tr()),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset(ImageAssets.cart,width: 27.w,
                    height: 27.h,
                        colorFilter:ColorFilter.mode(
                          state.selectedIndex == 2
                          ?AppColors.primary :AppColors.hintColor,
                                BlendMode.srcIn,),), label: "cart".tr()),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset(ImageAssets.profile_nav,
                        
                       colorFilter:ColorFilter.mode(
                          state.selectedIndex == 3
                          ?AppColors.primary :AppColors.hintColor,
                                BlendMode.srcIn,),),
                        label: "profile".tr())
                  ],
                ),
              )
              //boutom navigation bar >>market ,orders ,cart ,profile

              );
        },
      ),
    );
  }
}

    
            // categoriese seation >> setion title , category gride >> category card
    
            //mostSalesproductSetion >> setion title , horizontal product list >> product card
    
            //resentproductsetion >> setion title , horizontal product list >> product card
    
