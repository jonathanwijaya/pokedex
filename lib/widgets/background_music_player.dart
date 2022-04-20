import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/utils/base_controllers.dart';
import 'package:pokedex/utils/constants.dart';

class BackgroundMusicPlayer extends StatelessWidget {
  const BackgroundMusicPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BackgroundMusicController _controller = Get.put(BackgroundMusicController());
    return Obx(
      () {
        return Padding(
          padding: const EdgeInsets.only(top: kPaddingS),
          child: FloatingActionButton.small(
            onPressed: _controller.onClickButton,
            child: Icon(
              _controller.musicState.value ? Icons.volume_up : Icons.volume_down,
            ),
          ),
        );
      },
    );
  }
}

class BackgroundMusicController extends BaseControllers {
  // AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();
  AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();

  RxBool musicState = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _assetsAudioPlayer.open(
      Audio(kPokemonThemeSong),
      autoStart: false,
      forceOpen: true,
      loopMode: LoopMode.single,
    );
  }

  onClickButton() {
    print('press');
    _assetsAudioPlayer.playOrPause();
    print(musicState.value);
    musicState.value = !musicState.value;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
