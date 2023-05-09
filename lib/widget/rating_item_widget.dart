// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class RatingItemWidget extends StatelessWidget {
  final int index;
  final int rating;
  const RatingItemWidget({
    this.index,
    this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      index <= rating
          ? 'assets/images/Icon_star.png'
          : 'assets/images/Icon_star_grey',
      width: 20,
    );
  }
}
