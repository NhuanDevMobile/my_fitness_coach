import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_dimens.dart';
import '../../utils/colors.dart';

class SimpleInputTextField extends StatelessWidget {
  TextEditingController? controller;
  Color? hintColor;
  String? hintText;
  bool obscureText;
  Color? backgroundColor;
  IconButton? suffixIcon;
  Function? onChanged;
  Function? onCompleted;
  Color? textColor;
  Function()? onTap;
  FocusNode? focusNode;
  String? labelText;
  SimpleInputTextField(
      {this.onChanged,
      this.suffixIcon,
      required this.obscureText,
      this.backgroundColor,
      this.controller,
      this.hintText,
      this.hintColor,
      this.onTap,
      this.focusNode,
      this.labelText,
      this.textColor,
      this.onCompleted});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextField(
        controller: controller,
        onChanged: (String valueOnChanged) {
          if (onChanged != null) onChanged!(valueOnChanged);
        },
        onSubmitted: (String value) {
          if (onCompleted != null) onCompleted!(value);
        },
        obscureText: obscureText,
        focusNode: this.focusNode,
        style: TextStyle(
            fontSize: AppDimens.text_size_16,
            color: textColor != null ? textColor : AppColors.whileColor),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            left: 15,
          ),
          labelText: labelText,
          labelStyle: TextStyle(
              color: AppColors.secondColor, fontSize: AppDimens.text_size_16),
          suffixIcon: suffixIcon,
          filled: backgroundColor == null ? false : true,
          fillColor: backgroundColor,
          hintText: hintText,
          hintStyle:
              TextStyle(fontSize: AppDimens.text_size_14, color: hintColor),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: AppColors.brandColor),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: AppColors.brandColor),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
