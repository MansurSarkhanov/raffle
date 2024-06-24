import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:raffle_app/presentation/components/custom_text.dart';
import 'package:raffle_app/presentation/pages/map/map_page.dart';

import 'hotel_detail_view.dart';

class HotelModel {
  final String name;
  final String location;
  final String imageUrl;
  final String detailImageUrl;
  HotelModel({
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.detailImageUrl,
  });
}

final List<HotelModel> hotels = [
  HotelModel(
    imageUrl: 'assets/images/im_grand_hotel.png',
    location: "Nardaran kd.\nBaku, Azerbaijan",
    name: "Grand Hotel",
    detailImageUrl: 'assets/images/im_grand_hotel_detail.png',
    
  ),
  HotelModel(
      imageUrl: 'assets/images/im_marriot_hotel.png',
      location: "674 Azadliq Square\nBaku, Azerbaijan",
      name: "Marriot Hotel",
      detailImageUrl: 'assets/images/im_marriot_hotel_detail.png'),
  HotelModel(
      imageUrl: 'assets/images/im_seabreaz_hotel.png',
      location: "Nardaran kd.\nBaku, Azerbaijan",
      name: "Sea Breeze Hotel",
      detailImageUrl: 'assets/images/im_seabreaz_hotel_detail.png'),
  HotelModel(
      imageUrl: 'assets/images/im_excelsior_hotel.png',
      location: "2 Heydar Aliyev Ave,\nBaku, Azerbaijan",
      name: "Excelsior Hotel",
      detailImageUrl: 'assets/images/im_excelsior_hotel_detail.png')
];

class HotelsView extends StatelessWidget {
  const HotelsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 35),
            Row(
              children: [
                hotelHeaderWidget(title: 'Arriving', subTime: '2 Jun 2024'),
                hotelHeaderWidget(title: 'Leaving', subTime: '3 Jun 2024'),
              ],
            ),
            searchHeader(context),
            const Column(
              children: [
                SearchHotelResult(),
                SearchHotelResult(),
                SearchHotelResult(),
                SearchHotelResult(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Row searchHeader(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return const MapPage();
              },
            ));
          },
          child: Container(
            width: 68.w,
            height: 66.h,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10, color: const Color(0xFF858585).withOpacity(0.25), offset: const Offset(0, 2))
                ],
                color: const Color(0xFFF9F9F9),
                border: Border.all(color: const Color(0xFFD0D0D7), strokeAlign: BorderSide.strokeAlignOutside)),
            child: Center(
              child: SvgPicture.asset(
                'assets/svg/ic_location_dark.svg',
                height: 24,
                width: 24,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 66.h,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10, color: const Color(0xFF858585).withOpacity(0.25), offset: const Offset(0, 2))
                ],
                color: const Color(0xFFF9F9F9),
                border: Border.all(color: const Color(0xFFD0D0D7), strokeAlign: BorderSide.strokeAlignOutside)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 19.0),
                child: TextField(
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Destination or Hotel',
                    hintStyle: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xFFAEAEB8),
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Helvetica'),
                    prefixIconConstraints: const BoxConstraints(minHeight: 15),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Image.asset(
                        'assets/icons/ic_search.png',
                        color: const Color(0xFFAEAEB8),
                        height: 15,
                        width: 15,
                      ),
                    ),
                    isDense: true,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Expanded hotelHeaderWidget({required String title, required String subTime}) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        border: Border.all(
          strokeAlign: BorderSide.strokeAlignOutside,
          color: const Color(0xFFD0D0D7),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 11.0),
        child: Column(
          children: [
            TitleHeading1Widget(
              text: title,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF444444),

            ),
            const SizedBox(
              height: 3,
            ),
            TitleHeading1Widget(
              text: subTime,
              fontSize: 19,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF444444),
            )
          ],
        ),
      ),
    ));
  }
}

class SearchHotelResult extends StatelessWidget {
  const SearchHotelResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 20),
            child: TitleHeading1Widget(
              text: 'Five Stars',
              fontSize: 23.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: TitleHeading1Widget(
              text: 'The latest additions to the selection',
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 19,
          ),
          SizedBox(
            height: 226.h,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: hotels.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 12),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                        return HotelDetailView(hotelModel: hotels[index]);
                      }));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 160,
                          width: 160,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(image: AssetImage(hotels[index].imageUrl))),
                        ),
                        SizedBox(height: 12.h),
                        TitleHeading1Widget(
                          text: hotels[index].name,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        TitleHeading1Widget(
                          text: hotels[index].location,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 42.h,
          ),
          const Divider(
            color: Colors.black,
            height: 0,
          )
        ],
      ),
    );
  }
}
