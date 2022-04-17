import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'constants.dart';

enum Loader {
  lottie,
  basic,
}

class Wgt {
  static AppBar appbar({
    required String title,
    List<Widget>? actions,
    PreferredSizeWidget? bottom,
    Widget? leading,
    Color? bgColor,
  }) {
    return AppBar(
      title: Text(
        title,
        style: kStyleHeadline2,
      ),
      actions: actions,
      centerTitle: true,
      backgroundColor: bgColor ?? kColorBg,
      elevation: 0,
      iconTheme: const IconThemeData(color: kColorBrand),
      bottom: bottom,
      leading: leading,
    );
  }

  static Widget wrapFullHeightScroll({
    required Widget child,
    EdgeInsetsGeometry? padding = const EdgeInsets.only(left: kPadding, right: kPadding, bottom: kPadding),
  }) {
    return LayoutBuilder(
      builder: (context, constraint) => SingleChildScrollView(
        padding: padding,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraint.maxHeight,
            minWidth: double.infinity,
          ),
          child: IntrinsicHeight(
            child: SafeArea(child: child),
          ),
        ),
      ),
    );
  }

  static Widget wrapBottomSheet({required Widget child, EdgeInsetsGeometry? padding, double? height}) {
    return Row(
      children: [
        const Spacer(),
        Container(
          height: height ?? Get.height * 0.8,
          width: kWidthDialogL,
          padding: padding ?? const EdgeInsets.symmetric(horizontal: kPadding),
          decoration: const BoxDecoration(
            color: kColorSecondaryBg,
            borderRadius: BorderRadius.only(topRight: kSizeRadius, topLeft: kSizeRadius),
          ),
          child: Column(
            children: [
              Container(
                height: 7,
                width: 70,
                margin: const EdgeInsets.only(top: kPaddingS, bottom: kPaddingS),
                decoration: BoxDecoration(
                  color: Colors.grey[600],
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Expanded(child: child),
            ],
          ),
        ),
        const Spacer(),
      ],
    );
  }

  static Widget loaderController({
    Color color = kColorPrimary,
    double weight = 3,
    double? size,
    Loader style = Loader.lottie,
  }) {
    if (style == Loader.lottie) {
      return Center(
        child: SizedBox(
          height: size ?? kSizeLottieLoader,
          width: size ?? kSizeLottieLoader,
          child: Lottie.asset(
            kLottieBoxLoader,
            height: size ?? kSizeLottieLoader,
            width: size ?? kSizeLottieLoader,
          ),
        ),
      );
    }
    return Center(
      child: Container(
        padding: const EdgeInsets.all(kPaddingXXS),
        child: CircularProgressIndicator(
          color: color,
          strokeWidth: weight,
        ),
      ),
    );
  }

  static Widget loaderBox({
    double width = 200,
    double height = kSizeProfilePic,
    double borderRadius = radius,
    bool square = false,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: square
          ? AspectRatio(
              aspectRatio: 1,
              child: SizedBox(
                width: width,
                height: height,
                child: Container(
                  color: kColorTextBlackSecondary.withOpacity(0.3),
                ),
              ),
            )
          : SizedBox(
              width: width,
              height: height,
              child: Container(
                color: kColorTextBlackSecondary,
              ),
            ),
    );
  }

  static Widget devWaterMark() {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Image.asset(
        kDevFlag,
        fit: BoxFit.cover,
        repeat: ImageRepeat.repeat,
      ),
    );
  }
}
