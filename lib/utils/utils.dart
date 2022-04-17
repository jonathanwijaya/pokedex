import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_boiler_plate/screens/home.dart';
import 'package:flutter_boiler_plate/widgets/button.dart';
import 'package:flutter_boiler_plate/widgets/gradient_button.dart';
import 'package:flutter_boiler_plate/widgets/img.dart';
import '../widgets/confirm_dialog.dart';
import 'package:flutter_boiler_plate/utils/example_keys.dart';
import '/utils/constants.dart';

import 'constants.dart';

class Utils {
  static Widget getInitialHome() {
    return HomeScreen();
  }

  static bool get isLoggedIn => GetStorage().read(storageToken) != null;

  static setLoggedIn({required String token}) async {}

  static popupSuccess({required String body}) {
    popUpContext(body: body, type: PopupType.success);
  }

  static popupFail({
    String title = 'Failed',
    String body = 'Failed to connect to server',
    Response? response,
  }) {
    if (response != null) {
      if (response.body == null) {
        body = 'Failed to connect to server';
      }
      try {
        body = response.body['message'] ?? response.body['error'] ?? response.body['data']['message'];
        // ignore: empty_catches
      } catch (e) {}
    }
    popUpContext(body: body, type: PopupType.failed);
  }

  static popUpContext({required String body, required PopupType type}) {
    Color color = type == PopupType.failed ? Colors.red.withOpacity(0.8) : kColorPopUpSuccess.withOpacity(0.9);
    IconData isSuccess = type == PopupType.success ? Icons.check_circle : Icons.cancel_rounded;
    if (Get.context == null) {
      return;
    }
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.fixed,
        elevation: 6,
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.symmetric(vertical: kPaddingS),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(kSizeRadius),
            color: color,
          ),
          child: Row(
            children: [
              const SizedBox(width: kPaddingS),
              Icon(isSuccess),
              const SizedBox(width: kPaddingS),
              Expanded(
                child: Text(
                  body,
                  style: Theme.of(Get.context!).textTheme.bodyText1,
                ),
              ),
              const SizedBox(width: kPaddingS),
            ],
          ),
        ),
      ),
    );
  }

  static popup({required String title, required String body}) {
    Get.snackbar(
      title,
      body,
      backgroundColor: Colors.grey[800]!.withOpacity(0.5),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.only(bottom: kPadding, left: kPadding, right: kPadding),
    );
  }

  static errorDialog({
    required String title,
    required String desc,
    required Function() onTapCancel,
    required Function() onTapConfirm,
    String? confirmText,
    String? cancelText,
  }) {
    Get.defaultDialog(
        barrierDismissible: false,
        title: title,
        content: Text(
          desc,
          style: kStyleBodyText1,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: kPadding),
        radius: kPaddingXS,
        actions: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: kPaddingS),
                child: InkWell(
                  onTap: onTapCancel,
                  child: const Text('Cancel'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: kPaddingS),
                child: InkWell(
                  onTap: onTapConfirm,
                  child: confirmText != null ? Text(confirmText) : const Text('Confirm'),
                ),
              ),
            ],
          )
        ]);
  }

  static confirmDialog({
    required String title,
    required String desc,
    Function()? onTapDontShow,
    required Function() onTapCancel,
    required Function() onTapConfirm,
    RxBool? dontShowMessage,
  }) {
    Get.dialog(
      ConfirmDialog(
        title: title,
        desc: desc,
        onTapCancel: onTapCancel,
        onTapConfirm: onTapConfirm,
        onTapDontShow: onTapDontShow,
        dontShomMessage: dontShowMessage,
      ),
      barrierDismissible: false,
    );
  }

  static bigConfirmDialog({
    required String title,
    required String desc,
    Widget? content,
    Function()? onTapCancel,
    Function()? onTapConfirm,
    String? imageCenter,
    bool? footer = true,
  }) {
    Get.dialog(
        Center(
            child: Material(
          color: Colors.transparent,
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: kPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 150,
                      child: Center(
                        child: Image.asset(
                          imageCenter ?? kImageBGPopup,
                          fit: BoxFit.contain,
                          height: 90,
                        ),
                      ),
                      decoration: const BoxDecoration(
                        color: kColorPrimary,
                        image: DecorationImage(
                          image: AssetImage(kImageBGPopup),
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: kSizeBorderRadiusM,
                          topRight: kSizeBorderRadiusM,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => Get.back(),
                      child: const Padding(
                        padding: EdgeInsets.all(kPaddingXS),
                        child: Icon(Icons.close, color: kColorTextWhite),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(kPadding),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: kSizeBorderRadiusM,
                      bottomRight: kSizeBorderRadiusM,
                    ),
                    color: kColorBrand,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // title
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          title,
                          style: kStyleBodyText1,
                        ),
                      ),
                      // Desc
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          desc,
                          style: kStyleBodyText2.copyWith(color: kColorTextSecondary),
                        ),
                      ),
                      // content here
                      if (content != null) content,
                      // button footer here
                      if (footer == true)
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(top: kPadding),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Center(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Button(
                                    text: 'Cancel',
                                    backgroundColor: kColorBrand,
                                    textColor: kColorTextHint,
                                    handler: () => onTapCancel!(),
                                  ),
                                ),
                              )),
                              const SizedBox(
                                width: kPadding,
                              ),
                              Expanded(
                                  child: Center(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: GradientButton(
                                    title: 'Clock in',
                                    handler: onTapConfirm,
                                    contentPadding: const EdgeInsets.symmetric(vertical: kPaddingXS),
                                  ),
                                ),
                              )),
                            ],
                          ),
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )),
        barrierDismissible: false);
  }

  static String timeAgoSinceDate(int unixTimeStamp, {bool numericDates = true, String suffix = ' ago'}) {
    DateTime notificationDate = DateTime.fromMillisecondsSinceEpoch(unixTimeStamp * 1000);
    final date2 = DateTime.now();
    final difference = date2.difference(notificationDate);

    var days = difference.inDays.abs();

    if ((days / 365).floor() >= 1) {
      return (numericDates) ? '${(days / 365).floor()} year$suffix' : 'Last year';
    }
    if ((days / 30).floor() >= 1) {
      return (numericDates) ? '${(days / 30).floor()} month$suffix' : 'Last month';
    }
    if ((days / 7).floor() >= 1) {
      return (numericDates) ? '${(days / 7).floor()} week$suffix' : 'Last week';
    }
    if (days >= 2) {
      return '$days days$suffix';
    }
    if (days >= 1) {
      return (numericDates) ? '1 day$suffix' : 'Yesterday';
    }
    if (difference.inHours >= 2) {
      return '${difference.inHours} hours$suffix';
    }
    if (difference.inHours >= 1) {
      return (numericDates) ? '1 hour$suffix' : 'An hour$suffix';
    }
    if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} minutes$suffix';
    }
    if (difference.inMinutes >= 1) {
      return (numericDates) ? '1 minute$suffix' : 'A minute$suffix';
    }
    if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds$suffix';
    }
    {
      return 'Just now';
    }
  }

  static zoomableImage({
    String herokey = '',
    required String url,
  }) {
    TransformationController _transformationController = TransformationController();
    TapDownDetails _doubleTapDetails = TapDownDetails();
    void _handleDoubleTapDown(TapDownDetails details) {
      _doubleTapDetails = details;
    }

    void _handleDoubleTap() {
      if (_transformationController.value != Matrix4.identity()) {
        _transformationController.value = Matrix4.identity();
      } else {
        final position = _doubleTapDetails.localPosition;
        _transformationController.value = Matrix4.identity()
          ..translate(-position.dx / 3, -position.dy / 3)
          ..scale(1.5);
      }
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => Get.back(),
        child: InteractiveViewer(
          transformationController: _transformationController,
          child: GestureDetector(
            onDoubleTap: _handleDoubleTap,
            onDoubleTapDown: _handleDoubleTapDown,
            child: Center(
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(kPadding),
                  child: Img(
                    fit: BoxFit.fitWidth,
                    url: url,
                    heroKey: herokey,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static void downloadCallback(String id, DownloadTaskStatus status, int progress) {
    final SendPort? send = IsolateNameServer.lookupPortByName(id);
    send!.send([id, status, progress]);
  }
}
