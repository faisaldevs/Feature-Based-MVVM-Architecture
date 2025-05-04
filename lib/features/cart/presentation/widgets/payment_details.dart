// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:feature_based_mvvm_architecture/app/constants/text_font_style.dart';
import 'package:feature_based_mvvm_architecture/app/provider/checkout_provider.dart';
import 'package:feature_based_mvvm_architecture/gen/colors.gen.dart';
import 'package:feature_based_mvvm_architecture/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({super.key});

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  String? _selectedValue = 'Online Payment';
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: SizedBox(
        height:
            MediaQuery.of(context).size.height -
            (MediaQuery.of(context).size.height * .3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10.sp),
              decoration: BoxDecoration(
                color: AppColors.cFFFFFF,
                borderRadius: BorderRadius.circular(2.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.c202020.withOpacity(.05),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  RadioListTile<String>(
                    title: const Text('Online Payment'),
                    value: 'Online Payment',
                    groupValue: _selectedValue,
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value;
                      });
                    },
                  ),
                  const Divider(),
                  RadioListTile<String>(
                    title: const Text('Cash On Delivery'),
                    value: 'Cash On Delivery',
                    groupValue: _selectedValue,
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                UIHelper.verticalSpaceSmall,
                _buildSummaryRow('Sub Total', '\$0.00'),
                UIHelper.verticalSpaceSmall,
                _buildSummaryRow('Shipping', '\$0.00'),
                UIHelper.verticalSpaceSmall,
                _buildSummaryRow('Tax', '\$0.00'),
                UIHelper.verticalSpaceSmall,
                _buildSummaryRow('Discount', '\$0.00'),
                UIHelper.verticalSpaceSmall,
                const Divider(color: AppColors.c7F7F7F),
                UIHelper.verticalSpaceSmall,
                _buildSummaryRow('Total', '\$0.00'),
                UIHelper.verticalSpaceMedium,
                _buildButton(
                  'Back to Checkout Details',
                  onTap:
                      () => context.read<CheckoutProvider>().previousStep(
                        context,
                      ),
                ),
                UIHelper.verticalSpaceSmall,
                _buildButton(
                  'Submit Payment',
                  primary: true,
                  onTap: () async {},
                ),
              ],
            ),
          ],
        ),
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
}
