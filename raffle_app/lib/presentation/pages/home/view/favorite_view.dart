import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:raffle_app/presentation/pages/home/view/profile_detail.dart';

import '../../../../raffle_co/view/wallet_tab.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundColorCard(
            downColor: Color(0xFFEEEEEE),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF1A026C),
                Color(0xFF7518E8),
                Color(0xFFEEEEEE),
              ],
            ),
          ),
          Column(
            children: [
              const TopUpAppBar(
                text: 'Favorites',
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 200,
                      ),
                      SvgPicture.asset('assets/svg/Vector.svg'),
                      const SizedBox(
                        height: 32,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 60.0),
                        child: Text(
                          'No favorites yet. Double tap an item to add it to your favorites.',
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
