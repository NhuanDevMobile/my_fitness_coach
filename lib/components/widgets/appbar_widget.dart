import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_dimens.dart';
import '../../utils/app_fonts.dart';
import '../../utils/colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final Color? textTitleColor;
  final String? icon;
  final String? title;
  final double? height;
  final List<Widget>? menuItem;
  final bool hideBack;
  final bool? titleCenter;
  Widget? leading;

  AppBarWidget({
    Key? key,
    this.backgroundColor = AppColors.brandColor,
    this.textTitleColor = AppColors.whileColor,
    this.icon,
    this.title = '',
    this.menuItem,
    this.leading,
    this.height = kToolbarHeight,
    this.titleCenter = true,
    this.hideBack = false,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height!);

  @override
  Widget build(BuildContext context) {
    if (leading == null) {
      leading = IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios));
    }
    return AppBar(
      actions: menuItem,
      leading: leading,
      elevation: 0.0,
      toolbarHeight: preferredSize.height,
      iconTheme: IconThemeData(
        color: textTitleColor,
      ),
      title: Text(
        title!,
        style: const TextStyle(
          fontFamily: AppFonts.RobotoSlab,
          fontSize: AppDimens.text_size_18,
          fontWeight: FontWeight.bold,
          color: AppColors.whileColor,
        ),
      ),
      backgroundColor: backgroundColor,
      centerTitle: titleCenter,
    );
  }
}
