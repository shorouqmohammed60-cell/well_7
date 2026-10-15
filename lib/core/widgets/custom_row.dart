


import 'package:flutter_svg/svg.dart';
import 'package:new_strucuture/core/exports.dart';

class CustomRow extends StatelessWidget {
  final String iconPath;
  final String text;
  final double iconSize;
  final double fontSize;
  final bool isRequired;
  

  const CustomRow({
    Key? key,
    required this.iconPath,
    required this.text,
    this.iconSize = 24.0,
    this.fontSize = 16.0,
    this.isRequired = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          iconPath,
          width: iconSize,
          height: iconSize,
        ),
        SizedBox(width: 10.w),
        Text(
         isRequired ? text + " *" : text,
          style: TextStyle(fontSize: fontSize),
        ),
      ],
    );
  }
}