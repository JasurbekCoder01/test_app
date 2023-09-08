import 'package:flutter/cupertino.dart';
import 'package:test_app/src/repositories/news/models/article.dart';
import 'package:test_app/src/theme/app_theme.dart';
import 'package:test_app/src/utils/utils.dart';
import 'package:test_app/src/widgets/app/custom_network_image.dart';

class ItemHorizontalWidget extends StatelessWidget {
  final Article data;
  final Function onTap;

  const ItemHorizontalWidget({
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
        height: 300 * context.h,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(
            horizontal: 28 * context.w, vertical: 20 * context.h),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 20,
              color: Color.fromRGBO(0, 0, 0, 0.25),
            )
          ],
        ),
        child: Stack(
          children: [
            CustomNetworkImage(
              image: data.imageUrl,
              radius: 12,
              height: 300 * context.h,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              height: 300 * context.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(4, 4),
                    blurRadius: 20,
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 40 * context.h,
              left: 20 * context.w,
              right: 40 * context.w,
              child: Text(
                data.title,
                style: TextStyle(
                  fontFamily: AppTheme.fontSFPro,
                  fontWeight: FontWeight.w400,
                  fontSize: 28 * context.h,
                  color: AppTheme.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
