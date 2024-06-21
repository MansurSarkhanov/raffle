import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../components/custom_text.dart';

class RestorantDetailView extends StatelessWidget {
  const RestorantDetailView({super.key, required this.tabController});
  final TabController tabController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.only(left: 12.0, right: 12, bottom: 12),
      //   child: RestorantBottomNavBar(
      //     tabController: tabController,
      //   ),
      // ),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          const RestorantImageAppBar(
            imageUrl: 'assets/images/im_burger.png',
            isRestorant: true,
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 39.h, horizontal: 11.w),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  const TitleHeading1Widget(
                    text: 'PEACH',
                    fontSize: 24,
                    letterSpacing: 4,
                    fontWeight: FontWeight.w700,
                  ),
                  const TitleHeading1Widget(
                    text: 'г. Москва',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                  const TitleHeading1Widget(
                    text: 'Б. Саввинский переулок, 12 стр. 10г',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      statusIcon(path: 'correct', text: "Already been"),
                      const SizedBox(
                        width: 12,
                      ),
                      statusIcon(path: 'save_yellow', text: "Save"),
                      const SizedBox(
                        width: 12,
                      ),
                      statusIcon(path: 'favorite', text: "Like"),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset('assets/svg/ic_users_profile.svg'),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    '1.900 people love this place',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const TitleHeading1Widget(
                    text: 'About',
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    textDecoration: TextDecoration.underline,
                  ),
                  const TitleHeading1Widget(
                    text:
                        'Концепция ресторана высокой кухни построена вокруг легенды обожественном фрукте — персике,воздействующем сразу на пять органовчувств. Вкус — это меню, зрение иосязание — интерьер, слух — музыка. Обоняние — парфюмерная композиция,наполняющая пространство тонкимароматом цветущих персиковых деревьев.',
                    fontSize: 16,
                    fontFamily: "Helvetica",
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w400,
                  ),
                  const SizedBox(
                    height: 44,
                  ),
                  const Divider(
                    thickness: 0.3,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const TitleHeading1Widget(
                    text: 'Тариф',
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const Row(
                    children: [
                      TitleHeading1Widget(
                        text: '5.000 ',
                        color: Colors.red,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                      TitleHeading1Widget(
                        text: 'рублей',
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ],
                  ),
                  const TitleHeading1Widget(
                    text: 'Средний чек',
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Divider(
                    thickness: 0.3,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const TitleHeading1Widget(
                    text: 'Address and hours',
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 3),
                  const TitleHeading1Widget(
                    text: 'Б. Саввинский переулок, 12 стр. 10г',
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                      height: 203.h,
                      child: Image.asset(
                        'assets/images/im_map.png',
                        fit: BoxFit.cover,
                      )),
                  const SizedBox(
                    height: 32,
                  ),
                  ContactWidget(
                    onPressed: () async {
                      if (!await launchUrl(Uri.parse('https://agalarovrest.com/restorany/peach/'))) {}
                    },
                    text: 'Visit website',
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ContactWidget(
                    onPressed: () {},
                    text: '+7 (495) 909 00 69',
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Row(
                    children: [
                      TimeCard(),
                      SizedBox(
                        width: 20,
                      ),
                      TimeCard(),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Row(
                    children: [
                      TimeCard(),
                      SizedBox(
                        width: 20,
                      ),
                      TimeCard(),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Row(
                    children: [
                      TimeCard(),
                      SizedBox(
                        width: 20,
                      ),
                      TimeCard(),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container statusIcon({required String path, required String text}) {
    return Container(
      width: 78.w,
      height: 46.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: const Color(0xFFEFEFEF)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/ic_$path.svg',
              height: 20,
              width: 20,
            ),
            TitleHeading1Widget(
              fontFamily: 'Helvetica',
              text: text,
              fontWeight: FontWeight.w500,
              fontSize: 10,
            )
          ],
        ),
      ),
    );
  }
}

class TimeCard extends StatelessWidget {
  const TimeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFECECEC),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(blurRadius: 1, spreadRadius: -5, color: Color(0xFF757575), offset: Offset(0, 5)),
          ],
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 17.0, horizontal: 21),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('понедельник'),
              SizedBox(
                height: 10,
              ),
              Text('12:00 - 00:00'),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactWidget extends StatelessWidget {
  const ContactWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String? text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(64),
          color: const Color(0xFFECECEC),
          boxShadow: const [
            BoxShadow(blurRadius: 1, spreadRadius: -5, color: Color(0xFF757575), offset: Offset(0, 5)),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 22),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/svg/ic_arrow_right_top.svg',
              ),
              SizedBox(
                width: 22.w,
              ),
              TitleHeading1Widget(
                text: text ?? '',
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RestorantImageAppBar extends StatelessWidget {
  const RestorantImageAppBar({
    super.key,
    required this.imageUrl,
    this.isRestorant = false,
  });
  final String imageUrl;
  final bool? isRestorant;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xFFF9F9F9),
      expandedHeight: 370.h,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(imageUrl),
                ),
              ),
            ),
            Positioned(
              top: 60,
              left: 12,
              right: 12,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/icons/ic_arrow_left.png',
                          height: 18,
                          width: 18,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
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
                  SizedBox(width: 8.w),
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
            isRestorant ?? false
                ? const Positioned(
                    bottom: 4,
                    right: 12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TitleHeading1Widget(
                          text: 'Restoran adı 1/9',
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        )
                      ],
                    ))
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
