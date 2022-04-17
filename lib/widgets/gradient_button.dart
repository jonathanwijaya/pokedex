import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_boiler_plate/utils/base_controllers.dart';
import 'package:flutter_boiler_plate/utils/constants.dart';
import 'package:flutter_boiler_plate/utils/wgt.dart';

class GradientButton extends StatelessWidget {
  final String title;
  final Function()? handler;
  final Icon? icon;
  final EdgeInsetsGeometry? contentPadding;
  final Key? keybtn;
  final bool isCircular;
  final bool? isLoading;
  final BaseControllers? controllers;

  const GradientButton({
    Key? key,
    required this.title,
    this.keybtn,
    this.isLoading,
    this.handler,
    this.icon,
    this.contentPadding,
    this.isCircular = false,
    this.controllers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (controllers != null) return Obx(() => _base());

    return _base();
  }

  Widget _base() {
    return Container(
        height: kSizeSizeButtonHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(isCircular ? kSizeSizeButtonHeight : kPaddingXS),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              handler == null
                  ? kColorDisabled
                  : controllers?.state.value == ControllerState.loading
                      ? kColorDisabled
                      : kColorPrimary,
              handler == null
                  ? kColorDisabled
                  : controllers?.state.value == ControllerState.loading
                      ? kColorDisabled
                      : kColorButtonElevated2,
            ],
          ),
        ),
        child: _content());
  }

  Widget _content() {
    return MaterialButton(
      splashColor: kColorSplashButton,
      onPressed: controllers?.state.value == ControllerState.loading ? null : handler,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(
          isCircular ? kSizeSizeButtonHeight : kPaddingXS,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _icon(),
          _text(),
        ],
      ),
    );
  }

  Widget _icon() {
    return Row(
      children: [
        if (icon != null) icon!,
        if (icon != null) const SizedBox(width: kPaddingXXS),
      ],
    );
  }

  Widget _text() {
    return Container(
      child: controllers?.state.value == ControllerState.loading
          ? Center(
              child: SizedBox(
                width: kSizeLoaderSmall,
                height: kSizeLoaderSmall,
                child: Wgt.loaderController(
                  color: kColorTextWhite,
                ),
              ),
            )
          : Text(
              title,
              style: kStyleSubtitle1.copyWith(
                color: handler == null ? kColorTextSecondary : kColorTextButton,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
    );
  }
}
