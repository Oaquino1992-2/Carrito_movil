import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

class TextStyles {
  static TextStyle price(BuildContext context) {
    return Theme.of(context).textTheme.title.copyWith(color: AppColors.primary);
  }

  static TextStyle priceMd(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .subtitle
        .copyWith(color: AppColors.primary);
  }

  static TextStyle originPrice(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .subtitle
        .copyWith(decoration: TextDecoration.lineThrough);
  }

  static TextStyle itemName(BuildContext context) {
    return Theme.of(context).textTheme.title;
  }

  static TextStyle tileLabel(BuildContext context) {
    return TextStyle(fontSize: 16.0);
  }

  static TextStyle ratingText(BuildContext context) {
    return Theme.of(context).textTheme.title;
  }

  static TextStyle userName() {
    return TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0);
  }

  static TextStyle hint() {
    return TextStyle(fontSize: 12.0, color: AppColors.gray);
  }
}
