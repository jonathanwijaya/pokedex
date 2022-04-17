import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/utils/constants.dart';
import 'package:flutter_boiler_plate/utils/extensions.dart';

class CellOutlet extends StatelessWidget {
  final String title;
  final Function handler;
  const CellOutlet({
    Key? key,
    required this.title,
    required this.handler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Material(
            color: kColorBgSecondary,
            child: InkWell(
              onTap: () => handler(),
              child: Padding(
                padding: const EdgeInsets.all(kPaddingS),
                child: Text(
                  title,
                  style: context.bodyText1(),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 1,
          width: double.infinity,
          child: Container(color: Colors.grey[800]),
        ),
      ],
    );
  }
}
