import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:raffle_app/presentation/components/custom_text.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    bearing: 61.683738708496094,
    target: LatLng(40.589069476818636, 49.97578002512455),
    zoom: 14.635245323181152,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: Row(
              children: [
                mapSelectedButton(),
                mapSelectedButton(),
                const SizedBox(
                  width: 12,
                ),
                mapSelectedButton(),
                const SizedBox(
                  width: 12,
                )
              ],
            )),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(onTap: () {}, child: const Icon(Icons.arrow_back_ios)),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleHeading1Widget(
                  text: 'Map Area',
                  fontSize: 13,
                ),
                TitleHeading1Widget(text: '2-3 Jun 2024', fontSize: 13)
              ],
            ),
          ],
        ),
      ),
      body: GoogleMap(
        onCameraMove: (position) {
          print(position.zoom);
          print(position.bearing);
          print(position.target);
        },
        mapType: MapType.terrain,
        initialCameraPosition: _kGooglePlex,
      ),
    );
  }

  GestureDetector mapSelectedButton() {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(right: 8.w),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: const Color(0xffBDBDBD)),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 9),
          child: TitleHeading1Widget(
            text: 'All',
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 13.sp,
          ),
        ),
      ),
    );
  }
}
