import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../presentation/components/custom_text.dart';

class RestorantDetailView extends StatelessWidget {
  const RestorantDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: CustomScrollView(
        slivers: [
          const RestorantImageAppBar(
            imageUrl: 'assets/images/im_burger.png',
            isRestorant: true,
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 11.w),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  const TitleHeading1Widget(
                    text: 'PEACH',
                    fontSize: 28,
                    letterSpacing: 3,
                    color: Color(0xFF2D2D32),
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const TitleHeading1Widget(
                    text: 'г. Москва',
                    fontSize: 13,
                    color: Color(0xFF2D2D32),
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
                      statusIcon(
                        path: 'new_alreadyy',
                        text: "Already been",
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      statusIcon(path: 'save_empty', text: "Save"),
                      const SizedBox(
                        width: 12,
                      ),
                      statusIcon(path: 'favorite_empty', text: "Like"),
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
                  const Row(
                    children: [
                      TitleHeading1Widget(
                        text: '1.900 people ',
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        textDecoration: TextDecoration.underline,
                        color: Color(0xFF2D2D32),
                      ),
                      TitleHeading1Widget(
                        text: 'love this place',
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF2D2D32),
                      ),
                    ],
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
                  const SizedBox(
                    height: 4,
                  ),
                  const TitleHeading1Widget(
                    text:
                        'Концепция ресторана высокой кухни построена вокруг легенды обожественном фрукте — персике,воздействующем сразу на пять органовчувств. Вкус — это меню, зрение иосязание — интерьер, слух — музыка. Обоняние — парфюмерная композиция,наполняющая пространство тонкимароматом цветущих персиковых деревьев.',
                    fontSize: 16,
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF2D2D32),
                  ),
                  const SizedBox(
                    height: 44,
                  ),
                  const Divider(
                    thickness: 0.33,
                    color: Color(0xFFDCCCCC),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const TitleHeading1Widget(
                    text: 'Тариф',
                    fontSize: 23,
                    color: Color(0xFF2D2D32),
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
                        color: Color(0xFF2D2D32),
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const TitleHeading1Widget(
                    text: 'Средний чек',
                    color: Color(0xFF2D2D32),
                    fontSize: 16,
                    fontWeight: FontWeight.w200,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Divider(
                    thickness: 0.33,
                    color: Color(0xFFDCCCCC),
                  ),
                  const SizedBox(
                    height: 44,
                  ),
                  const TitleHeading1Widget(
                    text: 'Address and hours',
                    color: Color(0xFF2D2D32),
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 6),
                  const TitleHeading1Widget(
                    text: 'Б. Саввинский переулок, 12 стр. 10г',
                    fontSize: 16,
                    color: Color(0xFF2D2D32),
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
                    path: 'arrow_top_last',
                    onPressed: () async {
                      if (!await launchUrl(Uri.parse('https://agalarovrest.com/restorany/peach/'))) {}
                    },
                    text: 'Visit website',
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ContactWidget(
                    path: 'phone',
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

  Container statusIcon({required String path, required String text, bool? isAlready = false}) {
    return Container(
      width: 78.w,
      height: 46.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: const Color(0xFFFFFFFF), boxShadow: [
        BoxShadow(
          blurRadius: 7,
          offset: const Offset(0, 2),
          color: const Color(0xFF000000).withOpacity(.15),
        )
      ]),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/ic_$path.svg',
              height: 26,
              width: 26,
            ),
            TitleHeading1Widget(
              text: text,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF2D2D32),
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
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFEDEDED)),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 17.0, horizontal: 21),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TitleHeading1Widget(
                text: 'понедельник',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF2D2D32),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '12:00 - 00:00',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF2D2D32),
                ),
              ),
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
    required this.path,
  });
  final String? text;
  final String? path;

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
            color: const Color(0xFFFFFFFF),
            border: Border.all(color: const Color(0xFFEEEEEE))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 22),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/svg/ic_$path.svg',
                color: const Color(0xFF2D2D32),
              ),
              SizedBox(
                width: 22.w,
              ),
              Text(text ?? '',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xFF2D2D32),
                    fontWeight: FontWeight.w300,
                  )),
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
      surfaceTintColor: const Color(0xFFF9F9F9),
      pinned: true,
      floating: false,
      actions: [
        const SizedBox(
          width: 12,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Image.asset(
                'assets/icons/ic_arrow_left.png',
                color: const Color(0xFF333333),
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
            padding: const EdgeInsets.all(9.0),
            child: Image.asset(
              'assets/icons/ic_adress.png',
              color: const Color(0xFF333333),
              height: 18,
              width: 18,
            ),
          ),
        ),
        SizedBox(width: 8.w),
        Container(
          decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: Image.asset(
              'assets/icons/ic_share.png',
              color: const Color(0xFF333333),
              height: 18,
              width: 18,
            ),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
      ],
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xFFF9F9F9),
      expandedHeight: 360.h,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.none,
        background: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(imageUrl),
            ),
          ),
        ),
      ),
    );
  }
}
