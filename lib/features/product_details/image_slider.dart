import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dot_indicator.dart';

class ProductDetailsImageSlider extends StatefulWidget {
  final List<dynamic> sliderData;

  const ProductDetailsImageSlider({
    Key? key,
    required this.sliderData,
  }) : super(key: key);

  @override
  ProductDetailsImageSliderState createState() =>
      ProductDetailsImageSliderState();
}

class ProductDetailsImageSliderState extends State<ProductDetailsImageSlider> {
  int _carouselIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.2,
              viewportFraction: 1.0,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              onPageChanged: (index, reason) {
                setState(
                  () => _carouselIndex = index,
                );
              },
            ),
            items: widget.sliderData.map(
              (image) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              },
            ).toList(),
          ),
          Positioned.fill(
            bottom: 12,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ProductDetailsDotIndicator(
                dotsCount: widget.sliderData.length,
                selectedIndex: _carouselIndex,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
