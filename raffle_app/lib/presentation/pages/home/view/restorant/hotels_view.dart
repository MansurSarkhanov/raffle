import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raffle_app/presentation/components/custom_text.dart';
import 'package:url_launcher/url_launcher.dart';

class HotelModel {
  final String name;
  final String location;
  final String imageUrl;
  HotelModel({required this.name, required this.location, required this.imageUrl});
}

final List<HotelModel> hotels = [
  HotelModel(
    imageUrl: 'assets/images/im_grand_hotel.png',
    location: "Nardaran kd.\nBaku, Azerbaijan",
    name: "Grand Hayat",
  ),
  HotelModel(
    imageUrl: 'assets/images/im_marriot_hotel.png',
    location: "674 Azadliq Square\nBaku, Azerbaijan",
    name: "Marriot Hotel",
  ),
  HotelModel(
    imageUrl: 'assets/images/im_seabreaz_hotel.png',
    location: "Nardaran kd.\nBaku, Azerbaijan",
    name: "Sea Breeze Hotel",
  ),
  HotelModel(
    imageUrl: 'assets/images/im_excelsior_hotel.png',
    location: "2 Heydar Aliyev Ave,\nBaku, Azerbaijan",
    name: "Excelsior Hotel",
  )
];

class HotelsView extends StatelessWidget {
  const HotelsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                hotelHeaderWidget(title: 'Arriving', subTime: '2 Jun 2024'),
                hotelHeaderWidget(title: 'Leaving', subTime: '3 Jun 2024'),
              ],
            ),
            searchHeader(),
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

  Row searchHeader() {
    return Row(
      children: [
        Container(
          width: 68.w,
          height: 66.h,
          decoration: BoxDecoration(
              color: const Color(0xFFD9D9D9),
              border: Border.all(color: const Color(0xFF797979), strokeAlign: BorderSide.strokeAlignOutside)),
          child: Center(
            child: Image.asset(
              'assets/icons/ic_location.png',
              height: 24,
              width: 24,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 66.h,
            decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                border: Border.all(color: const Color(0xFF797979), strokeAlign: BorderSide.strokeAlignOutside)),
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
                        fontSize: 12.sp, color: Colors.black, fontWeight: FontWeight.w400, fontFamily: 'Helvetica'),
                    prefixIconConstraints: const BoxConstraints(minHeight: 15),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Image.asset(
                        'assets/icons/ic_search.png',
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
        color: const Color(0xFFD9D9D9),
        border: Border.all(
          strokeAlign: BorderSide.strokeAlignOutside,
          color: const Color(0xFF797979),
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
            ),
            const SizedBox(
              height: 3,
            ),
            TitleHeading1Widget(
              text: subTime,
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
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
                    onTap: () async {
                      if (!await launchUrl(Uri.parse('https://nergizrestoran.az/'))) {
                        throw Exception('Could not launch');
                      }
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 160,
                          width: 160,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
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
