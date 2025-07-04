import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCircleButton extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;
  final isShowShadow;

  CustomCircleButton({this.onTap, required this.child, this.isShowShadow = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      elevation: isShowShadow ? 4 : 0,
      shadowColor: Colors.black,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: child,
        ),
      ),
    );
  }
}
