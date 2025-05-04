import 'package:feature_based_mvvm_architecture/app/constants/text_font_style.dart';
import 'package:feature_based_mvvm_architecture/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationSetting extends StatefulWidget {
  const NotificationSetting({super.key});

  @override
  State<NotificationSetting> createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSetting> {
  bool _showNotifications = true;
  bool _notificationSounds = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        foregroundColor: AppColors.c202020,
        title: Text(
          'Notifications',
          textAlign: TextAlign.center,
          style: TextFontStyle.headline12w600c0C89BFstyleLexend.copyWith(
            fontSize: 20.sp,
            color: AppColors.c202020,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NotificationSettingTile(
              title: 'Show Notifications',
              subtitle: 'Receive push notifications for new messages',
              value: _showNotifications,
              onChanged: (bool value) {
                setState(() {
                  _showNotifications = value;
                });
              },
            ),
            SizedBox(height: 16.h),
            NotificationSettingTile(
              title: 'Notification Sounds',
              subtitle: 'Play sound for new messages',
              value: _notificationSounds,
              onChanged: (bool value) {
                setState(() {
                  _notificationSounds = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationSettingTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const NotificationSettingTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextFontStyle.headline12w400cF1F1F1styleLexend.copyWith(
                  fontSize: 14.sp,
                  color: AppColors.c202020,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                subtitle,
                style: TextFontStyle.headline12w300cB6B6B6styleLexend.copyWith(
                  fontSize: 11.sp,
                  color: AppColors.cB6B6B6,
                ),
              ),
            ],
          ),
        ),
        Switch.adaptive(
          value: value,
          onChanged: onChanged,
          activeColor: AppColors.primaryColor,
        ),
      ],
    );
  }
}
