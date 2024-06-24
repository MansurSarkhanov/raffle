import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:raffle_app/presentation/components/custom_text.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    return const QRViewExample();
    // return Scaffold(
    //   body: Container(
    //     width: double.infinity,
    //     height: double.infinity,
    //     decoration: const BoxDecoration(
    //       gradient: LinearGradient(
    //         begin: Alignment.topCenter,
    //         end: Alignment.bottomCenter,
    //         colors: [
    //           Color(0xFF000000), // #000000
    //           Color(0xFFBB0000), // #BB0000 33.01%
    //           Color(0xFFA80000), // #A80000 67.5%
    //           Color(0xFF000000), // #000000 100%
    //           Color(0xFF020101), // #020101 100%
    //         ],
    //         stops: [
    //           0.0, // 0%
    //           0.3301, // 33.01%
    //           0.675, // 67.5%
    //           1.0, // 100%
    //           1.0, // 100%
    //         ],
    //       ),
    //     ),
    //     child: Column(
    //       children: [
    //         const SizedBox(
    //           height: 50,
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.only(left: 8, bottom: 20),
    //           child: Row(
    //             children: [
    //               Container(
    //                 alignment: Alignment.center,
    //                 width: 40,
    //                 height: 40,
    //                 decoration: const BoxDecoration(
    //                   shape: BoxShape.circle,
    //                   color: Color(
    //                     0xffd9d9d9,
    //                   ),
    //                 ),
    //                 child: IconButton(
    //                     onPressed: () {
    //                       Navigator.pop(context);
    //                     },
    //                     icon: const Icon(Icons.close)),
    //               )
    //             ],
    //           ),
    //         ),
    //         const SizedBox(
    //           height: 80,
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 80.0),
    //           child: SizedBox(
    //             child: Image.asset('assets/images/im_restaurants_qr.png'),
    //           ),
    //         ),

    //         Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 0.0),
    //           child: ClipRRect(
    //             borderRadius: BorderRadius.circular(22),
    //             child: SizedBox(
    //               height: 200,
    //               width: 200,

    //               // child: Image.asset(
    //               //   'assets/images/im_scan_qr.png',
    //               //   fit: BoxFit.cover,
    //               // ),
    //               child: MobileScanner(
    //                 controller: MobileScannerController(
    //                   detectionSpeed: DetectionSpeed.noDuplicates,
    //                   returnImage: true,
    //                 ),
    //                 onDetect: (capture) {
    //                   final List<dynamic> barcodes = capture.barcodes;
    //                   final Uint8List? image = capture.image;
    //                   for (final barcode in barcodes) {
    //                     // log('Barcode found! ${barcode.rawValue}');
    //                   }
    //                   if (image != null) {
    //                     showDialog(
    //                       context: context,
    //                       builder: (context) {
    //                         return AlertDialog(
    //                           title: Text(
    //                             barcodes.first.rawValue ?? "",
    //                           ),
    //                           content: Image(
    //                             image: MemoryImage(image),
    //                           ),
    //                         );
    //                       },
    //                     );
    //                   }
    //                 },
    //               ),
    //             ),
    //           ),
    //         ),
    //         const SizedBox(
    //           height: 60,
    //         ),
    //         Container(
    //           width: 130,
    //           decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8.27)),
    //           child: Padding(
    //             padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 4),
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //               children: [
    //                 const Column(
    //                   children: [
    //                     Text(
    //                       '1.787',
    //                       style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
    //                     ),
    //                       Text(
    //                       'SOLD',
    //                       style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Color(0xFFAA1414)),
    //                     ),
    //                   ],
    //                 ),
    //                 Container(
    //                   height: 50,
    //                   width: 2,
    //                   color: Colors.black,
    //                 ),
    //                 const Text('OUT OF \n1985',
    //                     textAlign: TextAlign.center,
    //                     style: TextStyle(
    //                       fontWeight: FontWeight.w500,
    //                       fontSize: 11,
    //                     ))
    //               ],
    //             ),
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}

class QRViewExample extends StatefulWidget {
  const QRViewExample({super.key});

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Arka planda bulanıklaştırılmış kamera görüntüsü
          Positioned.fill(
            child: MobileScanner(
              onDetect: (
                barcode,
              ) {
                setState(() {
                  // result = barcode;
                });
              },
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                  decoration: BoxDecoration(
                // color: Colors.black.withOpacity(0),
                gradient: LinearGradient(

            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
                    const Color(0xFF000000).withOpacity(1), // #000000
                    const Color(0xFFBB0000).withOpacity(0.5), // #BB0000 33.01%
                    const Color(0xFFA80000).withOpacity(0.5), // #A80000 67.5%
                    const Color(0xFF000000).withOpacity(1), // #000000 100%
                    const Color(0xFF020101).withOpacity(1), // #020101 100%
            ],
                  stops: const [
              0.0, // 0%
              0.3301, // 33.01%
              0.675, // 67.5%
              1.0, // 100%
              1.0, // 100%
            ],
                ),
              )
              ),
            ),
          ),
          // Ortadaki QR kod okuma alanı
          Center(
            child: Column(
              children: [
                const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 20),
              child: Row(
                children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                      const Spacer(),
                      const TitleHeading1Widget(
                        text: 'Scan to Pay and Win',
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      const Spacer(),
                      const TitleHeading1Widget(
                        text: 'Help',
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 87,
                ),
            
               
                Container(
                  width: 276,
                  height: 276,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(77), bottomRight: Radius.circular(77)),
                  ),
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.only(topLeft: Radius.circular(77), bottomRight: Radius.circular(77)),

                    child: MobileScanner(
                      onDetect: (
                        barcode,
                      ) {
                        setState(() {
                          // result = barcode;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 23,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(9)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset('assets/svg/ic_light.svg'),
                      ),
                    ),
                    const SizedBox(
                      width: 47,
                    ),
                    Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(9)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset('assets/svg/ic_keyboard.svg'),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 121,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 19.5),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xFF141617).withOpacity(.5), borderRadius: BorderRadius.circular(6.38)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 42.0, vertical: 12),
                          child: Column(
                            children: [
                              SvgPicture.asset('assets/svg/ic_scan_qr.svg'),
                              const SizedBox(
                                height: 16,
                              ),
                              const TitleHeading1Widget(
                                text: 'QR',
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xFF141617).withOpacity(.5),
                              borderRadius: BorderRadius.circular(6.38)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 42.0, vertical: 12),
                            child: Column(
                              children: [
                                TitleHeading1Widget(
                                  text: 'BALANCE : 40.000 ₽',
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                                SizedBox(
                                  height: 14.5,
                                ),
                                TitleHeading1Widget(
                                  text: 'WALLET',
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )

                //     Container(
                //   width: 130,
                //   decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8.27)),
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 4),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //       children: [
                //         const Column(
                //           children: [
                //             Text(
                //               '1.787',
                //               style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                //             ),
                //               Text(
                //               'SOLD',
                //               style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Color(0xFFAA1414)),
                //             ),
                //           ],
                //         ),
                //         Container(
                //           height: 50,
                //           width: 2,
                //           color: Colors.black,
                //         ),
                //         const Text('OUT OF \n1985',
                //             textAlign: TextAlign.center,
                //             style: TextStyle(
                //               fontWeight: FontWeight.w500,
                //               fontSize: 11,
                //             ))
                //       ],
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
