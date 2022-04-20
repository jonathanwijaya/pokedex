import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/utils/constants.dart';

class ProfessorOakDialog extends StatelessWidget {
  const ProfessorOakDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          Icon(
            Icons.smart_button,
            color: kColorTextBlack,
          ),
        ],
      ),
    );
  }
}
