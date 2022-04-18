import 'package:flutter/material.dart';
import 'package:pokedex/utils/constants.dart';

import 'img.dart';

class CellMap extends StatelessWidget {
  const CellMap({
    Key? key,
    required String this.url,
    required String this.mapName,
  }) : super(key: key);

  final String url;
  final String mapName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        print(value);
      },
      onTap: () {},
      child: AnimatedContainer(
        width: 100,
        duration: Duration(milliseconds: 100),
        child: Column(
          children: [
            Img(
              url: url,
            ),
            SizedBox(height: kPaddingS),
            Text(
              mapName,
              style: kStyleBodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
