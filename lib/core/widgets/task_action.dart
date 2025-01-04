import 'package:flutter/material.dart';

class TaskAction extends StatelessWidget {
  final Widget child;
  final Color color;
  final bool applyBorderRadiusOnLeft;
  final Function onPressed;
  const TaskAction(
      {super.key,
      required this.child,
      required this.color,
      this.applyBorderRadiusOnLeft = false,
      required this.onPressed});

  BorderRadiusGeometry getBorderRadius() {
    if (applyBorderRadiusOnLeft) {
      return BorderRadius.only(
          topLeft: Radius.circular(10), bottomLeft: Radius.circular(10));
    } else {
      return BorderRadius.only(
          topRight: Radius.circular(10), bottomRight: Radius.circular(10));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed.call();
      },
      child: Container(
        decoration:
            BoxDecoration(color: color, borderRadius: getBorderRadius()),
        child: Padding(padding: EdgeInsets.all(10), child: child),
      ),
    );
  }
}
