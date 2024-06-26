import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/features/restaurants/data/model/place_model.dart';
import 'package:raffle_app/features/restaurants/presentation/page/food_restorant_detail_view.dart';
import 'package:raffle_app/presentation/pages/home/widgets/place_of_restorant_card.dart';

import '../notifier/restourants_notifier.dart';
import '../notifier/restourants_state.dart';

class PlaceOfRestaurantsList extends StatelessWidget {
  const PlaceOfRestaurantsList({super.key, this.places});
  final List<Places>? places;
  @override
  Widget build(BuildContext context) {
    return Consumer<RestourantsNotifier>(
      builder: (context, notifier, child) {
        if (notifier.state is RestourantsProgress) {
          return Container(
              color: const Color(0xFFF9F9F9),
              child: Lottie.asset(
                'assets/images/lottie_loading.json',
              ));
        } else if (notifier.state is RestourantsSuccess) {
          return Container(
            color: const Color(0xFFF9F9F9),
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 18, bottom: 40),
              itemCount: places?.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return FoodRestorantDetailView(placeModel: places![index]);
                            },
                          ),
                        );

                        // Navigator.of(context).push(

                        //   MaterialPageRoute(
                        //     builder: (context) {
                        //       return FoodRestorantDetailView(placeModel: places![index]);
                        //     },
                        //   ),
                        // );
                      },
                      child: PlaceOfRestorantCard(
                        places: places?[index],
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
        return const Center(
          child: Text("Error"),
        );
      },
    );
  }
}
