import 'dart:ui';

import 'package:flutter/material.dart';

///
class FlyButton<T extends FlyButtonExtension<T>> extends StatefulWidget {
  ///
  const FlyButton({
    required this.text,
    super.key,
    this.onPressed,
    this.textColor,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
  });

  /// 按钮显示的文字
  final String text;

  /// 点击响应事件
  final VoidCallback? onPressed;

  /// 文字的颜色
  final Color? textColor;

  /// 按钮背景色
  final Color? backgroundColor;

  /// 边框颜色
  final Color? borderColor;

  /// 按钮边框圆角
  final double? borderRadius;

  @override
  State<FlyButton> createState() => _FlyButtonState<T>();
}

class _FlyButtonState<T extends FlyButtonExtension<T>>
    extends State<FlyButton> {
  late ThemeData themeData;
  T? buttonExtension;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    themeData = Theme.of(context);
    buttonExtension = themeData.extension<T>();
  }

  /// 按钮边框
  MaterialStateProperty<BorderSide?>? get borderSide {
    final color = widget.borderColor ?? buttonExtension?.borderColor;
    if (color == null) {
      return null;
    } else {
      return MaterialStateProperty.resolveWith<BorderSide>((states) {
        if (states.contains(MaterialState.disabled)) {
          return const BorderSide(color: Colors.transparent);
        } else {
          return BorderSide(color: color);
        }
      });
    }
  }

  /// 文字颜色
  Color get textColor =>
      widget.textColor ?? buttonExtension?.textColor ?? Colors.white;

  bool get isTextButton => buttonExtension is FlyTextButtonExtension;

  @override
  Widget build(BuildContext context) {
    if (isTextButton) {
      return TextButton(
        onPressed: widget.onPressed,
        child: Text(
          widget.text,
          style: TextStyle(fontSize: 14, color: textColor),
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              if (buttonExtension is FlyPositiveButtonExtension) {
                return buttonExtension?.backgroundColor?.withOpacity(0.6) ??
                    Colors.grey;
              } else {
                return Colors.grey;
              }
            } else {
              return widget.backgroundColor ??
                  buttonExtension?.backgroundColor ??
                  themeData.primaryColor;
            }
          }),
          side: borderSide,
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
          ),
          // 最小尺寸 80 x 44
          minimumSize: MaterialStateProperty.all(const Size(80, 44)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  widget.borderRadius ?? buttonExtension?.borderRadius ?? 0,
                ),
              ),
            ),
          ),
        ),
        child: Text(
          widget.text,
          style: TextStyle(fontSize: 14, color: textColor),
        ),
      );
    }
  }
}

///
abstract class FlyButtonExtension<T extends FlyButtonExtension<T>>
    extends ThemeExtension<T> {
  ///
  const FlyButtonExtension() : super();

  /// 文字的颜色
  Color? get textColor;

  /// 按钮背景色
  Color? get backgroundColor;

  /// 边框颜色
  Color? get borderColor;

  /// 按钮边框圆角
  double? get borderRadius;
}

/// Positive button
/// 积极、正向的按钮
/// [FlyButton] 使用的
class FlyPositiveButtonExtension
    extends FlyButtonExtension<FlyPositiveButtonExtension> {
  ///
  const FlyPositiveButtonExtension({
    this.backgroundColor,
    this.borderRadius,
    this.textColor,
  });

  @override
  final Color? textColor;

  @override
  final Color? backgroundColor;

  @override
  Color? get borderColor => backgroundColor;

  @override
  final double? borderRadius;

  @override
  FlyPositiveButtonExtension copyWith({
    Color? textColor,
    Color? backgroundColor,
    double? borderRadius,
  }) {
    return FlyPositiveButtonExtension(
      textColor: textColor ?? this.textColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  ThemeExtension<FlyPositiveButtonExtension> lerp(
    FlyPositiveButtonExtension? other,
    double t,
  ) {
    return FlyPositiveButtonExtension(
      textColor: Color.lerp(textColor, other?.textColor, t),
      backgroundColor: Color.lerp(backgroundColor, other?.backgroundColor, t),
      borderRadius: lerpDouble(borderRadius, other?.borderRadius, t),
    );
  }
}

/// Positive button
/// 消极、负向的按钮
/// [FlyButton] 使用的
class FlyNegativeButtonExtension
    extends FlyButtonExtension<FlyNegativeButtonExtension> {
  ///
  const FlyNegativeButtonExtension({
    this.backgroundColor,
    this.borderRadius,
    this.borderColor,
    this.textColor,
  });

  @override
  final Color? textColor;

  @override
  final Color? backgroundColor;

  @override
  final Color? borderColor;

  @override
  final double? borderRadius;

  @override
  FlyNegativeButtonExtension copyWith({
    Color? textColor,
    Color? backgroundColor,
    Color? borderColor,
    double? borderRadius,
  }) {
    return FlyNegativeButtonExtension(
      textColor: textColor ?? this.textColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  ThemeExtension<FlyNegativeButtonExtension> lerp(
    FlyNegativeButtonExtension? other,
    double t,
  ) {
    return FlyNegativeButtonExtension(
      textColor: Color.lerp(textColor, other?.textColor, t),
      backgroundColor: Color.lerp(backgroundColor, other?.backgroundColor, t),
      borderColor: Color.lerp(borderColor, other?.borderColor, t),
      borderRadius: lerpDouble(borderRadius, other?.borderRadius, t),
    );
  }
}

/// Text button
/// 文字按钮
/// [FlyButton] 使用的
class FlyTextButtonExtension
    extends FlyButtonExtension<FlyTextButtonExtension> {
  ///
  const FlyTextButtonExtension({
    this.textColor,
  });

  @override
  Color? get backgroundColor => Colors.transparent;

  @override
  Color? get borderColor => Colors.transparent;

  @override
  double? get borderRadius => null;

  @override
  final Color? textColor;

  @override
  FlyTextButtonExtension copyWith({
    Color? textColor,
  }) {
    return FlyTextButtonExtension(
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  ThemeExtension<FlyTextButtonExtension> lerp(
    FlyTextButtonExtension? other,
    double t,
  ) {
    return FlyTextButtonExtension(
      textColor: Color.lerp(textColor, other?.textColor, t),
    );
  }
}
