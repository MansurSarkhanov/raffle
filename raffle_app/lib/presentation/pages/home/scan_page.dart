import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF000000), // #000000
              Color(0xFFBB0000), // #BB0000 33.01%
              Color(0xFFA80000), // #A80000 67.5%
              Color(0xFF000000), // #000000 100%
              Color(0xFF020101), // #020101 100%
            ],
            stops: [
              0.0, // 0%
              0.3301, // 33.01%
              0.675, // 67.5%
              1.0, // 100%
              1.0, // 100%
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 20),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(
                        0xffd9d9d9,
                      ),
                    ),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close)),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80.0),
              child: SizedBox(
                child: Image.asset('assets/images/im_restaurants_qr.png'),
              ),
            ),
           
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: SizedBox(
                  height: 360.h,
                  width: double.infinity,

                  child: Image.asset(
                    'assets/images/im_scan_qr.png',
                    fit: BoxFit.cover,
                  ),
                  // child: MobileScanner(
                  //   controller: MobileScannerController(
                  //     detectionSpeed: DetectionSpeed.noDuplicates,
                  //     returnImage: true,
                  //   ),
                  //   onDetect: (capture) {
                  //     final List<Barcode> barcodes = capture.barcodes;
                  //     final Uint8List? image = capture.image;
                  //     for (final barcode in barcodes) {
                  //       // log('Barcode found! ${barcode.rawValue}');
                  //     }
                  //     if (image != null) {
                  //       showDialog(
                  //         context: context,
                  //         builder: (context) {
                  //           return AlertDialog(
                  //             title: Text(
                  //               barcodes.first.rawValue ?? "",
                  //             ),
                  //             content: Image(
                  //               image: MemoryImage(image),
                  //             ),
                  //           );
                  //         },
                  //       );
                  //     }
                  //   },
                  // ),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Container(
              width: 130,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8.27)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Column(
                      children: [
                        Text(
                          '1.787',
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                        ),
                          Text(
                          'SOLD',
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Color(0xFFAA1414)),
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      width: 2,
                      color: Colors.black,
                    ),
                    const Text('OUT OF \n1985',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 11,
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
