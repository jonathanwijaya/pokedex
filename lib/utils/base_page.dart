import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_boiler_plate/widgets/widget_not_found.dart';

import 'constants.dart';
import 'wgt.dart';

abstract class BasePage extends StatelessWidget {
  const BasePage({Key? key}) : super(key: key);
  Future<void> onRefresh();

  Widget emptyState() {
    return RefreshIndicator(
      onRefresh: () async => await onRefresh(),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: kPadding),
          height: Get.height - Get.statusBarHeight,
          child: emptyContent(),
        ),
      ),
    );
  }

  Widget loadingState() {
    return RefreshIndicator(
      onRefresh: () async => await onRefresh(),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          height: Get.height - Get.statusBarHeight,
          child: Wgt.loaderController(),
        ),
      ),
    );
  }

  Widget refreshable({required Widget child, ScrollController? scrollController}) {
    return RefreshIndicator(
      color: kColorPrimary,
      onRefresh: () async => await onRefresh(),
      child: SingleChildScrollView(
        controller: scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: Get.height - Get.statusBarHeight,
          ),
          child: child,
        ),
      ),
    );
  }

  Widget emptyContent() {
    return const Padding(
      padding: EdgeInsets.only(top: kPadding),
      child: Center(
        child: WidgetNotFound(
          title: 'No data',
          function: null,
        ),
      ),
    );
  }
}
