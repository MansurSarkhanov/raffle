import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:raffle_app/presentation/components/custom_text.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController _controller;
  final Set<Marker> _markers = {
    const Marker(
      markerId: MarkerId("Seabreeze"),
      position: LatLng(40.590320, 49.984705),
    ),
    const Marker(
      markerId: MarkerId("2"),
      position: LatLng(40.590776, 49.982623),
    ),
    const Marker(
      markerId: MarkerId("33"),
      position: LatLng(40.588691, 49.982473),
    ),
    const Marker(
      markerId: MarkerId("4"),
      position: LatLng(40.589701, 49.978160),
    ),
    const Marker(
      markerId: MarkerId("56"),
      position: LatLng(40.591412, 49.979512),
    ),
    const Marker(
      markerId: MarkerId("55"),
      position: LatLng(40.589929, 49.981036),
    ),
    const Marker(
      markerId: MarkerId("55"),
      position: LatLng(40.591868, 49.987494),
    ),
    const Marker(
      markerId: MarkerId("89"),
      position: LatLng(40.591640, 49.990970),
    ),
    const Marker(
      markerId: MarkerId("23424"),
      position: LatLng(40.591526, 49.977366),
    ),
  };
  static const CameraPosition _kGooglePlex = CameraPosition(
    bearing: 61.683738708496094,
    target: LatLng(40.589069476818636, 49.97578002512455),
    zoom: 14.635245323181152,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56,
        backgroundColor: const Color(0xFFF1F1F1),
      title: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),

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
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            compassEnabled: false,
            zoomControlsEnabled: false,
            onCameraMove: (position) {
              print(position.zoom);
              print(position.bearing);
              print(position.target);
            },
            mapType: MapType.terrain,
            initialCameraPosition: _kGooglePlex,
            markers: _markers,
          ),
          Positioned(
              bottom: 32,
              child: Container(
                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(36)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 10),
                  child: SvgPicture.asset(
                    'assets/svg/ic_map_setting.svg',
                    height: 17,
                    width: 25,
                  ),
                ),
              ))
        ],
      ),
    );
  }

  GestureDetector mapSelectedButton({required String title, bool isSelected = false, bool isSale = false}) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(right: 8.w),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF48484A) : Colors.transparent,
          border: isSelected == true ? null : Border.all(width: 1, color: const Color(0xffBDBDBD)),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 9),
          child: Row(
            children: [
              if (isSale) ...[
                SvgPicture.asset(
                  'assets/svg/ic_sale.svg',
                  height: 14.5,
                  width: 14.5,
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
              TitleHeading1Widget(
                text: title,
                color: isSelected ? const Color(0xFFD9D9D9) : const Color(0xFF48484A),
                fontWeight: FontWeight.w600,
                fontSize: 13.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
