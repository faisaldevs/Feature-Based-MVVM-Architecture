import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerItemCardWidget extends StatelessWidget {
  const ShimmerItemCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        padding: EdgeInsets.all(7.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.r),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: SizedBox(
          width: 150.w,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: 150.w,
                    height: 160.h,
                    color: Colors.white,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.sp),
                        margin: EdgeInsets.all(8.sp),
                        color: Colors.white,
                        width: 40.w,
                        height: 15.h,
                      ),
                      Container(
                        margin: EdgeInsets.all(8.sp),
                        width: 16.w,
                        height: 16.h,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 7.h),
              Container(
                width: double.infinity,
                height: 30.h,
                color: Colors.white,
              ),
              SizedBox(height: 7.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40.w,
                            height: 10.h,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5.w),
                          Container(
                            width: 40.w,
                            height: 10.h,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        children: [
                          Container(
                            width: 70.w,
                            height: 10.h,
                            color: Colors.white,
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                    width: 24.w,
                    height: 24.h,
                    color: Colors.white,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
