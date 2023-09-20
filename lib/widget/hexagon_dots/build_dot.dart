import 'package:flutter/material.dart';

class BuildDot extends StatelessWidget {
  final Color? color;
  final double? angle;
  final double? size;
  final Interval? interval;
  final AnimationController? controller;
  final bool? first;
  const BuildDot.first({
      this.color,
      this.angle,
      this.size,
      this.interval,
      this.controller,
  })  : first = true,
        super();

  const BuildDot.second({
      this.color,
      this.angle,
      this.size,
      this.interval,
      this.controller,
  })  : first = false,
        super();

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle!,
      child: Transform.translate(
        offset: Offset(0, -size! / 1.5),
        child: UnconstrainedBox(
          child: DrawDot.circular(
            color: color!,
            dotSize: first!
                ? Tween<double>(
                    begin: 0.0,
                    end: size! / 10,
                  )
                    .animate(
                      CurvedAnimation(
                        parent: controller!,
                        curve: interval!,
                      ),
                    )
                    .value
                : Tween<double>(
                    begin: size! / 10,
                    end: 0.0,
                  )
                    .animate(
                      CurvedAnimation(
                        parent: controller!,
                        curve: interval!,
                      ),
                    )
                    .value,
          ),
        ),
      ),
    );
  }
}

class DrawDot extends StatelessWidget {
  final double? width;
  final double? height;
  final bool? circular;
  final Color? color;

  const DrawDot.circular({
      double? dotSize,
      this.color,
  })  : width = dotSize,
        height = dotSize,
        circular = true,
        super();

  const DrawDot.elliptical({
      this.width,
      this.height,
      this.color,
  })  : circular = false,
        super();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        shape: circular! ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: circular!
            ? null
            : BorderRadius.all(Radius.elliptical(width!, height!)),
      ),
    );
  }
}