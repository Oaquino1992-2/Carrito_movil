import 'package:flutter/cupertino.dart';
import 'app_colors.dart';

class ContainerStyles {
  static BoxDecoration cardStyle() {
    return BoxDecoration(
      color: AppColors.background,
      boxShadow: [
        BoxShadow(
          color: AppColors.gray,
          blurRadius: 3.0,
          offset: new Offset(0.0, 3.0),
        )
      ],
    );
  }

  static BoxDecoration borderBottom() {
    return BoxDecoration(
      border: Border(
        bottom: BorderSide(color: AppColors.light, width: 1.0),
      ),
    );
  }
}
