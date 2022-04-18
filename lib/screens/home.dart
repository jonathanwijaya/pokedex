import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/utils/constants.dart';
import 'package:pokedex/widgets/fade_in_image_custom.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // HomeController _controller = Get.put(HomeController());
    return SafeArea(
      child: Scaffold(
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
                  snap: false,
                  floating: true,
                  expandedHeight: 160.0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: _logoAnimated(),
                  ),
                ),
                // SliverToBoxAdapter(
                //   child: Center(
                //     child: _animatedText(),
                //   ),
                // ),
              ];
            },
            body: Container(child: Builder(builder: (context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        height: kImageM,
                        child: Image(
                          image: AssetImage(kProfessorOakImage),
                        ),
                      ),
                      _professorOakDialog(),
                    ],
                  ),
                  Container(
                    color: Colors.blue,
                  ),
                ],
              );
            })),
          ),
        ),
      ),
    );
  }

  Container _professorOakDialog() {
    return Container(
      decoration: BoxDecoration(
          color: kColorTextWhite,
          borderRadius: BorderRadius.all(kSizeBorderRadiusS),
          border: Border.all(
            color: Colors.blueAccent,
            width: 10,
          )),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Welcome to the world of Pokémon!',
                textStyle: kStyleHeadline1.copyWith(color: kColorTextBlack),
                speed: const Duration(milliseconds: 100),
              ),
              TypewriterAnimatedText(
                'My name is Oak! People call me the pokémon Prof!',
                textStyle: kStyleHeadline1.copyWith(color: kColorTextBlack),
                speed: const Duration(milliseconds: 100),
              ),
              TypewriterAnimatedText(
                'This world is inhabited by creatures called pokémon!',
                textStyle: kStyleHeadline1.copyWith(color: kColorTextBlack),
                speed: const Duration(milliseconds: 100),
              ),
              TypewriterAnimatedText(
                'For some people, pokémon are pets.',
                textStyle: kStyleHeadline1.copyWith(color: kColorTextBlack),
                speed: const Duration(milliseconds: 100),
              ),
              TypewriterAnimatedText(
                'Others use them for fights.',
                textStyle: kStyleHeadline1.copyWith(color: kColorTextBlack),
                speed: const Duration(milliseconds: 100),
              ),
              TypewriterAnimatedText(
                'Myself...I study pokémon as a profession.',
                textStyle: kStyleHeadline1.copyWith(color: kColorTextBlack),
                speed: const Duration(milliseconds: 100),
              ),
            ],
            totalRepeatCount: 1,
            pause: const Duration(microseconds: 500),
            displayFullTextOnTap: true,
          ),
          Icon(Icons.smart_button,color: kColorTextBlack,),
        ],
      ),
    );
  }

  Widget _animatedText() {
    return AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(
          'Welcome to Pokémon world!',
          textStyle: kStyleHeadline1.copyWith(color: kColorTextBlack),
          speed: const Duration(milliseconds: 100),
        ),
      ],
      totalRepeatCount: 1,
      pause: const Duration(milliseconds: 1000),
      displayFullTextOnTap: false,
      stopPauseOnTap: false,
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
