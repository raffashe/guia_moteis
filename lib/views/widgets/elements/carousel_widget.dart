import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../data/models/hotel_model.dart';
import '../hotels_details/product_card_gallery_widget.dart';

class CarouselWidget extends StatefulWidget {
  final Hotel hotel;

  const CarouselWidget({required this.hotel, super.key});

  @override
  _CarouselWidgetState createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 20 / 9,
            viewportFraction: 0.9,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: widget.hotel.suites.map((suite) {
            return Builder(
              builder: (BuildContext context) {
                return ProductCardGalleryWidget(
                  hotel: widget.hotel,
                  period: suite.periods.first,
                  onPressed: () {},
                );
              },
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.hotel.suites.map((suite) {
            int index = widget.hotel.suites.indexOf(suite);
            return Container(
              width: 8.0,
              height: 8.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? AppColors.fontSecondary
                    : Colors.grey,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
