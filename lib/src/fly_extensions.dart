import 'package:flutter/material.dart';
import 'package:fly_widget/fly_widget.dart';

///
class FlyExtensions {
  /// 柔和
  static List<ThemeExtension> soft = [
    const FlyColorExtension(
      primaryColor: Color(0xff4273F6),
      dangerousColor: Color(0xFFFF4D4F),
    ),
    const FlyPositiveButtonExtension(
      borderRadius: 4,
      textColor: Colors.white,
      backgroundColor: Color(0xff4273F6),
    ),
    const FlyNegativeButtonExtension(
      borderRadius: 4,
      textColor: Color(0xFF101010),
      backgroundColor: Colors.white,
      borderColor: Color(0xFFBBBBBB),
    ),
    FlyTextButtonExtension(
      textColor: const Color(0xff4273F6),
    ),
  ];
}
