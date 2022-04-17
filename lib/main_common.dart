import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_boiler_plate/app.dart';

Future<void> mainCommon(Environment flavor) async {
  if (!kIsWeb) {
    runZonedGuarded<Future<void>>(() async {
      await setUpInitializer(flavor);
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
        (value) => runApp(App(flavor: flavor)),
      );
    }, (error, stack) => {print('Error')});
  } else {
    await setUpInitializer(flavor);
    runApp(
      App(flavor: flavor),
    );
  }
}

Future<void> setUpInitializer(Environment flavor) async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();

  switch (flavor) {
    case Environment.development:
      await dotenv.load(fileName: ".dev.env");
      break;
    case Environment.production:
      await dotenv.load(fileName: ".env");
      break;
  }
  // await FlutterDownloader.initialize();

  // FlutterDownloader.registerCallback(Utils.downloadCallback);
  await GetStorage.init();
}
