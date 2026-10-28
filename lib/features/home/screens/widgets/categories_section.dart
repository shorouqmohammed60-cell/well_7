import 'package:new_strucuture/core/exports.dart';
import 'package:new_strucuture/features/home/screens/widgets/category_card.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> categories = [
      {
        'title': 'vegetables',
        'image': ImageAssets.OTPImage,
      },
      {
        'title': 'fruit',
        'image': ImageAssets.OTPImage,
      },
      {
        'title': 'canned_food',
        'image': ImageAssets.OTPImage,
      },
      {
        'title': 'detergents',
        'image': ImageAssets.OTPImage,
      },
      {
        'title': 'detergents',
        'image': ImageAssets.OTPImage,
      },
      
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17,vertical: 14),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
          childAspectRatio: 1.15,
        ),
        itemBuilder: (context, index) {
          return CategoryCard(
            title: categories[index]['title']!,
            image: categories[index]['image']!,
          );
        },
      ),
    );
  }
}