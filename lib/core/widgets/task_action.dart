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
          topLeft: Radius.circular(12), bottomLeft: Radius.circular(12));
    } else {
      return BorderRadius.only(
          topRight: Radius.circular(12), bottomRight: Radius.circular(12));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed.call();
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.orange, Colors.deepOrange],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          color: color,
          borderRadius: getBorderRadius(),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.orange.shade300,
              borderRadius: BorderRadius.circular(25),
            ),
            child: child

          ),
        ),
      ),
    );
  }
}
