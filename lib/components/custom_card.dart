import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? cardChild;
  final void Function()? onPressed;

  const CustomCard({
    @required this.height,
    @required this.width,
    @required this.cardChild,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 2)
            ],
          ),
          child: cardChild,
        ),
      ),
    );
  }
}
