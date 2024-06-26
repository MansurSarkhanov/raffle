import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/presentation/pages/home/widgets/place_of_restorant_card.dart';

import '../notifier/restourants_notifier.dart';
import 'food_restorant_detail_view.dart';

class PlaceOfRestaurantsList extends StatelessWidget {
  const PlaceOfRestaurantsList({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF9F9F9),
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 18, bottom: 40),
        itemCount: context
            .watch<RestourantsNotifier>()
            .restorantModel?[context.watch<RestourantsNotifier>().index]
            .places
            ?.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  final place = Provider.of<RestourantsNotifier>(context, listen: false)
                      .restorantModel?[Provider.of<RestourantsNotifier>(context, listen: false).index]
                      .places?[index];
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return FoodRestorantDetailView(placeModel: place);
                      },
                    ),
                  );
                },
                child: PlaceOfRestorantCard(
                  places: context
                      .watch<RestourantsNotifier>()
                      .restorantModel?[context.watch<RestourantsNotifier>().index]
                      .places?[index],
                ),
              ),
              const SizedBox(
                height: 16,
              )
            ],
          );
        },
      ),
    );
  }
}
