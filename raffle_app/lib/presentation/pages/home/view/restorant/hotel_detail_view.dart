import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:raffle_app/features/restaurants/presentation/page/food_restorant_detail_view.dart';
import 'package:raffle_app/presentation/pages/home/view/restorant/hotels_view.dart';

import '../../../../components/custom_text.dart';

class HotelDetailView extends StatefulWidget {
  const HotelDetailView({super.key, required this.hotelModel});
  final HotelModel hotelModel;

  @override
  State<HotelDetailView> createState() => _HotelDetailViewState();
}

class _HotelDetailViewState extends State<HotelDetailView> {
  final GlobalKey silverListKey = GlobalKey();
  final GlobalKey middleKey = GlobalKey();
  final GlobalKey roomKey = GlobalKey();

  void handleScroll() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Scrollable.ensureVisible(
        silverListKey.currentContext!,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
      );
      await Scrollable.ensureVisible(
        middleKey.currentContext!,
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeInOut,
      );
      Scrollable.ensureVisible(
        roomKey.currentContext!,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.only(left: 12.0, right: 12, bottom: 12),
      //   child: RestorantBottomNavBar(
      //     tabController: tabController,
      //   ),
      // ),
      bottomNavigationBar: Container(
        height: 74,
        color: Colors.transparent,
        child: DetailBottomBar(
          roomPressed: () {
            handleScroll();
          },
          personPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  child: Material(
                    borderRadius: BorderRadius.circular(16),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: const Icon(Icons.close),
                            ),
                            const SizedBox(
                              height: 42,
                            ),
                            Row(
                              children: [
                                const TitleHeading1Widget(
                                  text: 'Adults',
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                ),
                                const Spacer(),
                                InkWell(
                                  child: Container(
                                      decoration: BoxDecoration(border: Border.all(color: const Color(0xFFD0D0D7))),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 18),
                                        child: TitleHeading1Widget(
                                          text: '-',
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                                  child: TitleHeading1Widget(
                                    text: '1',
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                InkWell(
                                  child: Container(
                                    decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 18),
                                      child: TitleHeading1Widget(
                                        text: '+',
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                const TitleHeading1Widget(
                                  text: 'Children',
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                ),
                                const Spacer(),
                                InkWell(
                                  child: Container(
                                      decoration: BoxDecoration(border: Border.all(color: const Color(0xFFD0D0D7))),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 20),
                                        child: TitleHeading1Widget(
                                          text: '-',
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                                  child: TitleHeading1Widget(
                                    text: '0',
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                InkWell(
                                  child: Container(
                                    decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 18),
                                      child: TitleHeading1Widget(
                                        text: '+',
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 122,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(31),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 13),
                                  child: Center(
                                    child: TitleHeading1Widget(
                                      text: "Update",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 33,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
          pickerPressed: () {},
        ),
      ),

      backgroundColor: const Color(0xFFF9F9F9),
      body: CustomScrollView(
        slivers: [
          RestorantImageAppBar(
            imageUrl: widget.hotelModel.detailImageUrl,
            isRestorant: false,
          ),
          SliverPadding(
            key: silverListKey,
            padding: EdgeInsets.only(top: 20.h),
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
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
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
                            statusIcon(path: 'save_filled', text: "Save"),
                            const SizedBox(
                              width: 12,
                            ),
                            statusIcon(path: 'favorite_red', text: "Like"),
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
                        const TitleHeading1Widget(
                          text: '1.900 people love this place',
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF2D2D32),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const TitleHeading1Widget(
                          text: 'About',
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF2D2D32),
                          textDecoration: TextDecoration.underline,
                        ),
                        TitleHeading1Widget(
                          key: middleKey,
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
                          color: Color(0xFF505050),
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
                          color: Color(0xFF505050),
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
                          color: Color(0xFF505050),
                          thickness: 0.3,
                        ),
                        hotelServices(imagePath: 'information', title: 'Need to Know'),
                      ],
                    ),
                  ),
                  SizedBox(
                    key: roomKey,
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
                ],
              ),
            ),
          ),
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
          color: const Color(0xFF2D2D32),
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
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: const Color(0xFFFFFFFF), boxShadow: [
        BoxShadow(
          blurRadius: 7,
          color: const Color(0xFF000000).withOpacity(.15),
          offset: const Offset(0, 2),
        )
      ]),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/ic_$path.svg',
             
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

class DetailBottomBar extends StatelessWidget {
  const DetailBottomBar({
    super.key,
    required this.roomPressed,
    required this.personPressed,
    required this.pickerPressed,
  });
  final VoidCallback roomPressed;
  final VoidCallback personPressed;
  final VoidCallback pickerPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.25),
            spreadRadius: 5,
            blurRadius: 32,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15, top: 16, bottom: 24),
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: pickerPressed,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(36),
                      color: const Color(0xFFE9E9E9),
                      border: Border.all(color: const Color(0xFF7D7D7D))),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: TitleHeading1Widget(
                      text: '4-5 Jun',
                      fontSize: 13,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: personPressed,
              child: Container(
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
                      TitleHeading1Widget(
                        text: '1',
                        fontSize: 13,
                        textAlign: TextAlign.center,
                      ),
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
            ),
            Expanded(
              child: InkWell(
                onTap: roomPressed,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(36),
                      color: const Color(0xFFE9E9E9),
                      border: Border.all(color: const Color(0xFF7D7D7D))),
                  child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: TitleHeading1Widget(
                        text: 'Rooms',
                        fontSize: 13,
                        textAlign: TextAlign.center,
                      )),
                ),
              ),
            ),
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
