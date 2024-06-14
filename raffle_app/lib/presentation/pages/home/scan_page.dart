import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xFF000000), // #000000
                const Color(0xFFBB0000).withOpacity(0.33), // #BB0000 33.01%
                const Color(0xFFA80000).withOpacity(0.675), // #A80000 67.5%
                const Color(0xFF000000), // #000000 100%
                const Color(0xFF020101), // #020101 100%
              ],
              stops: const [
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
              SizedBox(
                width: 300,
                height: 100,
                child: Image.asset('assets/images/im_restaurants_qr.png'),
              ),
              const SizedBox(
                height: 100,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: SizedBox(
                  width: 300,
                  height: 300,
                  child: MobileScanner(
                    controller: MobileScannerController(
                      detectionSpeed: DetectionSpeed.noDuplicates,
                      returnImage: true,
                    ),
                    onDetect: (capture) {
                      final List<Barcode> barcodes = capture.barcodes;
                      final Uint8List? image = capture.image;
                      for (final barcode in barcodes) {
                        // log('Barcode found! ${barcode.rawValue}');
                      }
                      if (image != null) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                barcodes.first.rawValue ?? "",
                              ),
                              content: Image(
                                image: MemoryImage(image),
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Container(
                width: 130,
                height: 60,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Column(
                        children: [
                          Text(
                            '1787',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            'SOLD',
                            style: TextStyle(color: Colors.red, fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      Container(
                        height: 50,
                        width: 2,
                        color: Colors.black,
                      ),
                      const Column(
                        children: [
                          Text('OUT OF', style: TextStyle(fontWeight: FontWeight.w500)),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            '1985',
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
