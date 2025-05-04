import 'package:feature_based_mvvm_architecture/features/Home/presentation/widgets/best_selling_listview_widget.dart';
import 'package:feature_based_mvvm_architecture/features/Home/presentation/widgets/catagory_gridview_widget.dart';
import 'package:feature_based_mvvm_architecture/features/Home/presentation/widgets/collection_tile_widget.dart';
import 'package:feature_based_mvvm_architecture/features/Home/presentation/widgets/home_appbar_widget.dart';
import 'package:feature_based_mvvm_architecture/features/Home/presentation/widgets/home_slider_2.dart';
import 'package:feature_based_mvvm_architecture/features/Home/presentation/widgets/item_wise_listview_widget.dart';
import 'package:feature_based_mvvm_architecture/features/Home/presentation/widgets/new_arrival_listview_widget.dart';
import 'package:feature_based_mvvm_architecture/gen/assets.gen.dart';
import 'package:feature_based_mvvm_architecture/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imageList = [
    Assets.images.sliderItem1.path,
    Assets.images.sliderItem1.path,
    Assets.images.sliderItem1.path,
    Assets.images.sliderItem1.path,
  ];

  List offerText = [
    ["Zero shipping cost", "on selected products"],
    ["Lightning-fast delivery", "quick & hassle-free"],
    ["Hassle-free returns", "shop with confidence"],
  ];

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   Provider.of<HomeProductAddProvider>(context, listen: false).getData();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        // scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
        child: Column(
          children: [
            UIHelper.verticalSpaceSmall,
            HomeAppbarWidget(), // Appbar Widget
            NewArrivalsListviewWidget(), // New Arrivals
            UIHelper.verticalSpace(20.h),

            // OurOffersWidget(offerText: offerText),
            // UIHelper.verticalSpace(14.h),
            // BrandSliderWidget(items: offerText),
            // UIHelper.verticalSpace(14.h),
            // UIHelper.verticalSpace(14.h),
            CollectionTileWidget(),
            UIHelper.verticalSpace(14.h),
            HomeSlider2(),
            UIHelper.verticalSpace(14.h),
            BestSellingListviewWidget(), // New Arrivals
            UIHelper.verticalSpace(14.h),
            ItemWiseListviewWidget(),
            UIHelper.verticalSpace(14.h),
            CatagoryGridviewWidget(),
            UIHelper.verticalSpace(14.h),
          ],
        ),
      ),
    );
  }
}
