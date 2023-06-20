import 'package:flutter/material.dart';

///
class FlyDialog extends StatelessWidget {
  ///
  const FlyDialog({
    required this.title,
    required this.message,
    required this.buttons,
    super.key,
  });

  ///
  final String title;

  ///
  final String message;

  ///
  final List<Widget> buttons;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        Text(message),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: buttons,
        )
      ],
    );
  }
}
