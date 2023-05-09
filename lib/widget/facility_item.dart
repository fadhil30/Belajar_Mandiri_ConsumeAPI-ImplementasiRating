// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:cozy_app/theme.dart';

class FacilityItem extends StatelessWidget {
  final String name;
  final String imageURL;
  final int total;

  const FacilityItem({
    Key key,
    this.name,
    this.imageURL,
    this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageURL,
          width: 32,
        ),
        const SizedBox(
          height: 8,
        ),
        Text.rich(TextSpan(
            text: '$total',
            style: purpleTextStyle.copyWith(fontSize: 14),
            children: [
              TextSpan(
                  text: ' $name',
                  style: greyTextStyle.copyWith(
                      fontSize: 14, fontWeight: FontWeight.w300))
            ])),
      ],
    );
  }
}
