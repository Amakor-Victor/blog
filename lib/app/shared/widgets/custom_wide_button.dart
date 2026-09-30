import 'package:flutter/material.dart';

class CustomWideButton extends StatelessWidget {
  final void Function()? ontap;
  final Color backgroundColor;
  final bool enableSahdow;
  final Widget child;
  const new({
    super.key,
    required this.ontap,
    this.enableSahdow = false,
    required this.backgroundColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFC7C4D7)),
          boxShadow: enableSahdow
              ? [
                  const BoxShadow(
                    offset: Offset(0, 2),
                    spreadRadius: -2,
                    blurRadius: 4,
                    color: Color(0x1A000000),
                  ),
                  const BoxShadow(
                    offset: Offset(0, 4),
                    spreadRadius: -1,
                    blurRadius: 6,
                    color: Color(0x1A000000),
                  ),
                ]
              : [],
          borderRadius: .circular(8),
          color: backgroundColor,
        ),
        child: SizedBox(
          height: 48,
          width: double.infinity,
          child: Center(child: child),
        ),
      ),
    );
  }
}
