import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/presentation/components/custom_text.dart';

import '../../../core/utilities/helper/route.dart';
import '../../../features/profile/presentation/notifier/profile_notifier.dart';
import '../wallet/wallet_card_page.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key, required this.controller});
  final TabController controller;
  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CameraView(controller: widget.controller),
    );
  }
}

class CameraView extends StatefulWidget {
  const CameraView({super.key, required this.controller});
  final TabController controller;

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  late CameraController controller;
  final CameraDescription description =
      const CameraDescription(name: 'name', lensDirection: CameraLensDirection.back, sensorOrientation: 0);
  @override
  void initState() {
    super.initState();
    controller = CameraController(description, ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  Future<void> toggleFlashlight() async {
    if (controller.value.isInitialized) {
      if (controller.value.flashMode == FlashMode.off) {
        await controller.setFlashMode(FlashMode.torch);
        setState(() {});
      } else {
        await controller.setFlashMode(FlashMode.off);
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return Stack(
      children: [
        Positioned.fill(child: CameraPreview(controller)),
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
                  const Color(0xFF000000).withOpacity(.9), // #000000
                  const Color(0xFFBB0000).withOpacity(0.3), // #BB0000 33.01%
                  const Color(0xFFA80000).withOpacity(0.4), // #A80000 67.5%
                  const Color(0xFF000000).withOpacity(.8), // #000000 100%
                  const Color(0xFF020101).withOpacity(.9), // #020101 100%
                ],
                stops: const [
                  0.0, // 0%
                  0.3301, // 33.01%
                  0.675, // 67.5%
                  1.0, // 100%
                  1.0, // 100%
                ],
              ),
            )),
          ),
        ),
        // Ortadaki QR kod okuma alanı
        Center(
          child: Column(
            children: [
              const SizedBox(
                height: 56,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 20),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          widget.controller.index = 0;
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
                      width: 19,
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
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(77),
                      bottomRight: Radius.circular(77),
                    ),
                  ),
                  child: ClipRRect(
                      borderRadius:
                          const BorderRadius.only(topLeft: Radius.circular(77), bottomRight: Radius.circular(77)),
                      child: CameraPreview(
                        controller,
                        child: Padding(
                          padding: const EdgeInsets.all(80.0),
                          child: Image.asset(
                            'assets/images/im_qr.png',
                          ),
                        ),
                      ))),
              const SizedBox(
                height: 23,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: toggleFlashlight,
                    child: Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(9)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset('assets/svg/ic_light.svg'),
                      ),
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
                          color: const Color(0xFF141617).withOpacity(.6), borderRadius: BorderRadius.circular(6.38)),
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
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            RouteHelper.createRoute(
                                routeName: ChangeNotifierProvider.value(
                                    value: context.read<ProfileNotifier>(),
                                    child: WalletCardPage(
                                      controller: widget.controller,
                                    )),
                                location: RoutingLocation.rightToLeft,
                                transitionTime: 500,
                                reverseTransitionTime: 250),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xFF141617).withOpacity(.6),
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
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class MobileScannerView extends StatelessWidget {
  MobileScannerView({
    super.key,
  });
  final MobileScannerController controller = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: MobileScanner(
            controller: controller,
            onDetect: (
              barcode,
            ) {},
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
                  const Color(0xFF000000).withOpacity(.9), // #000000
                  const Color(0xFFBB0000).withOpacity(0.3), // #BB0000 33.01%
                  const Color(0xFFA80000).withOpacity(0.4), // #A80000 67.5%
                  const Color(0xFF000000).withOpacity(.8), // #000000 100%
                  const Color(0xFF020101).withOpacity(.9), // #020101 100%
                ],
                stops: const [
                  0.0, // 0%
                  0.3301, // 33.01%
                  0.675, // 67.5%
                  1.0, // 100%
                  1.0, // 100%
                ],
              ),
            )),
          ),
        ),
        // Ortadaki QR kod okuma alanı
        Center(
          child: Column(
            children: [
              const SizedBox(
                height: 56,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 20),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          // widget.controller.index = 0;
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
                      width: 19,
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
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.only(topLeft: Radius.circular(77), bottomRight: Radius.circular(77)),
                      child: MobileScanner(
                        controller: controller,
                        onDetect: (
                          barcode,
                        ) {},
                      ),
                    ),
                    Image.asset(
                      'assets/images/im_qr.png',
                      height: 92,
                      width: 92,
                    )
                  ],
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
                          color: const Color(0xFF141617).withOpacity(.6), borderRadius: BorderRadius.circular(6.38)),
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
                      child: InkWell(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   RouteHelper.createRoute(
                          //       routeName: ChangeNotifierProvider.value(
                          //           value: context.read<ProfileNotifier>(),
                          //           child: WalletCardPage(
                          //             controller: widget.controller,
                          //           )),
                          //       location: RoutingLocation.rightToLeft,
                          //       transitionTime: 500,
                          //       reverseTransitionTime: 250),
                          // );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xFF141617).withOpacity(.6),
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
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
