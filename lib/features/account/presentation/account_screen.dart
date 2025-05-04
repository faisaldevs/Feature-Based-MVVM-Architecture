// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:feature_based_mvvm_architecture/app/constants/app_constants.dart';
import 'package:feature_based_mvvm_architecture/app/constants/text_font_style.dart';
import 'package:feature_based_mvvm_architecture/app/router/config/route_extention.dart';
import 'package:feature_based_mvvm_architecture/features/auth/data/services/login_local_service.dart';
import 'package:feature_based_mvvm_architecture/features/auth/presentation/login/view_model/login_view_model.dart';
import 'package:feature_based_mvvm_architecture/gen/assets.gen.dart';
import 'package:feature_based_mvvm_architecture/gen/colors.gen.dart';
import 'package:feature_based_mvvm_architecture/navigation_screen.dart';
import 'package:feature_based_mvvm_architecture/utils/di.dart';
import 'package:feature_based_mvvm_architecture/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  List generalInfo = [
    {
      "icon": Assets.icons.profile,
      "name": "Profile Info",
      "subName": "Edit your account information",
    },
    {
      "icon": Assets.icons.sequrity,
      "name": "Security & Password",
      "subName": "Change password",
    },
  ];

  List settingInfo = [
    {"icon": Assets.icons.notification, "name": "Notifications"},
    {"icon": Assets.icons.privecyandsequrety, "name": "Privacy & Policy"},
    {"icon": Assets.icons.contactUs, "name": "Contact Us"},
    {"icon": Assets.icons.deleteAccount, "name": "Delete Account"},
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(
      builder: (context, vm, _) {
        return vm.isLogin
            ? Scaffold(
              backgroundColor: AppColors.cFFFFFF,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                foregroundColor: AppColors.c202020,
                title: Text(
                  'My Account',
                  textAlign: TextAlign.center,
                  style: TextFontStyle.headline12w600c0C89BFstyleLexend
                      .copyWith(fontSize: 20.sp, color: AppColors.c202020),
                ),
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                padding: EdgeInsets.all(16.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'General',
                      textAlign: TextAlign.center,
                      style: TextFontStyle.headline12w500c0C89BFstyleLexend
                          .copyWith(fontSize: 14.sp, color: AppColors.c1F1F1F),
                    ),
                    UIHelper.verticalSpaceSmall,
                    ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return _buildGenaralTile(
                          onTap: () {
                            if (index == 0) {
                              log("message");
                              // goAccountDetails(context);
                              nav.toAccountDetails();
                            } else {
                              // goChangePassword(context);
                              nav.toChangePassword();
                            }
                          },
                          icon: generalInfo[index]["icon"],
                          name: generalInfo[index]["name"],
                          subName: generalInfo[index]["subName"],
                        );
                      },
                      separatorBuilder:
                          (context, index) => UIHelper.verticalSpaceSmall,
                      itemCount: generalInfo.length,
                    ),
                    UIHelper.verticalSpaceMedium,
                    Text(
                      'Setting',
                      textAlign: TextAlign.center,
                      style: TextFontStyle.headline12w500c0C89BFstyleLexend
                          .copyWith(fontSize: 14.sp, color: AppColors.c1F1F1F),
                    ),
                    UIHelper.verticalSpaceSmall,
                    ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.all(0),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return _buildGenaralTile(
                          onTap: () {
                            if (index == 0) {
                              // goNotificationSetting(context);
                              nav.toNotificationSetting();
                            } else {}
                          },
                          icon: settingInfo[index]["icon"],
                          name: settingInfo[index]["name"],
                        );
                      },
                      separatorBuilder:
                          (context, index) => UIHelper.verticalSpaceSmall,
                      itemCount: settingInfo.length,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Row(
                    //       children: [
                    //         // SvgPicture.asset(
                    //         //   Assets.icons.logout,
                    //         //   color: AppColors.c202020,
                    //         //   width: 40.w,
                    //         //   height: 40.h,
                    //         //   fit: BoxFit.cover,
                    //         // ),
                    //         Icon(
                    //           Icons.language,
                    //           size: 40.sp,
                    //           color: AppColors.c000000.withValues(alpha: .6),
                    //         ),
                    //         UIHelper.horizontalSpaceSmall,
                    //         Text('Localization',
                    //             textAlign: TextAlign.center,
                    //             style: TextFontStyle
                    //                 .headline12w500c0C89BFstyleLexend
                    //                 .copyWith(
                    //                     color: AppColors.c202020,
                    //                     fontSize: 14.sp))
                    //       ],
                    //     ),
                    //     // Switch.adaptive(
                    //     //   value: true,
                    //     //   onChanged: (value) {},
                    //     // ),
                    //     Consumer<CurrentData>(
                    //       builder: (context, currentData, child) {
                    //         return DropdownButton<String>(
                    //           value: currentData.defineCurrentLanguage(context),
                    //           icon: Icon(Icons.arrow_downward,
                    //               color: Colors.white),
                    //           iconSize: 20,
                    //           elevation: 0,
                    //           style: TextStyle(color: AppColors.c000000),
                    //           dropdownColor: AppColors.cF6F6F6,
                    //           onChanged: (newValue) =>
                    //               currentData.changeLocale(newValue!),
                    //           items: LanguageHelper.languages.map((lang) {
                    //             return DropdownMenuItem<String>(
                    //               value: lang,
                    //               child: Text(lang),
                    //             );
                    //           }).toList(),
                    //         );
                    //       },
                    //     ),
                    //   ],
                    // ),
                    UIHelper.verticalSpaceSmall,
                    GestureDetector(
                      onTap: () async {
                        await LoginLocalService.removeLoginItem();

                        await vm.checklogin(false);
                        // await totalDataClean();
                        await appData.write(kKeyIsLoggedIn, false);
                        // goWelcome(context);
                        nav.toWelcome();
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            Assets.icons.logout,
                            color: const Color(0xFFEC1313),
                            width: 40.w,
                            height: 40.h,
                            fit: BoxFit.cover,
                          ),
                          UIHelper.horizontalSpaceSmall,
                          Text(
                            'Log Out',
                            textAlign: TextAlign.center,
                            style: TextFontStyle
                                .headline12w500c0C89BFstyleLexend
                                .copyWith(
                                  color: const Color(0xFFEC1313),
                                  fontSize: 14.sp,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
            : UserGenaralPage();
      },
    );
  }

  _buildGenaralTile({
    required String icon,
    required String name,
    String? subName,
    required VoidCallback? onTap,
  }) {
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      overlayColor: WidgetStatePropertyAll(Colors.transparent),
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                icon,
                color:
                    name == "Delete Account"
                        ? const Color(0xFFEC1313)
                        : Color(0xFF737373),
                width: 40.w,
                height: 40.h,
                fit: BoxFit.cover,
              ),
              UIHelper.horizontalSpaceSmall,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      textAlign: TextAlign.center,
                      style: TextFontStyle.headline12w500c0C89BFstyleLexend
                          .copyWith(
                            fontSize: 14.sp,
                            color:
                                name == "Delete Account"
                                    ? const Color(0xFFEC1313)
                                    : AppColors.c1F1F1F,
                          ),
                    ),
                    subName == null
                        ? SizedBox.shrink()
                        : Text(
                          subName,
                          textAlign: TextAlign.center,
                          style: TextFontStyle.headline12w400cF1F1F1styleLexend
                              .copyWith(color: AppColors.cB6B6B6),
                        ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: AppColors.cB6B6B6),
            ],
          ),
          UIHelper.verticalSpaceSmall,
          Divider(),
        ],
      ),
    );
  }
}
