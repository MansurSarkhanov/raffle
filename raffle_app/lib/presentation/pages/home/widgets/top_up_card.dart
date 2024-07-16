import 'package:flutter/material.dart';
import 'package:raffle_app/core/theme/theme_ext.dart';

import '../../top_up/top_up_page.dart';

class TopUpCard extends StatelessWidget {
  const TopUpCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: const Color(0xFF000000).withOpacity(.25),
              offset: const Offset(0, 4),
            )
          ],
          borderRadius: BorderRadius.circular(29),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFF07DC70),
              Color(0xFF69F70F),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 23),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Available Wallet Balance',
                    style: context.typography.body1Regular.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'AED100.00',
                    style: context.typography.body1Regular.copyWith(fontSize: 18, fontWeight: FontWeight.w700),
                  )
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TopUpPage(),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.black,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: const Color(0xFF000000).withOpacity(.25),
                        offset: const Offset(0, 4),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 11.0, horizontal: 28),
                    child: Text(
                      'Top-up',
                      style: context.typography.body2Bold.copyWith(color: Colors.white, fontSize: 13),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}