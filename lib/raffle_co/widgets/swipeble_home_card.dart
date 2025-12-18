import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raffle_app/core/theme/theme_ext.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:video_player/video_player.dart';

class SwipebleHomeCards extends StatefulWidget {
  const SwipebleHomeCards({
    super.key,
  });

  @override
  State<SwipebleHomeCards> createState() => _SwipebleHomeCardsState();
}

class _SwipebleHomeCardsState extends State<SwipebleHomeCards> {
  final PageController controller = PageController();
  late Timer _timer; // Otomatik geçiş için Timer
  int _currentPage = 0;
  late VideoPlayerController _videoPlayerController1;
  late VideoPlayerController _videoPlayerController2;
  late ChewieController _chewieController1;
  late ChewieController _chewieController2;
  late Future<void> _initializedVideoPlayerFuture1;
  late Future<void> _initializedVideoPlayerFuture2;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
    _videoPlayerController1 = VideoPlayerController.networkUrl(
      Uri.parse('https://emiland.com/front/videos/Emiland_Header.mp4'),
    );
    _initializedVideoPlayerFuture1 = _videoPlayerController1.initialize().then((_) {
      _chewieController1 = ChewieController(
        autoInitialize: true,
        isLive: false,
        showOptions: false,
        showControls: false,
        videoPlayerController: _videoPlayerController1,
        autoPlay: false, // Başlangıçta otomatik oynatma kapalı
        looping: true,
        aspectRatio: 1.5,
      );
    });

    // İkinci video için controller ve future initialization
    _videoPlayerController2 = VideoPlayerController.networkUrl(
      Uri.parse(
          'https://firebasestorage.googleapis.com/v0/b/raffle-1b71c.appspot.com/o/videos%2F1%20Minute%20of%20PARIS.mp4?alt=media&token=49e29a28-7a21-43e1-8f90-059f43b96240'),
    );
    _initializedVideoPlayerFuture2 = _videoPlayerController2.initialize().then((_) {
      _chewieController2 = ChewieController(
        autoInitialize: true,
        isLive: false,
        showOptions: false,
        showControls: false,
        videoPlayerController: _videoPlayerController2,
        autoPlay: false, // Başlangıçta otomatik oynatma kapalı
        looping: true,
        aspectRatio: 1.5,
      );
    });

    controller.addListener(() {
      final newPage = controller.page!.round();
      if (_currentPage != newPage) {
        setState(() {
          _currentPage = newPage;
        });
        _handleVideoPlayback(newPage);
      }
    });
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {
        // Sayfa sayısı - 1 (örneğin, 3 sayfa varsa 2)
        _currentPage++;
      } else {
        _currentPage = 0; // En son sayfada ise başa döner
      }
      controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300), // Sayfa geçiş animasyonu süresi
        curve: Curves.easeInOut, // Geçiş animasyonu eğrisi
      );
    });
  }

  void _handleVideoPlayback(int newPage) {
    // Yeni sayfaya göre video kontrolü
    if (newPage == 1) {
      _videoPlayerController1.play();
      _videoPlayerController2.pause();
    } else if (newPage == 2) {
      _videoPlayerController2.play();
      _videoPlayerController1.pause();
    }
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController1.dispose();
    _videoPlayerController2.dispose();
    _chewieController2.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> cards = [
      _simpleCard(context),
      Container(
        height: 318.h,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: const Color(0xFF000000).withOpacity(.25),
              offset: const Offset(0, 4),
            )
          ],
          color: const Color(0xFFEF920F),
          borderRadius: BorderRadius.circular(40),
        ),
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(40), // Yuvarlatılmış köşeler için
                child: FittedBox(
                  fit: BoxFit.cover, // Videonun Container'a tamamen sığması için
                  child: SizedBox(
                    width: _chewieController1.videoPlayerController.value.size.width, // Video genişliği
                    height: _chewieController1.videoPlayerController.value.size.height, // Video yüksekliği
                    child: Chewie(controller: _chewieController1),
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
            }
          },
          future: _initializedVideoPlayerFuture1,
        ),
      ),
      Container(
        height: 318.h,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: const Color(0xFF000000).withOpacity(.25),
              offset: const Offset(0, 4),
            )
          ],
          color: const Color(0xFFEF920F),
          borderRadius: BorderRadius.circular(40),
        ),
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(40), // Yuvarlatılmış köşeler için
                child: FittedBox(
                  fit: BoxFit.cover, // Videonun Container'a tamamen sığması için
                  child: SizedBox(
                    width: _chewieController2.videoPlayerController.value.size.width, // Video genişliği
                    height: _chewieController2.videoPlayerController.value.size.height, // Video yüksekliği
                    child: Chewie(controller: _chewieController2),
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
            }
          },
          future: _initializedVideoPlayerFuture2,
        ),
      ),
    ];
    return Column(
      children: [
        SizedBox(
          height: 344.h,
          child: PageView.builder(
            controller: controller,
            itemCount: cards.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: cards[index],
              );
            },
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 36.0),
            child: SmoothPageIndicator(
              effect: const ExpandingDotsEffect(
                  dotColor: Color(0xFFA6A6A6), activeDotColor: Color(0xFF424242), dotHeight: 8, dotWidth: 8),
              controller: controller,
              count: cards.length,
            ),
          ),
        )
      ],
    );
  }

  Container _simpleCard(BuildContext context) {
    return Container(
      height: 318.h,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: const Color(0xFF000000).withOpacity(.25),
            offset: const Offset(0, 4),
          )
        ],
        color: const Color(0xFFEF920F),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 36),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            AppLocalizations.of(context)!.big_dream,
            style: context.typography.largeTitle2Bold.copyWith(
              color: Colors.white,
              fontSize: 52,
              fontWeight: FontWeight.w900,
              height: 43 / 52,
            ),
          ),
        ),
      ),
    );
  }
}
