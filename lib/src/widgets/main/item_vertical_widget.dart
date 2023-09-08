import 'package:flutter/cupertino.dart';
import 'package:test_app/src/repositories/news/models/article.dart';
import 'package:test_app/src/theme/app_theme.dart';
import 'package:test_app/src/utils/utils.dart';
import 'package:test_app/src/widgets/app/custom_network_image.dart';

class ItemVerticalWidget extends StatelessWidget {
  final Article data;
  final Function() onTap;

  const ItemVerticalWidget({
    Key? key,
    required this.data,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: EdgeInsets.all(20 * context.h),
        margin: EdgeInsets.symmetric(
            horizontal: 28 * context.w, vertical: 10 * context.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: AppTheme.white,
          boxShadow: const [
            BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 20,
              color: Color.fromRGBO(0, 0, 0, 0.01),
            ),
            BoxShadow(
              offset: Offset(-4, -4),
              blurRadius: 8,
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            CustomNetworkImage(
              image: data.imageUrl,
              height: 60 * context.h,
              width: 90 * context.w,
              radius: 12,
            ),
            SizedBox(
              width: 24 * context.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    style: TextStyle(
                      fontFamily: AppTheme.fontSFPro,
                      fontWeight: FontWeight.w400,
                      fontSize: 16 * context.h,
                      color: AppTheme.black,
                    ),
                  ),
                  SizedBox(
                    height: 12 * context.h,
                  ),
                  Text(
                    data.publicationDate.toString(),
                    style: TextStyle(
                      fontFamily: AppTheme.fontSFPro,
                      fontWeight: FontWeight.w400,
                      fontSize: 12 * context.h,
                      color: AppTheme.gray,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
