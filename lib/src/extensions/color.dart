import 'package:flutter/material.dart';

/// 颜色
class FlyColorExtension extends ThemeExtension<FlyColorExtension> {
  ///
  const FlyColorExtension({
    this.primaryColor,
    this.assistantColor,
    this.dangerousColor,
    this.blackColor,
    this.greyColor,
    this.backgroundColor,
  });

  /// 主色
  final Color? primaryColor;

  /// 辅助色
  final Color? assistantColor;

  /// 危险的颜色
  final Color? dangerousColor;

  /// 主要黑色
  ///
  ///
  final Color? blackColor;

  /// 灰色
  final Color? greyColor;

  /// 背景色
  final Color? backgroundColor;

  @override
  FlyColorExtension copyWith({
    Color? primaryColor,
    Color? assistantColor,
    Color? dangerousColor,
    Color? blackColor,
    Color? greyColor,
    Color? backgroundColor,
  }) {
    return FlyColorExtension(
      primaryColor: primaryColor ?? this.primaryColor,
      assistantColor: assistantColor ?? this.assistantColor,
      dangerousColor: dangerousColor ?? this.dangerousColor,
      blackColor: blackColor ?? this.blackColor,
      greyColor: greyColor ?? this.greyColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  FlyColorExtension lerp(FlyColorExtension? other, double t) {
    return FlyColorExtension(
      primaryColor: Color.lerp(primaryColor, other?.primaryColor, t),
      assistantColor: Color.lerp(assistantColor, other?.assistantColor, t),
      dangerousColor: Color.lerp(dangerousColor, other?.dangerousColor, t),
      blackColor: Color.lerp(blackColor, other?.blackColor, t),
      greyColor: Color.lerp(greyColor, other?.greyColor, t),
      backgroundColor: Color.lerp(backgroundColor, other?.backgroundColor, t),
    );
  }

}
