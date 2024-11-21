import 'package:flutter/material.dart';

import 'package:timezo/constants/constants.dart';
import 'package:timezo/widgets/widgets.dart';

class OpacityCircle extends StatelessWidget {
  const OpacityCircle({
    super.key,
    required this.left,
    required this.color,
    required this.circleSize,
    required this.containerSize,
    this.image,
  });

  final double left;
  final Color color;
  final double circleSize;
  final double containerSize;
  final Widget? image;

  @override
  Widget build(BuildContext context) {
    final Color background = Theme.of(context).colorScheme.background;

    final double size = s22;
    final double sizeInside = image == null ? size + 1 : double.infinity;

    return Positioned(
      left: left,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          boxShadow: [
            BoxShadow(
              offset: Offset(s3, s3),
              color: Colors.black.withOpacity(0.15),
              blurRadius: s16,
            ),
          ],
        ),
        width: circleSize,
        height: circleSize,
        child: Stack(
          clipBehavior: Clip.antiAlias,
          alignment: Alignment.center,
          children: [
            if (image != null)
              Container(
                width: circleSize,
                height: circleSize,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: image,
              ),
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(shape: BoxShape.circle, color: background),
              width: size,
              height: size,
            ),
            Container(
              width: size,
              height: size,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/${ImageNames.checkers}'),
                  repeat: ImageRepeat.repeat,
                  opacity: 0.1,
                ),
              ),
            ),
            Opacity(
              opacity: left / (containerSize - circleSize),
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(shape: BoxShape.circle, color: color),
                width: sizeInside,
                height: sizeInside,
                child: image,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
