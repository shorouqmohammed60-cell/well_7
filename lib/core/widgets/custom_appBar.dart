import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';





class CustomAppBar extends StatelessWidget {
  final String title;
  final bool showBackButton;


  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    
  });
@override
Widget build(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: AppColors.white,
      boxShadow: [     

  BoxShadow(
    color: Colors.black.withOpacity(0.08),
    offset: const Offset(0, 3),
    blurRadius: 10,
  ),
],

  
    ),
    child: AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      centerTitle: true,

      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : const SizedBox.shrink(),

      title: Text(
        title.tr(),
        style: getTitleBoldStyle(),
      ),
    ),
  );
}

  }
