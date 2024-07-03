import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

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
        cutOutSize: MediaQuery.of(context).size.width * 0.6,
        borderLength: 0,
        borderColor: Colors.white,
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

