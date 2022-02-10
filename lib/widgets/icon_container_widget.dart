import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxstore/theme/colors.dart';

class IconContainer extends StatelessWidget {
  final Color color;
  final IconData? icon;
  final bool isSvg;
  final String? svgPath;
  final bool isStack;
  final double? size;
  const IconContainer(
      {Key? key,
      required this.color,
      this.icon,
      this.isStack = false,
      this.size,
      this.isSvg = false,
      this.svgPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isStack
        ? Stack(
            overflow: Overflow.visible,
            children: [
              Container(
                  height: 40,
                  width: 40,
                  child: isSvg
                      ? Container(
                          height: size ?? 20,
                          width: size ?? 20,
                          padding: const EdgeInsets.all(6),
                          child: SvgPicture.asset(
                            svgPath!,
                            color: Colors.black,
                          ),
                        )
                      : Icon(
                          icon,
                          size: size ?? 24,
                          color: Colors.white,
                        ),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(10),
                  )),
              Positioned(
                  right: 0,
                  top: -4,
                  child: Container(
                      height: 13,
                      width: 13,
                      decoration: const BoxDecoration(
                        color: AppColors.darkBlue,
                        shape: BoxShape.circle,
                      )))
            ],
          )
        : Container(
            height: 40,
            width: 40,
            child: isSvg
                ? Container(
                    height: size ?? 20,
                    width: size ?? 20,
                    padding: const EdgeInsets.all(6),
                    child: SvgPicture.asset(
                      svgPath!,
                      color: Colors.black,
                    ),
                  )
                : Icon(
                    icon,
                    size: size ?? 24,
                    color: Colors.white,
                  ),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ));
  }
}
