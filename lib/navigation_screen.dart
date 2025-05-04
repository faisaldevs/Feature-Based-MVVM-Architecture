import 'dart:math';

import 'package:feature_based_mvvm_architecture/app/constants/app_constants.dart';
import 'package:feature_based_mvvm_architecture/app/constants/text_font_style.dart';
import 'package:feature_based_mvvm_architecture/app/router/config/route_extention.dart';
import 'package:feature_based_mvvm_architecture/database/model/cart/cart_items.dart';
import 'package:feature_based_mvvm_architecture/features/Home/presentation/view/home_screen.dart';
import 'package:feature_based_mvvm_architecture/features/account/presentation/account_screen.dart';
import 'package:feature_based_mvvm_architecture/features/cart/presentation/view/cart_screen.dart';
import 'package:feature_based_mvvm_architecture/features/category/presentation/category_screen.dart';
import 'package:feature_based_mvvm_architecture/gen/assets.gen.dart';
import 'package:feature_based_mvvm_architecture/gen/colors.gen.dart';
import 'package:feature_based_mvvm_architecture/utils/di.dart';
import 'package:feature_based_mvvm_architecture/utils/helper_methods.dart';
import 'package:feature_based_mvvm_architecture/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';

final class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key, this.initialIndex = 0});

  final int initialIndex;

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // int _currentIndex = 0;
  late int _currentIndex; // <-- change this to late

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex; // <-- initialize with passed index
  }

  final List<Widget> _screens = const [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    AccountScreen(),
  ];

  final List<Map<String, String>> _navItems = [
    {"label": "Home", "icon": Assets.icons.home},
    {"label": "Category", "icon": Assets.icons.category},
    {"label": "Cart", "icon": Assets.icons.cart},
    {"label": "Account", "icon": Assets.icons.account},
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async => showMaterialDialog(context),
      child: Scaffold(
        key: _scaffoldKey,
        // backgroundColor: AppColors.cFFFFFF,
        body: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.50, 0.89),
              end: Alignment(0.50, 0.00),
              colors: [AppColors.cFFFFFF, AppColors.cFCFCFC],
            ),
          ),
          child: _screens[_currentIndex],
        ),
        bottomNavigationBar: _buildBottomNavigationBar(),
        // drawer: const DrawerWidget(),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      color: AppColors.cFAFAFA,
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
      ).copyWith(top: 10.h, bottom: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(min(_screens.length, _navItems.length), (
          index,
        ) {
          final item = _navItems[index];
          final isSelected = _currentIndex == index;
          final label = item['label']!;
          final icon = item['icon']!;

          if (label == "Cart") {
            return _CartButton(
              icon: icon,
              label: label,
              isSelected: isSelected,
              onTap: () => _onItemTap(index),
            );
          }

          return GestureDetector(
            onTap: () => _onItemTap(index),
            child: _NavButton(icon: icon, label: label, isSelected: isSelected),
          );
        }),
      ),
    );
  }

  void _onItemTap(int index) {
    final label = _navItems[index]['label'];
    if (label == "Account" && appData.read(kKeyIsLoggedIn) != true) {
      // goLogin(context);
      nav.toLogin();

      return;
    }
    setState(() => _currentIndex = index);
  }
}

class _CartButton extends StatelessWidget {
  final String icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _CartButton({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ValueListenableBuilder<Box>(
        valueListenable: hiveBox.listenable(),
        builder: (context, box, _) {
          final cartItems =
              (box.get(kKeyCartItems, defaultValue: []) as List)
                  .cast<CartItems>();
          return _NavButton(
            icon: icon,
            label: label,
            isSelected: isSelected,
            badgeCount: cartItems.length,
          );
        },
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final String icon;
  final String label;
  final bool isSelected;
  final int badgeCount;

  const _NavButton({
    required this.icon,
    required this.label,
    required this.isSelected,
    this.badgeCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    final showBadge = label == "Cart" && badgeCount > 0;

    return Padding(
      padding: EdgeInsets.all(8.sp),
      child: Badge.count(
        count: badgeCount,
        isLabelVisible: showBadge,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              icon,
              height: 28.h,
              width: 28.w,
              color: isSelected ? AppColors.primaryColor : AppColors.c737373,
              fit: BoxFit.cover,
            ),
            UIHelper.verticalSpace(2.h),
            Text(
              label,
              style: TextFontStyle.headline12w600c0C89BFstyleLexend.copyWith(
                color: isSelected ? AppColors.primaryColor : AppColors.c737373,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserGenaralPage extends StatelessWidget {
  const UserGenaralPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "No User Logged In!",
            style: TextFontStyle.headline12w600c0C89BFstyleLexend,
          ),
          UIHelper.verticalSpaceMedium,
          GestureDetector(
            onTap: () => nav.toLogin(),
            child: Container(
              padding: EdgeInsets.all(14.sp),
              width: 150.w,
              decoration: BoxDecoration(color: AppColors.primaryColor),
              child: Center(
                child: Text(
                  "Login",
                  style: TextFontStyle.headline12w600c0C89BFstyleLexend
                      .copyWith(color: AppColors.cFEFFFE),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
