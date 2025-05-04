// import 'dart:async';

// import 'package:feature_based_mvvm_architecture/app/provider/home_product_add_provider.dart';
// import 'package:feature_based_mvvm_architecture/features/Home/model/product_add_response_model.dart';
// import 'package:feature_based_mvvm_architecture/gen/colors.gen.dart';
// import 'package:feature_based_mvvm_architecture/shared/networks/endpoints.dart';
// import 'package:feature_based_mvvm_architecture/shared/widgets/custom_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';

// class HomeSlider2 extends StatefulWidget {
//   const HomeSlider2({super.key});

//   @override
//   State<HomeSlider2> createState() => _HomeSlider2State();
// }

// class _HomeSlider2State extends State<HomeSlider2> {
//   final PageController _pageController = PageController();
//   int _currentIndex = 0;
//   Timer? _autoSlideTimer;

//   @override
//   void initState() {
//     super.initState();
//     _startAutoSlide();
//   }

//   void _startAutoSlide() {
//     _autoSlideTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
//       final provider = context.read<HomeProductAddProvider>();
//       final ads = provider.addList;

//       if (ads.isNotEmpty && _pageController.hasClients) {
//         int nextPage = (_currentIndex + 1) % ads.length;
//         _pageController.animateToPage(
//           nextPage,
//           duration: const Duration(milliseconds: 500),
//           curve: Curves.easeInOut,
//         );
//       }
//     });
//   }

//   void _onPageChanged(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }

//   @override
//   void dispose() {
//     _autoSlideTimer?.cancel();
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<HomeProductAddProvider>(
//       builder: (context, provider, child) {
//         final ads = provider.addList;

//         if (ads.isEmpty) {
//           return const SizedBox.shrink();
//         }

//         return SizedBox(
//           height: 130.h,
//           child: Stack(
//             children: [
//               PageView.builder(
//                 scrollDirection: Axis.vertical,
//                 controller: _pageController,
//                 itemCount: ads.length,
//                 onPageChanged: _onPageChanged,
//                 itemBuilder: (context, index) {
//                   final add = ads[index];
//                   return Padding(
//                     padding: EdgeInsets.symmetric(vertical: 8.h),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(8.r),
//                       child: CustomNetworkImageWidget(
//                         urls: "$imageUrl${add.adds?.image}",
//                         fit: BoxFit.cover,
//                         height: double.infinity,
//                         width: double.infinity,
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               Positioned(
//                 bottom: 8.h,
//                 right: 10.w,
//                 child: _buildDotIndicators(ads),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Column _buildDotIndicators(List<ProductAddResponseModel> ads) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: List.generate(ads.length, (index) {
//         final isActive = _currentIndex == index;
//         return AnimatedContainer(
//           duration: const Duration(milliseconds: 300),
//           width: isActive ? 10.w : 8.w,
//           height: isActive ? 10.h : 8.h,
//           margin: EdgeInsets.symmetric(vertical: 4.h),
//           decoration: BoxDecoration(
//             color: isActive ? AppColors.primaryColor : AppColors.cFFFFFF,
//             border: Border.all(
//               color: AppColors.primaryColor.withOpacity(0.6),
//             ),
//             borderRadius: BorderRadius.circular(50.r),
//           ),
//         );
//       }),
//     );
//   }
// }
import 'dart:async';

import 'package:feature_based_mvvm_architecture/app/provider/home_product_add_provider.dart';
import 'package:feature_based_mvvm_architecture/features/Home/model/product_add_response_model.dart';
import 'package:feature_based_mvvm_architecture/gen/colors.gen.dart';
import 'package:feature_based_mvvm_architecture/shared/networks/endpoints.dart';
import 'package:feature_based_mvvm_architecture/shared/widgets/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeSlider2 extends StatefulWidget {
  const HomeSlider2({super.key});

  @override
  State<HomeSlider2> createState() => _HomeSlider2State();
}

class _HomeSlider2State extends State<HomeSlider2> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  Timer? _autoSlideTimer;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _autoSlideTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      final provider = context.read<HomeProductAddProvider>();
      final ads = provider.addList;

      if (ads.isNotEmpty && _pageController.hasClients) {
        int nextPage = (_currentIndex + 1) % ads.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void dispose() {
    _autoSlideTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProductAddProvider>(
      builder: (context, provider, child) {
        final ads = provider.addList;

        if (ads.isEmpty) {
          return const SizedBox.shrink();
        }

        return SizedBox(
          height: 130.h,
          child: Stack(
            children: [
              PageView.builder(
                scrollDirection: Axis.vertical,
                controller: _pageController,
                itemCount: ads.length,
                onPageChanged: _onPageChanged,
                itemBuilder: (context, index) {
                  final add = ads[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: CustomNetworkImageWidget(
                        urls: "$imageUrl${add.adds?.image}",
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                    ),
                  );
                },
              ),
              Positioned(
                bottom: 8.h,
                right: 10.w,
                child: _buildDotIndicators(ads),
              ),
            ],
          ),
        );
      },
    );
  }

  Column _buildDotIndicators(List<ProductAddResponseModel> ads) {
    int total = ads.length;

    int start = 0;
    int end = total;

    if (total > 3) {
      if (_currentIndex <= 1) {
        start = 0;
        end = 3;
      } else if (_currentIndex >= total - 2) {
        start = total - 3;
        end = total;
      } else {
        start = _currentIndex - 1;
        end = _currentIndex + 2;
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(end - start, (i) {
        int actualIndex = start + i;
        final isActive = actualIndex == _currentIndex;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: isActive ? 10.w : 8.w,
          height: isActive ? 10.h : 8.h,
          margin: EdgeInsets.symmetric(vertical: 4.h),
          decoration: BoxDecoration(
            color: isActive ? AppColors.primaryColor : AppColors.cFFFFFF,
            border: Border.all(color: AppColors.primaryColor.withOpacity(0.6)),
            borderRadius: BorderRadius.circular(50.r),
          ),
        );
      }),
    );
  }
}
