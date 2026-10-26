import 'package:new_strucuture/core/exports.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String image;

  const CategoryCard({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),

      child: Stack(
        children: [
          // Background
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  Colors.green.shade50,
                ],
              ),
            ),
          ),

          // Title
          Positioned(
            top: 20.h,
            left: 24.w,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          // Image
          Positioned(
            right: 0,
            bottom: 0,
            child: Image.asset(
              image,
              width: 150.w,
              height: 120.h,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}