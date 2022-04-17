import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_boiler_plate/utils/constants.dart';
import 'package:flutter_boiler_plate/utils/extensions.dart';
import 'package:flutter_boiler_plate/widgets/button.dart';

class WidgetNotFound extends StatelessWidget {
  final String title;
  final String buttonText;
  final Function()? function;
  final TextStyle? textStyle;
  const WidgetNotFound({
    Key? key,
    required this.title,
    this.function,
    this.buttonText = '',
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dynamicSize = MediaQuery.of(context).size.width / 5;

    return Column(
      children: [
        const SizedBox(height: kPaddingXS),
        SizedBox(
          width: max(dynamicSize, kSizeLottieWidthFixed),
          child: SvgPicture.asset(
            kImageSearchNotFound,
          ),
        ),
        Text(
          title,
          style: textStyle ?? context.h2(),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: kPaddingXS,
        ),
        if (function != null)
          Button(
            text: buttonText,
            handler: function,
          )
      ],
    );
  }
}
