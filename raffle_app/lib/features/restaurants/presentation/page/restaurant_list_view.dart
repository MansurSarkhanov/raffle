import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/features/restaurants/presentation/notifier/restourants_notifier.dart';
import 'package:raffle_app/features/restaurants/presentation/notifier/restourants_state.dart';
import 'package:raffle_app/features/restaurants/presentation/page/place_of_restaurants_list.dart';

import '../../../../presentation/pages/home/widgets/restorant_card.dart';

class RestaurantListView extends StatelessWidget {
  const RestaurantListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<RestourantsNotifier>(
      builder: (context, notifier, child) {
        if (notifier.state is RestourantsProgress) {
          return Center(child: Lottie.asset('assets/images/lottie_loading.json'));
        } else if (notifier.state is RestourantsSuccess) {
          final restorants = notifier.state as RestourantsSuccess;
          return ListView.builder(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 18, bottom: 40),
            itemCount: restorants.restaurants.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, CupertinoPageRoute(
                        builder: (context) {
                          return PlaceOfRestaurantsList(places: restorants.restaurants[index].places);
                        },
                      )
                          // RouteHelper.createRoute(
                          //     routeName: PlaceOfRestaurantsList(places: restorants.restaurants[index].places),
                          //     location: RoutingLocation.rightToLeft),
                          );
                    },
                    child: RestaurantCard(
                      restaurantModel: restorants.restaurants[index],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  )
                ],
              );
            },
          );
        }
        return const Center(
          child: Text("Error"),
        );
      },
    );
  }
}
