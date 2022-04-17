import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/utils/constants.dart' as cons;
import 'package:flutter_boiler_plate/utils/wgt.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';

enum ImageQuality {
  low,
  normal,
}

class Img extends StatelessWidget {
  static const kImageQuality = 100;

  final String url;
  final String? heroKey;
  final BoxFit fit;
  final double radius;
  final bool darken;
  final double opacity;
  final bool greyed;
  final bool loaderBox;
  final double loaderBoxWidth;
  final bool loaderSquare;
  final ImageQuality imageQuality;

  const Img({
    Key? key,
    required this.url,
    this.radius = cons.radius,
    this.fit = BoxFit.cover,
    this.darken = false,
    this.opacity = 0,
    this.greyed = false,
    this.heroKey,
    this.loaderBox = false,
    this.loaderBoxWidth = 200.0,
    this.loaderSquare = false,
    this.imageQuality = ImageQuality.normal
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (url == '') {
      return _widgetError();
    }

    if (heroKey != null && heroKey != '') return Hero(tag: heroKey ?? '', child: _image());

    return _image();
  }

  Widget _image() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
          greyed ? Colors.grey : Colors.transparent,
          BlendMode.saturation,
        ),
        child: CachedNetworkImage(
          memCacheHeight: imageQuality == ImageQuality.low ? Img.kImageQuality : null,
          memCacheWidth: imageQuality == ImageQuality.low ? Img.kImageQuality : null,
          imageBuilder: darken
              ? (context, image) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: fit,
                        image: image,
                        colorFilter: ColorFilter.mode(
                          const Color(0xff1D1D1D).withOpacity(opacity),
                          BlendMode.darken,
                        ),
                      ),
                    ),
                  );
                }
              : null,
          fit: fit,
          // ignore: unnecessary_string_interpolations
          imageUrl: '$url',
          imageRenderMethodForWeb: ImageRenderMethodForWeb.HttpGet,
          placeholder: (context, url) {
            if (loaderBox) {
              return Wgt.loaderBox(
                width: loaderBoxWidth,
                square: loaderSquare,
              );
            }
            return SizedBox(child: Wgt.loaderController());
          },
          errorWidget: (context, url, error) => _widgetError(),
        ),
      ),
    );
  }

  Widget _widgetError() {
    return const Icon(Icons.error);
  }
}
