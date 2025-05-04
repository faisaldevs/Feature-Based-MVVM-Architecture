import 'dart:developer';

import 'package:feature_based_mvvm_architecture/app/constants/app_constants.dart';
import 'package:feature_based_mvvm_architecture/app/constants/text_font_style.dart';
import 'package:feature_based_mvvm_architecture/app/router/config/route_extention.dart';
import 'package:feature_based_mvvm_architecture/database/service/cart/cart_local_service.dart';
import 'package:feature_based_mvvm_architecture/features/cart/presentation/view_model/cart_view_model.dart';
import 'package:feature_based_mvvm_architecture/features/cart/presentation/widgets/cart_item_widget.dart';
import 'package:feature_based_mvvm_architecture/features/cart/presentation/widgets/custom_appbar_widget.dart';
import 'package:feature_based_mvvm_architecture/gen/colors.gen.dart';
import 'package:feature_based_mvvm_architecture/utils/di.dart';
import 'package:feature_based_mvvm_architecture/utils/toast.dart';
import 'package:feature_based_mvvm_architecture/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool _isCoupon = false;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CartViewModel>(context, listen: false).loadCartItems();
    });
  }

  // void _handleDrawerTap() => scaffoldKey.currentState?.openDrawer();

  void _handleCheckout(CartViewModel provider) {
    final isLoggedIn = appData.read(kKeyIsLoggedIn) == true;

    if (provider.selectedItemIds.isEmpty) {
      ToastUtil.showShortToast("Select an item first...");
    } else if (!isLoggedIn) {
      // goLogin(context);
      nav.toLogin();
    } else {
      // log("Proceeding to checkout with selected items...");
      nav.toCart();

      log("${provider.selectedItem()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CartViewModel>();

    return SafeArea(
      child: Column(
        children: [
          CustomAppBar(
            cartItemCount: provider.cartItems.length,
            onWishlistTap: () => nav.toWishlist(),
            onDeleteTap: () async {
              await CartLocalService.removeFromCart(
                cartItems: provider.cartItems,
                itemIdsToRemove: provider.selectedItemIds.toList(),
              );
              provider.refreshCart();
            },
            showDeleteIcon: provider.selectedItemIds.isNotEmpty,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child:
                        provider.cartItems.isEmpty
                            ? buildEmptyCart()
                            : ListView.separated(
                              itemBuilder: (context, index) {
                                final item = provider.cartItems[index];

                                // provider.selectedItemIds
                                //     .putIfAbsent(index, () => item.quantity);

                                return CartItemWidget(
                                  itemId: item.id,
                                  productName: item.name,
                                  currentPrice: item.price.toString(),
                                  oldPrice: "",
                                  image: item.imageUrl.first,
                                  quantity: item.quantity,
                                  itemIndex: index,
                                );
                              },
                              itemCount: provider.cartItems.length,
                              separatorBuilder:
                                  (context, index) =>
                                      UIHelper.verticalSpaceSmall,
                            ),
                  ),
                  provider.cartItems.isEmpty
                      ? SizedBox.shrink()
                      : Column(
                        children: [
                          _buildCouponSection(),
                          Divider(thickness: 1.w),
                          _buildFooter(provider),
                        ],
                      ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCouponSection() {
    return Column(
      children: [
        InkWell(
          onTap: () => setState(() => _isCoupon = !_isCoupon),
          child: Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'If you have any coupon code input here!',
                  style: TextFontStyle.headline12w300cB6B6B6styleLexend
                      .copyWith(fontSize: 10.sp, color: AppColors.c202020),
                ),
                Icon(Icons.keyboard_arrow_down_rounded, size: 16.sp),
              ],
            ),
          ),
        ),
        if (_isCoupon)
          SizedBox(
            width: MediaQuery.of(context).size.width * .70,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 0.sp,
                        horizontal: 10.w,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2.r),
                        borderSide: BorderSide(
                          width: 1.w,
                          color: AppColors.cF0F0F0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2.r),
                        borderSide: BorderSide(
                          width: 1.w,
                          color: AppColors.cF0F0F0,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.w),
                  padding: EdgeInsets.symmetric(
                    vertical: 12.sp,
                    horizontal: 24.w,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.c202020,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Text(
                    'Apply',
                    style: TextFontStyle.headline12w500c0C89BFstyleLexend
                        .copyWith(color: AppColors.cFFFFFF, fontSize: 11.sp),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildFooter(CartViewModel provider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              activeColor: AppColors.primaryColor,
              visualDensity: VisualDensity.compact,
              splashRadius: 0,
              value: provider.isAllSelected(),
              onChanged: (value) {
                if (provider.isAllSelected()) {
                  provider.deselectAll();
                } else {
                  provider.selectAll();
                }
              },
            ),
            Text(
              'Select All',
              style: TextFontStyle.headline12w300cB6B6B6styleLexend.copyWith(
                fontSize: 10.sp,
                color: AppColors.c9F9F9F,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Subtotal: ৳ ${provider.totalPrice}',
                  style: TextFontStyle.headline12w500c0C89BFstyleLexend
                      .copyWith(fontSize: 11.sp, color: AppColors.c202020),
                ),
                Text(
                  'Shipping Fee: ৳ 74,000',
                  style: TextFontStyle.headline12w300cB6B6B6styleLexend
                      .copyWith(fontSize: 8.sp),
                ),
              ],
            ),
            GestureDetector(
              onTap: () => _handleCheckout(provider),
              child: Container(
                margin: EdgeInsets.only(left: 10.w),
                padding: EdgeInsets.all(10.sp),
                decoration: BoxDecoration(color: AppColors.primaryColor),
                child: Text(
                  'Checkout (${provider.selectedItemIds.length})',
                  style: TextFontStyle.headline12w500c0C89BFstyleLexend
                      .copyWith(color: AppColors.cFFFFFF, fontSize: 11.sp),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildEmptyCart() {
    return SingleChildScrollView(
      child: Column(
        children: [
          UIHelper.verticalSpaceLarge,
          Container(
            width: 120.w,
            height: 120.h,
            decoration: const ShapeDecoration(
              color: Color(0xFFD9D9D9),
              shape: OvalBorder(),
            ),
          ),
          UIHelper.verticalSpaceMedium,
          Text(
            'Your Cart is Empty!',
            textAlign: TextAlign.center,
            style: TextFontStyle.headline12w600c0C89BFstyleLexend.copyWith(
              fontSize: 18.sp,
              color: AppColors.c1F1F1F,
            ),
          ),
          UIHelper.verticalSpaceSmall,
          Text(
            'Your cart is empty!\nAdd something awesome and find it here.',
            textAlign: TextAlign.center,
            style: TextFontStyle.headline12w400cF1F1F1styleLexend.copyWith(
              fontSize: 15.sp,
              color: AppColors.c1F1F1F,
            ),
          ),
          UIHelper.verticalSpaceLarge,
          GestureDetector(
            onTap: () => nav.toNavigation(),
            child: Container(
              width: 240.w,
              decoration: BoxDecoration(color: AppColors.primaryColor),
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
              child: Text(
                'Explore Items',
                textAlign: TextAlign.center,
                style: TextFontStyle.headline12w400cF1F1F1styleLexend.copyWith(
                  fontSize: 16.sp,
                  color: AppColors.cFFFFFF,
                ),
              ),
            ),
          ),
          UIHelper.verticalSpaceLarge,
        ],
      ),
    );
  }
}
