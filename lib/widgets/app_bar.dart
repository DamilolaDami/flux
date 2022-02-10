import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:fluxstore/theme/colors.dart';
import 'package:fluxstore/theme/textstyles.dart';
import 'package:fluxstore/widgets/icon_container_widget.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const IconContainer(
                color: AppColors.darkBlue, icon: Icons.location_on),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Delivery to",
                  style: ksmallTextStyle(context),
                ),
                Text("Ikeja, Lagos", style: klargeTextStyle(context)),
              ],
            )
          ],
        ),
        GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: const IconContainer(
            color: AppColors.greyText,
            svgPath: 'assets/images/icons/ham.svg',
            isStack: true,
            isSvg: true,
          ),
        ),
      ],
    );
  }
}
