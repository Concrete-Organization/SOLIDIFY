import 'package:flutter/material.dart';
import 'package:solidify/core/theming/color_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solidify/core/widgets/notifications_list_view_item.dart';


class NotificationsListView extends StatelessWidget {
  const NotificationsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: 4,
      separatorBuilder: (context, index) {
        if (index >= 2) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Divider(
              height: 1.h,
              color: ColorsManager.mainBlueWith2Opacity,
              thickness: 0.5.w,
            ),
          );
        }
        return const SizedBox.shrink();
      },
      itemBuilder: (context, index) {
        return NotificationsListViewItem(
          title: _getTitle(index),
          message: _getMessage(index),
          timeAgo: _getTimeAgo(index),
          isHighlighted: index < 2,
        );
      },
    );
  }

  String _getTitle(int index) {
    switch (index) {
      case 0:
        return 'New Order Received! 🌟️';
      case 1:
        return 'Order Dispatched 🚚';
      case 2:
        return 'Unusual Login Detected 🔒';
      case 3:
        return 'System Maintenance 🛠️';
      default:
        return 'Notification';
    }
  }

  String _getMessage(int index) {
    switch (index) {
      case 0:
        return 'A new concrete order has been placed. Check the details and confirm the delivery schedule.';
      case 1:
        return 'Your order #231667 has been dispatched and is on its way to the site.';
      case 2:
        return 'A login attempt was made from a new device. If this wasn’t you, update your security settings.';
      case 3:
        return 'Solidity will be undergoing maintenance on 8th of Sep at 12AM. Expect minor service interruptions.';
      default:
        return 'Notification message';
    }
  }

  String _getTimeAgo(int index) {
    switch (index) {
      case 0:
        return '21 mins ago';
      case 1:
        return '20 mins ago';
      case 2:
        return '15 mins ago';
      case 3:
        return '10 mins ago';
      default:
        return 'Just now';
    }
  }
}
