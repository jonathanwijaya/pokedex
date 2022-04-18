import 'package:flutter/material.dart';

class FadeInImageCustom extends StatefulWidget {
  int duration;
  String asset;
  double begin;
  double end;
  double imageHeight;

  FadeInImageCustom({
    required this.duration,
    required this.asset,
    required this.begin,
    required this.end,
    required this.imageHeight,
    Key? key,
  }) : super(key: key);

  @override
  State<FadeInImageCustom> createState() => _FadeInImageCustomState();
}

class _FadeInImageCustomState extends State<FadeInImageCustom> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: Duration(milliseconds: widget.duration),
    vsync: this,
  );
  late final _animation = Tween(begin: widget.begin, end: widget.end).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller.forward(from: 0.0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.imageHeight,
      child: FadeTransition(
        opacity: _animation,
        child: Image(
          image: AssetImage(widget.asset),
        ),
      ),
    );
  }
}
