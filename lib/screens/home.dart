import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/controllers/home_controller.dart';
import 'package:pokedex/utils/constants.dart';
import 'package:pokedex/widgets/background_music_player.dart';
import 'package:pokedex/widgets/fade_in_image_custom.dart';
import 'package:pokedex/widgets/profressor_oak_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController _controller = Get.put(HomeController());
    return SafeArea(
      child: Scaffold(
        floatingActionButton: BackgroundMusicPlayer(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        body: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(kBackgroundImage),
              fit: BoxFit.cover,
            ),
          ),
          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  pinned: true,
                  snap: true,
                  floating: true,
                  expandedHeight: 160.0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: _logoAnimated(),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  floating: true,
                  delegate: Delegate(Colors.transparent, 'Text'),
                ),
              ];
            },
            body: Builder(builder: (context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: kImageXL,
                    child: Image(
                      image: AssetImage(kProfessorOakImage),
                    ),
                  ),
                  ProfessorOakDialog(),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _logoAnimated() {
    return Center(
      child: FadeInImageCustom(
        begin: 0.0,
        end: 1.0,
        asset: kPokemonLogo,
        imageHeight: kPokemonLogoSize,
        duration: 500,
      ),
    );
  }
}

class Delegate extends SliverPersistentHeaderDelegate {
  final Color backgroundColor;
  final String headerTitle;

  Delegate(this.backgroundColor, this.headerTitle);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: backgroundColor,
      child: Center(
        child: Text(
          headerTitle,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

  // GridView.builder(
  //                 shrinkWrap: true,
  //                 itemCount: _controller.pokemonMap.length,
  //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //                   crossAxisCount: 4,
  //                 ),
  //                 itemBuilder: (context, index) {
  //                   return CellMap(
  //                     url: _controller.pokemonMap[index]['map'],
  //                     mapName: _controller.pokemonMap[index]['region_name'],
  //                   );
  //                 },
  //               ),
