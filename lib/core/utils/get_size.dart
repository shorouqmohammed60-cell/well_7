import 'package:new_strucuture/core/exports.dart';

double getWidthSize(BuildContext context) {
  return MediaQuery.sizeOf(context).width;
}

Widget boxSizeWidth(BuildContext context) {
  return SizedBox(width: 10.w);
}

Widget boxSizeHeight(BuildContext context,{ double? height}) {
  return SizedBox(height: height ?? 20.h);
}

double getHeightSize(BuildContext context) {
  return MediaQuery.sizeOf(context).height;
}

double getHorizontalPadding(BuildContext context) {
  return 20.w;
}

double getVerticalPadding(BuildContext context) {
  return 20.h;


}
