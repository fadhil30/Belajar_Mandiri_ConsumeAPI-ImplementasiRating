import 'package:cozy_app/models/tips_model.dart';
import 'package:cozy_app/theme.dart';
import 'package:flutter/material.dart';

class TipsCardWidget extends StatelessWidget {
  final Tips tips;

  TipsCardWidget(this.tips);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          tips.imageURL,
          width: 80,
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tips.title,
              style: blackTextStyle.copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Updated ${tips.updatedAt}',
              style: greyTextStyle,
            ),
          ],
        ),
        Spacer(),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chevron_right,
              size: 24,
              color: greyColor,
            ))
      ],
    );
  }
}
