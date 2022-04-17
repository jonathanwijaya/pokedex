import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_boiler_plate/utils/constants.dart';

import 'button.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    required this.title,
    required this.desc,
    required this.onTapCancel,
    required this.onTapConfirm,
    this.onTapDontShow,
    this.showCancel,
    this.dontShomMessage,
    Key? key,
  }) : super(key: key);

  final String title;
  final String desc;
  final Function()? onTapDontShow;
  final Function() onTapCancel;
  final Function() onTapConfirm;
  final bool? showCancel;
  final RxBool? dontShomMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          constraints: const BoxConstraints(maxWidth: kSIzeMaxDialogWidth),
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: kPadding * 2),
          padding: const EdgeInsets.symmetric(horizontal: kPadding),
          decoration: const BoxDecoration(
            color: kColorBg,
            borderRadius: BorderRadius.all(kSizeBorderRadiusM),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: kPadding, bottom: kPaddingXS),
                child: Text(
                  title,
                  style: kStyleHeadline3,
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(bottom: kPaddingS),
                child: Text(
                  desc,
                  style: kStyleBodyText1.copyWith(color: kColorTextHint),
                ),
              ),
              if (dontShomMessage != null)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(bottom: kPaddingS),
                  child: InkWell(
                    onTap: onTapDontShow != null ? () => onTapDontShow!() : null,
                    child: Obx(
                      () => Row(
                        children: [
                          dontShomMessage!.value == false
                              ? const Icon(
                                  Icons.check_box_outline_blank,
                                  color: kColorTextHint,
                                )
                              : const Icon(
                                  Icons.check_box_outlined,
                                  color: kColorPrimary,
                                ),
                          const Padding(
                            padding: EdgeInsets.only(left: kPaddingXS),
                          ),
                          const Text('Do not show this message again'),
                        ],
                      ),
                    ),
                  ),
                ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(bottom: kPadding),
                child: Row(
                  children: [
                    if (showCancel == true || showCancel == null)
                      Expanded(
                        child: Button(
                          text: 'Cancel',
                          backgroundColor: kColorTextHint,
                          textColor: kColorTextBlack,
                          handler: () => onTapCancel(),
                        ),
                      ),
                    if (showCancel == true || showCancel == null)
                      const SizedBox(
                        width: kPadding,
                      ),
                    Expanded(
                      child: Button(
                        text: 'Confirm',
                        handler: () => onTapConfirm(),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
