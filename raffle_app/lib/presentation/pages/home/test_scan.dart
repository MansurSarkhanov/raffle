import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../core/utilities/helper/route.dart';
import '../../../features/profile/presentation/notifier/profile_notifier.dart';
import '../../components/custom_text.dart';
import '../wallet/wallet_card_page.dart';

class QRCodeScreen extends StatefulWidget {
  const QRCodeScreen({super.key});
  @override
  ScanScreenState createState() => ScanScreenState();
}

class ScanScreenState extends State<QRCodeScreen> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? barcode;
  // RxBool isVisible = true.obs;

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  void onQRViewCreated(QRViewController controller) {
    controller.scannedDataStream.listen((barcode) {
      this.barcode = barcode;
      // qrController.readQrCode(barcode.code.toString());
    });
    readQr();
  }

  _buildQrViewWidget(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
        overlayColor: Colors.white.withOpacity(0.6),
        cutOutHeight: 276,
        cutOutWidth: 276,
        borderRadius: 20,
        cutOutBottomOffset: 100,
        borderLength: 138,
        borderColor: Colors.black,
      ),
    );
  }

  void readQr() async {
    if (barcode != null) {
      controller!.pauseCamera();
      controller!.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Center(
      child: Stack(
        children: [
        
          Positioned(
            top: 0,
            child: _scanQrCodeWidget(context),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                        width: 19,
                      ),
                    ],
                  ),
                ),
                const Spacer(
                ),
               
                Container(
                  height: 92,
                  width: 92,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(77),
                      bottomRight: Radius.circular(77),
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/im_qr.png',
                    height: 92,
                    width: 92,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      // onTap: toggleFlashlight,
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
                  height: 60,
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
                                      child: const WalletCardPage(
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
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _scanQrCodeWidget(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: _buildQrViewWidget(context),
    );
  }

  _iconButtonWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(
          // bottom: Dimensions.marginSizeVertical,
          ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        GestureDetector(
          onTap: () {
            // Get.toNamed(Routes.balanceToBalanceScreen);
          },
          child: const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.black,
          ),
        ),
      ]),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    // qrController.dispose();
    super.dispose();
  }
}


  // void onQRViewCreated(QRViewController? controller) {
  //   setState(() => this.controller = controller);
  //   // this.controller = controller;
  //   controller!.scannedDataStream.listen((barcode) => setState(() {
  //         this.barcode = barcode;
  //         sendMoneyController.getCheckUserWithQrCodeData(
  //           this.barcode!.code.toString(),
  //         );
  //         // Get.back();
  //         debugPrint(this.barcode!.code);
  //
  //         sendMoneyController.copyInputController.text = this.barcode!.code!;
  //         Get.toNamed(Routes.balanceToBalanceScreen);
  //
  //         readQr();
  //       }));
  // }

