import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewImageWidget extends StatefulWidget {
  final List<String> imageUrl;
  final String prizeName;
  const PageViewImageWidget({super.key, required this.imageUrl, required this.prizeName});

  @override
  State<PageViewImageWidget> createState() => _PageViewImageWidgetState();
}

class _PageViewImageWidgetState extends State<PageViewImageWidget> {
  bool isShownWinText = true;
  PageController pageController = PageController();
  List<String> finalUrls = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.imageUrl.length; i++) {
      if (widget.imageUrl.length > 1 && i != 0) {
        finalUrls.add(widget.imageUrl[i]);
      } else if (widget.imageUrl.length == 1) {
        finalUrls.add(widget.imageUrl[i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
      child: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            height: 260,
            child: PageView(
              onPageChanged: (value) {
                if (value != 0) {
                  setState(() {
                    isShownWinText = false;
                  });
                } else {
                  setState(() {
                    isShownWinText = true;
                  });
                }
              },
              controller: pageController,
              scrollDirection: Axis.horizontal,
              children: finalUrls
                  .map((e) => Container(
                        height: size.height * 0.3,
                        width: size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(color: Colors.white, width: 5),
                            image: const DecorationImage(
                                image: AssetImage('assets/images/im_attention.png'), fit: BoxFit.cover)),
                      ))
                  .toList(),
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: size.height * 0.115,
                width: size.width,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: size.width * 0.04),
                child: Row(
                  children: [
                    if (isShownWinText)
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('WIN',
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    height: 1,
                                    shadows: [
                                      const Shadow(
                                        offset: Offset(0, -2),
                                        blurRadius: 3.0,
                                        color: Colors.white,
                                      ),
                                    ],
                                    fontStyle: FontStyle.italic,
                                    color: const Color(0xFFDE3737),
                                    fontSize: 40,
                                    fontWeight: FontWeight.w700)),
                            Text(widget.prizeName,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    shadows: [
                                      const Shadow(
                                        offset: Offset(0, -0.5),
                                        blurRadius: 1.0,
                                        color: Colors.white,
                                      ),
                                    ],
                                    fontSize: 30,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white)),
                          ],
                        ),
                      ),
                    const Spacer(),
                    if (finalUrls.length != 1)
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: SmoothPageIndicator(
                            effect: WormEffect(
                                spacing: 3,
                                type: WormType.thin,
                                activeDotColor: Colors.grey,
                                dotColor: Colors.black.withOpacity(0.3),
                                dotHeight: 8,
                                dotWidth: 8),
                            controller: pageController,
                            count: finalUrls.length),
                      ),
                  ],
                ),
              ),
              // Positioned(
              //   bottom: -13.98,
              //   child: Container(
              //     width: 204,
              //     height: 26,
              //     decoration: BoxDecoration(
              //         color: const Color(0xFFFFE700),
              //         borderRadius: BorderRadius.circular(23)),
              //     alignment: Alignment.center,
              //     child: const Text(
              //       'Buy 4 & GET 20% OFF',
              //       style: TextStyle(
              //           fontSize: 12, fontWeight: FontWeight.w500),
              //     ),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
