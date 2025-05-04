import 'package:cached_network_image/cached_network_image.dart';
import 'package:feature_based_mvvm_architecture/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CustomNetworkImageWidget extends StatelessWidget {
  final String urls;
  final double? width;
  final double? height;
  final BoxFit? fit;
  const CustomNetworkImageWidget({
    super.key,
    required this.urls,
    this.width,
    this.height,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      // imageUrl: "$imageUrl/$urls",
      imageUrl: urls,
      width: width ?? 90.w,
      height: height ?? 70.h,
      fit: fit ?? BoxFit.cover,
      placeholder:
          (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(decoration: BoxDecoration(color: Colors.white)),
          ),
      errorWidget:
          (context, string, url) => Image.asset(
            Assets.images.placeholderImage.path,
            fit: BoxFit.cover,
          ),
    );
  }
}
