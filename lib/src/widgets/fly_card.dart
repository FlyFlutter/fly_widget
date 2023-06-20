import 'dart:ui';

import 'package:flutter/material.dart';

/// 封装的卡片样式组件
class FlyCard extends StatelessWidget {
  /// 创建一个符合规范的卡片
  const FlyCard({
    super.key,
    this.child,
    this.constraints,
    this.elevation,
    this.shape,
    this.color,
  });

  /// 子节点
  final Widget? child;

  ///
  final BoxConstraints? constraints;

  ///
  final double? elevation;

  ///
  final ShapeBorder? shape;

  ///
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final extension = Theme.of(context).extension<FlyCardExtension>();
    Widget child = Card(
      elevation: elevation ?? extension?.elevation,
      shape: shape ?? extension?.shape,
      color: color ?? extension?.color,
      child: this.child,
    );
    final constraints = this.constraints ?? extension?.constraints;
    if (constraints != null) {
      child = ConstrainedBox(
        constraints: constraints,
        child: child,
      );
    }
    return child;
  }
}

///
class FlyCardExtension extends ThemeExtension<FlyCardExtension> {
  ///
  const FlyCardExtension({
    this.constraints,
    this.elevation,
    this.shape,
    this.color,
  });

  /// 尺寸约束
  final BoxConstraints? constraints;

  ///
  final double? elevation;

  ///
  final ShapeBorder? shape;

  ///
  final Color? color;

  @override
  FlyCardExtension lerp(FlyCardExtension? other, double t) {
    return FlyCardExtension(
      constraints: BoxConstraints.lerp(constraints, other?.constraints, t),
      elevation: lerpDouble(elevation, other?.elevation, t),
      shape: ShapeBorder.lerp(shape, other?.shape, t),
      color: Color.lerp(color, other?.color, t),
    );
  }

  @override
  FlyCardExtension copyWith({
    BoxConstraints? constraints,
    double? elevation,
    ShapeBorder? shape,
    Color? color,
  }) {
    return FlyCardExtension(
      constraints: constraints ?? this.constraints,
      elevation: elevation ?? this.elevation,
      shape: shape ?? this.shape,
      color: color ?? this.color,
    );
  }
}
