import 'package:flutter/material.dart';

/// 颜色
class FlyColorExtension extends ThemeExtension<FlyColorExtension> {
  ///
  const FlyColorExtension({
    this.primaryColor,
    this.assistantColorA,
    this.assistantColorB,
    this.assistantColorC,
    this.assistantColorD,
    this.assistantColorE,
    this.assistantColorF,
    this.dangerousColor,
    this.blackColor,
    this.greyColor,
    this.backgroundColor,
  });

  /// 品牌色
  final Color? primaryColor;

  /// 辅助色 A
  final Color? assistantColorA;

  /// 辅助色 B
  final Color? assistantColorB;

  /// 辅助色 C
  final Color? assistantColorC;

  /// 辅助色 D
  final Color? assistantColorD;

  /// 辅助色 E
  final Color? assistantColorE;

  /// 辅助色 F
  final Color? assistantColorF;

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
  FlyColorExtension lerp(FlyColorExtension? other, double t) {
    return FlyColorExtension(
      primaryColor: Color.lerp(primaryColor, other?.primaryColor, t),
      assistantColorA: Color.lerp(assistantColorA, other?.assistantColorA, t),
      assistantColorB: Color.lerp(assistantColorB, other?.assistantColorB, t),
      assistantColorC: Color.lerp(assistantColorC, other?.assistantColorC, t),
      assistantColorD: Color.lerp(assistantColorD, other?.assistantColorD, t),
      assistantColorE: Color.lerp(assistantColorE, other?.assistantColorE, t),
      assistantColorF: Color.lerp(assistantColorF, other?.assistantColorF, t),
      dangerousColor: Color.lerp(dangerousColor, other?.dangerousColor, t),
      blackColor: Color.lerp(blackColor, other?.blackColor, t),
      greyColor: Color.lerp(greyColor, other?.greyColor, t),
      backgroundColor: Color.lerp(backgroundColor, other?.backgroundColor, t),
    );
  }

  @override
  FlyColorExtension copyWith({
    Color? primaryColor,
    Color? assistantColorA,
    Color? assistantColorB,
    Color? assistantColorC,
    Color? assistantColorD,
    Color? assistantColorE,
    Color? assistantColorF,
    Color? dangerousColor,
    Color? blackColor,
    Color? greyColor,
    Color? backgroundColor,
  }) {
    return FlyColorExtension(
      primaryColor: primaryColor ?? this.primaryColor,
      assistantColorA: assistantColorA ?? this.assistantColorA,
      assistantColorB: assistantColorB ?? this.assistantColorB,
      assistantColorC: assistantColorC ?? this.assistantColorC,
      assistantColorD: assistantColorD ?? this.assistantColorD,
      assistantColorE: assistantColorE ?? this.assistantColorE,
      assistantColorF: assistantColorF ?? this.assistantColorF,
      dangerousColor: dangerousColor ?? this.dangerousColor,
      blackColor: blackColor ?? this.blackColor,
      greyColor: greyColor ?? this.greyColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }
}
