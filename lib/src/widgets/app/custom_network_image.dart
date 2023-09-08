import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_app/src/theme/app_theme.dart';
import 'package:shimmer/shimmer.dart';

class CustomNetworkImage extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  final double radius;

  const CustomNetworkImage({
    Key? key,
    required this.image,
    required this.height,
    required this.width,
    this.radius = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: CachedNetworkImage(
        imageUrl: image,
        // httpHeaders: ApiProvider().header(),
        placeholder: (context, url) => Center(
          child: Shimmer.fromColors(
            baseColor: AppTheme.shimmerBase,
            highlightColor: AppTheme.shimmerHighlight,
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                color: Colors.white,
              ),
            ),
          ),
        ),
        errorWidget: (context, url, error) => Center(
          child: Container(
            height: height,
            width: width,
            color: AppTheme.shimmerHighlight,
            child: const Icon(
              Icons.error,
              color: Colors.black,
            ),
          ),
        ),
        height: height,
        width: width,
        fit: BoxFit.cover,
      ),
    );
  }
}
