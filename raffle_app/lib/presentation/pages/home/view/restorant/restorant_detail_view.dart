import 'package:flutter/material.dart';

class RestorantDetailView extends StatelessWidget {
  const RestorantDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 370,
            flexibleSpace: Stack(children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/im_burger.png'),
                  ),
                ),
              ),
              Positioned(
                top: 60,
                left: 12,
                right: 12,
                child: Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.arrow_back_ios_new),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/icons/ic_adress.png',
                          height: 18,
                          width: 18,
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/icons/ic_share.png',
                          height: 18,
                          width: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
