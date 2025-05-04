import 'package:carousel_slider/carousel_slider.dart';
import 'package:feature_based_mvvm_architecture/features/Home/model/slider_model_response.dart';
import 'package:feature_based_mvvm_architecture/gen/colors.gen.dart';
import 'package:feature_based_mvvm_architecture/shared/networks/endpoints.dart';
import 'package:feature_based_mvvm_architecture/shared/widgets/custom_network_image.dart';
import 'package:feature_based_mvvm_architecture/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({super.key});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // getSliderRXObj.getSlider();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<SliderModelResponse>>(
      stream: null,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: 130.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          );
        }

        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          final sliderItems = snapshot.data!;

          return Column(
            // alignment: Alignment.bottomCenter,
            children: [
              CarouselSlider.builder(
                itemCount: sliderItems.length,
                itemBuilder: (context, index, _) {
                  final item = sliderItems[index];
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(2.r),
                    child: CustomNetworkImageWidget(
                      urls: "$imageUrl${item.image}",
                      fit: BoxFit.cover,
                      height: 130.h,
                      width: double.infinity,
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 130.h,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  aspectRatio: 16 / 9,
                  enableInfiniteScroll: true,
                  onPageChanged: (index, _) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),

              UIHelper.verticalSpaceSmall,

              // Dots Indicator
              Padding(
                padding: EdgeInsets.only(bottom: 0.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    sliderItems.length,
                    (index) => _buildDot(isActive: index == _currentIndex),
                  ),
                ),
              ),
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget _buildDot({required bool isActive}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isActive ? 10.w : 8.w,
      height: isActive ? 10.h : 8.h,
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: AppColors.primaryColor.withValues(alpha: 0.5),
        ),
        borderRadius: BorderRadius.circular(120),
        color: isActive ? AppColors.primaryColor : Colors.transparent,
      ),
    );
  }
}
