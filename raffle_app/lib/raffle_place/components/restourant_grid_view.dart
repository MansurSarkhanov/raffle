import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/features/restaurants/presentation/notifier/restourants_notifier.dart';
import 'package:raffle_app/features/restaurants/presentation/notifier/restourants_state.dart';
import 'package:raffle_app/raffle_place/components/restorant_grid_card.dart';

class RestaurantGridView extends StatelessWidget {
  const RestaurantGridView({
    super.key,
    required this.controller,
  });
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return Consumer<RestourantsNotifier>(
      builder: (context, notifier, child) {
        if (notifier.state is RestourantsProgress) {
          return Center(child: Lottie.asset('assets/images/lottie_loading.json'));
        } else if (notifier.state is RestourantsSuccess) {
          final restorants = notifier.state as RestourantsSuccess;
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: .7, crossAxisSpacing: 30, mainAxisSpacing: 30),
            padding: EdgeInsets.only(left: 15, right: 15, top: 18, bottom: Platform.isIOS ? 102 : 100),
            itemCount: restorants.restaurants.length,
            itemBuilder: (context, index) {
              return InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () async {
                  // await context.read<RestourantsNotifier>().selectRestorant(index);
                  controller.jumpToPage(1);
                },
                child: RestaurantGridCard(
                  gradient: gradients[index],
                  restaurantModel: restorants.restaurants[index],
                ),
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
