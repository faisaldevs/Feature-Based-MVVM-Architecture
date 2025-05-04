import 'package:easy_stepper/easy_stepper.dart';
import 'package:feature_based_mvvm_architecture/app/constants/text_font_style.dart';
import 'package:feature_based_mvvm_architecture/app/provider/checkout_provider.dart';
import 'package:feature_based_mvvm_architecture/features/cart/presentation/widgets/payment_details.dart';
import 'package:feature_based_mvvm_architecture/features/cart/presentation/widgets/review_details.dart';
import 'package:feature_based_mvvm_architecture/features/cart/presentation/widgets/shipping_details.dart';
import 'package:feature_based_mvvm_architecture/gen/assets.gen.dart';
import 'package:feature_based_mvvm_architecture/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    final checkoutProvider = Provider.of<CheckoutProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      // appBar: _buildAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            SizedBox(
              height: 75.h,
              child: EasyStepper(
                enableStepTapping: false,
                activeStep: Provider.of<CheckoutProvider>(context).activeStep,
                stepShape: StepShape.rRectangle,
                stepBorderRadius: 15,
                showStepBorder: false,
                stepRadius: 28,
                finishedStepBackgroundColor: AppColors.cFFFFFF,
                activeStepIconColor: AppColors.cFFFFFF,
                fitWidth: true,
                disableScroll: true,
                steps: List.generate(
                  3,
                  (index) => EasyStep(
                    customStep: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: SvgPicture.asset(
                        [
                          Assets.icons.shipping,
                          Assets.icons.payment,
                          Assets.icons.review,
                        ][index],
                        height: 40.sp,
                        width: 40.sp,
                        fit: BoxFit.contain,
                        color:
                            index <=
                                    Provider.of<CheckoutProvider>(
                                      context,
                                    ).activeStep
                                ? AppColors.primaryColor
                                : AppColors.c9C9C9C,
                      ),
                    ),
                    customTitle: Center(
                      child: Text(["Shipping", "Payment", "Review"][index]),
                    ),
                  ),
                ),
                onStepReached: Provider.of<CheckoutProvider>(context).setStep,
              ),
            ),
            Expanded(child: _getStepContent(checkoutProvider.activeStep)),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      color: AppColors.cFFFFFF,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, size: 24.w, color: AppColors.c202020),
            onPressed:
                () => context.read<CheckoutProvider>().previousStep(context),
          ),
          Expanded(
            child: Text(
              'Checkout',
              textAlign: TextAlign.center,
              style: TextFontStyle.headline12w600c0C89BFstyleLexend.copyWith(
                fontSize: 20.sp,
                color: AppColors.c202020,
              ),
            ),
          ),
          SizedBox(width: 48.w),
        ],
      ),
    );
  }

  /// 📌 Content Based on Active Step
  Widget _getStepContent(int step) {
    switch (step) {
      case 0:
        return const ShippingDetails();
      case 1:
        return const PaymentDetails();
      case 2:
        return const ReviewDetails();
      default:
        return const Center(child: Text("Invalid Step"));
    }
  }
}
