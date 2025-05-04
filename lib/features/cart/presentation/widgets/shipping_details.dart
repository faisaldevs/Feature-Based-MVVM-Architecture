import 'package:feature_based_mvvm_architecture/app/constants/text_font_style.dart';
import 'package:feature_based_mvvm_architecture/app/provider/checkout_provider.dart';
import 'package:feature_based_mvvm_architecture/app/router/config/route_extention.dart';
import 'package:feature_based_mvvm_architecture/features/cart/presentation/view_model/checkout_view_model.dart';
import 'package:feature_based_mvvm_architecture/gen/colors.gen.dart';
import 'package:feature_based_mvvm_architecture/shared/widgets/custom_dropdown_button.dart';
import 'package:feature_based_mvvm_architecture/shared/widgets/custom_form_field.dart';
import 'package:feature_based_mvvm_architecture/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ShippingDetails extends StatefulWidget {
  const ShippingDetails({super.key});

  @override
  State<ShippingDetails> createState() => _ShippingDetailsState();
}

class _ShippingDetailsState extends State<ShippingDetails> {
  final nameCnt = TextEditingController();
  final noteCnt = TextEditingController();
  final phoneCnt = TextEditingController();
  final countryCnt = TextEditingController();
  final zipCnt = TextEditingController();
  final deliveryAddressCnt = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers to free up resources
    nameCnt.dispose();
    noteCnt.dispose();
    phoneCnt.dispose();
    countryCnt.dispose();
    zipCnt.dispose();
    deliveryAddressCnt.dispose();
    super.dispose();
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextFontStyle.headline12w400cF1F1F1styleLexend.copyWith(
        color: AppColors.c202020,
      ),
    );
  }

  Widget _buildFormField(
    TextEditingController controller, {
    TextInputType inputType = TextInputType.text,
    String? label,
  }) {
    return CustomFormField(
      maxline: label == null ? 1 : 3,
      controller: controller,
      fillColor: AppColors.cF3F3F3,
      borderRadius: 2.r,
      inputType: inputType,
    );
  }

  Widget _buildDropDown(TextEditingController controller) {
    return SizedBox(
      width: double.infinity,
      child: Consumer<CheckoutViewModel>(
        builder: (context, vm, _) {
          return CustomDropdownButton(
            borderRadius: 2.r,
            selectedValue: vm.selectedLocation,
            borderColor: AppColors.cACB7BD,
            fillColor: AppColors.cF3F3F3,
            isFilled: true,
            items: vm.locationList,
            onChanged: (value) => vm.toggleLocation(value),
          );
        },
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextFontStyle.headline14w400c7F7F7FstyleLexend),
        Text(value, style: TextFontStyle.headline14w400c7F7F7FstyleLexend),
      ],
    );
  }

  Widget _buildButton(
    String text, {
    bool primary = false,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.sp),
        width: double.infinity,
        decoration: BoxDecoration(
          color: primary ? AppColors.primaryColor : null,
          borderRadius: BorderRadius.circular(2.sp),
          border: Border.all(color: AppColors.cF0F0F0),
        ),
        child: Center(
          child: Text(
            text,
            style: TextFontStyle.headline12w500c0C89BFstyleLexend.copyWith(
              color: primary ? AppColors.cFFFFFF : null,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Shipping Address',
            style: TextFontStyle.headline12w600c0C89BFstyleLexend.copyWith(
              fontSize: 16.sp,
              color: AppColors.c202020,
            ),
          ),
          UIHelper.verticalSpaceMedium,
          _buildLabel('Full Name'),
          UIHelper.verticalSpace(8.h),
          _buildFormField(nameCnt),
          UIHelper.verticalSpaceMedium,
          _buildLabel('Phone Number'),
          UIHelper.verticalSpace(8.h),
          _buildFormField(phoneCnt),
          UIHelper.verticalSpaceMedium,
          _buildLabel('Location'),
          UIHelper.verticalSpace(8.h),
          _buildDropDown(countryCnt),
          UIHelper.verticalSpaceMedium,
          _buildLabel('Delivery Address'),
          UIHelper.verticalSpace(8.h),
          _buildFormField(deliveryAddressCnt, label: ""),
          UIHelper.verticalSpaceMedium,
          _buildLabel('Note'),
          UIHelper.verticalSpace(8.h),
          _buildFormField(noteCnt, label: ""),
          UIHelper.verticalSpaceMedium,
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              UIHelper.verticalSpaceSmall,
              _buildSummaryRow('Sub Total', '\$0.00'),
              UIHelper.verticalSpaceSmall,
              _buildSummaryRow('Discount', '\$0.00'),
              UIHelper.verticalSpaceSmall,
              const Divider(color: AppColors.c7F7F7F),
              UIHelper.verticalSpaceSmall,
              _buildSummaryRow('Total', '\$0.00'),
              UIHelper.verticalSpaceMedium,
              _buildButton('Back to Cart', onTap: () => nav.goBack()),
              UIHelper.verticalSpaceSmall,
              _buildButton(
                'Proceed to Payment',
                primary: true,
                onTap: () {
                  final vm = Provider.of<CheckoutViewModel>(
                    context,
                    listen: false,
                  );

                  if (nameCnt.text.isEmpty ||
                      phoneCnt.text.isEmpty ||
                      deliveryAddressCnt.text.isEmpty ||
                      vm.selectedLocation == "Select Location") {
                    return;
                  }

                  Map data = {
                    "name": nameCnt.text,
                    "phone": phoneCnt.text,
                    "location": vm.selectedLocation,
                    "deliveryAddress": deliveryAddressCnt.text,
                    "note": noteCnt.text,
                  };

                  vm.shippingDetals.addAll(data);
                  context.read<CheckoutProvider>().nextStep();
                },
              ),
            ],
          ),
          UIHelper.verticalSpaceSmall,
        ],
      ),
    );
  }
}
