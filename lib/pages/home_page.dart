import 'package:cozy_app/models/space_model.dart';
import 'package:cozy_app/models/tips_model.dart';
import 'package:cozy_app/providers/space_provider.dart';
import 'package:cozy_app/theme.dart';
import 'package:cozy_app/widget/bottom_navbar_item.dart';
import 'package:cozy_app/widget/city_card_widget.dart';
import 'package:cozy_app/widget/space_card_widget.dart';
import 'package:cozy_app/widget/tips_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:cozy_app/models/city_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            SizedBox(
              height: edge,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Explore Now',
                style: blackTextStyle.copyWith(fontSize: 24),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Mencari kosan yang cozy',
                style: greyTextStyle.copyWith(fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Popular Cities',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const SizedBox(
                    width: 24,
                  ),
                  CityCardWidget(City(
                      id: 1,
                      name: 'Jakarta',
                      imageURL: 'assets/images/city1.png',
                      isPopular: false)),
                  const SizedBox(
                    width: 20,
                  ),
                  CityCardWidget(City(
                      id: 2,
                      name: 'Bandung',
                      imageURL: 'assets/images/city2.png',
                      isPopular: true)),
                  const SizedBox(
                    width: 20,
                  ),
                  CityCardWidget(City(
                      id: 2,
                      name: 'Surabaya',
                      imageURL: 'assets/images/city3.png',
                      isPopular: false)),
                  const SizedBox(
                    width: 24,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Recommended Space',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: edge),
                child: FutureBuilder(
                  future: spaceProvider.getRecommendedSpaces(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Space> data = snapshot.data;

                      int index = 0;

                      return Column(
                        children: data.map((item) {
                          index++;
                          return Container(
                            margin: EdgeInsets.only(top: index == 1 ? 0 : 30),
                            child: SpaceCardWidget(item),
                          );
                        }).toList(),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                )),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Tips & Guidance',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Column(
                children: [
                  TipsCardWidget(Tips(
                      id: 1,
                      title: 'City Guidlines',
                      imageURL: 'assets/images/tips1.png',
                      updatedAt: '20 Apr')),
                  const SizedBox(
                    height: 20,
                  ),
                  TipsCardWidget(Tips(
                      id: 2,
                      title: 'Jakarta Fairship',
                      imageURL: 'assets/images/tips2.png',
                      updatedAt: '11 Dec')),
                ],
              ),
            ),
            SizedBox(
              height: 50 + edge,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(horizontal: edge),
        decoration: BoxDecoration(
            color: Color(0xffF6F7F8), borderRadius: BorderRadius.circular(23)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imageURL: 'assets/images/Icon_home.png',
              isActive: true,
            ),
            BottomNavbarItem(
              imageURL: 'assets/images/Icon_mail.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageURL: 'assets/images/Icon_card.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageURL: 'assets/images/Icon_love.png',
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
