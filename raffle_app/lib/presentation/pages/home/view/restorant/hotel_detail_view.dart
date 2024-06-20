import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:raffle_app/presentation/pages/home/view/restorant/hotels_view.dart';
import 'package:raffle_app/presentation/pages/home/view/restorant/restorant_detail_view.dart';

import '../../../../components/custom_text.dart';

class HotelDetailView extends StatefulWidget {
  const HotelDetailView({super.key, required this.hotelModel});
  final HotelModel hotelModel;

  @override
  State<HotelDetailView> createState() => _HotelDetailViewState();
}

class _HotelDetailViewState extends State<HotelDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.only(left: 12.0, right: 12, bottom: 12),
      //   child: RestorantBottomNavBar(
      //     tabController: tabController,
      //   ),
      // ),
      backgroundColor: const Color(0xFFF9F9F9),
      body: CustomScrollView(
        slivers: [
          RestorantImageAppBar(
            imageUrl: widget.hotelModel.detailImageUrl,
            isRestorant: false,
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 39.h),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 11.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleHeading1Widget(
                          text: widget.hotelModel.name,
                          fontSize: 24,
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
                          height: 40,
                        ),
                        hotelServices(imagePath: 'leaf', title: 'Sustainability'),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          height: 0,
                          thickness: 0.3,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        hotelServices(imagePath: 'review', title: 'No guest reviewa yet'),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          height: 0,
                          thickness: 0.3,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        hotelServices(imagePath: 'wifi', title: 'Amenities'),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          height: 0,
                          thickness: 0.3,
                        ),
                        hotelServices(imagePath: 'information', title: 'Need to Know'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const DetailHotelImage(
                    image: 'bed',
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  const DetailHotelImage(
                    image: 'bed2',
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  const DetailHotelImage(
                    image: 'bed3',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(36),
                                  color: const Color(0xFFE9E9E9),
                                  border: Border.all(color: const Color(0xFF7D7D7D))),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: Center(child: Text('4 - 5 Jun')),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 8.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(36),
                                color: const Color(0xFFE9E9E9),
                                border: Border.all(color: const Color(0xFF7D7D7D))),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 19),
                              child: Center(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('1'),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Icon(
                                    Icons.person_rounded,
                                    size: 15,
                                  )
                                ],
                              )),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(36),
                                  color: const Color(0xFFE9E9E9),
                                  border: Border.all(color: const Color(0xFF7D7D7D))),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: Center(child: Text('Rooms')),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Row hotelServices({required String imagePath, required String title}) {
    return Row(
      children: [
        Image.asset(
          'assets/icons/ic_$imagePath.png',
          height: 61,
          width: 49,
        ),
        const SizedBox(
          width: 34,
        ),
        TitleHeading1Widget(
          text: title,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        const Spacer(),
        const Icon(
          Icons.keyboard_arrow_right,
          color: Color(0xFF505050),
        )
      ],
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

class DetailHotelImage extends StatelessWidget {
  const DetailHotelImage({
    super.key,
    required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/im_$image.png',
        ),
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 11.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleHeading1Widget(
                        text: 'Fifth Avenue Junior Suite\nDeluxe Twin',
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                      ),
                      TitleHeading1Widget(
                        text: 'Fits 2 people\nChildren are under\n1 King Bed\n745 ft2/69 m2',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF505050),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.keyboard_arrow_right_outlined,
                    color: Color(0xFF505050),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleHeading1Widget(
                        text: '\$ 2528',
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                      ),
                      TitleHeading1Widget(
                        text: 'Per night',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF505050),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFAEAEB8)),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                      child: TitleHeading1Widget(
                        text: 'SELECT',
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              const TitleHeading1Widget(
                text: 'Taxes excluded\nİncludes: Breakfast\nFree Cancellation by Jun 2, 2024',
                fontSize: 12,
                color: Color(0xFF505050),
              )
            ],
          ),
        )
      ],
    );
  }
}
