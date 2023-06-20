import 'package:flutter/material.dart';

/// 颜色
class FlyColorExtension extends ThemeExtension<FlyColorExtension> {
  ///
  const FlyColorExtension({
    this.primaryColor,
    this.dangerousColor,
  });

  /// 主色
  final Color? primaryColor;

  /// 危险的颜色
  final Color? dangerousColor;

  @override
  FlyColorExtension copyWith({
    Color? primaryColor,
    Color? dangerousColor,
  }) {
    return FlyColorExtension(
      primaryColor: primaryColor ?? this.primaryColor,
      dangerousColor: dangerousColor ?? this.dangerousColor,
    );
  }

  @override
  FlyColorExtension lerp(FlyColorExtension? other, double t) {
    return FlyColorExtension(
      primaryColor: Color.lerp(primaryColor, other?.primaryColor, t),
      dangerousColor: Color.lerp(dangerousColor, other?.dangerousColor, t),
    );
  }
}
