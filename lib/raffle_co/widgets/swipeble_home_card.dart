import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raffle_app/core/theme/theme_ext.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:video_player/video_player.dart';

import '../../l10n/app_localizations.dart';

class SwipebleHomeCards extends StatefulWidget {
  const SwipebleHomeCards({
    super.key, required this.isActive,
  });
  final bool isActive;

  @override
  State<SwipebleHomeCards> createState() => _SwipebleHomeCardsState();
}

class _SwipebleHomeCardsState extends State<SwipebleHomeCards> {
  final PageController controller = PageController();
  late Timer _timer; // Otomatik geçiş için Timer
  int _currentPage = 0;
  late List<VideoItem> videoItems;
@override
void didUpdateWidget(covariant SwipebleHomeCards oldWidget) {
  super.didUpdateWidget(oldWidget);

  if (!widget.isActive) {
    for (var video in videoItems) {
      video.controller.setVolume(0);
    }
  }
}
  @override
  void initState() {
    super.initState();
    videoItems = [
      VideoItem('https://firebasestorage.googleapis.com/v0/b/raffle-ec654.appspot.com/o/11%20September%202025.mp4?alt=media&token=f31b9f41-6619-4c94-9b2d-177f2886deb0'),
      VideoItem('https://firebasestorage.googleapis.com/v0/b/raffle-ec654.appspot.com/o/%F0%9F%92%AD%20What%20would%20YOU%20do%20with%20AED5%2C000%2C000%20.mp4?alt=media&token=524b96ed-fc42-4d15-a36d-db6dec509699'),
      VideoItem('https://firebasestorage.googleapis.com/v0/b/raffle-ec654.appspot.com/o/Win%20AED1%2C000%2C000%20with%20Dream%20Dubai%20%26%20Mai%20Dubai%F0%9F%9A%A8.mp4?alt=media&token=ca469332-3149-4369-8d54-ec93eddc10dc'),

      // VideoItem('https://emiland.com/front/videos/Emiland_Header.mp4'),
      VideoItem(
        aspectRatio: 1.5,
          'https://firebasestorage.googleapis.com/v0/b/raffle-1b71c.appspot.com/o/videos%2F1%20Minute%20of%20PARIS.mp4?alt=media&token=49e29a28-7a21-43e1-8f90-059f43b96240'),
    ];

    controller.addListener(() {
      final newPage = controller.page!.round();
      if (_currentPage != newPage) {
        setState(() {
          _currentPage = newPage;
        });
        _handleVideoPlayback(newPage);
      }
    });
    _startAutoScroll();
  }
void _startAutoScroll() {
  _timer = Timer.periodic(const Duration(seconds: 6), (Timer timer) {
    final totalPages = 1 + videoItems.length; // 1 basit kart + video kartları

    if (_currentPage < totalPages - 1) {
      _currentPage++;
    } else {
      _currentPage = 0;
    }

    controller.animateToPage(
      _currentPage,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  });
}


 void _handleVideoPlayback(int index) {
  for (int i = 0; i < videoItems.length; i++) {
    if (index == i + 1) {
      videoItems[i].controller.play();
    } else {
      videoItems[i].controller.pause();
    }
  }
}


  @override
  void dispose() {
    for (var video in videoItems) {
      video.dispose();
    }
    controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> cards = [
      _simpleCard(context),
      ...videoItems.map((video) => _buildVideoCard(video)).toList(),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
                  dotColor: Color(0xFFA6A6A6),
                  activeDotColor: Color(0xFF424242),
                  dotHeight: 8,
                  dotWidth: 8),
              controller: controller,
              count: cards.length,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildVideoCard(VideoItem video) {
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
      child: FutureBuilder(
        future: video.initializeFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: video.controller.value.size.width,
                  height: video.controller.value.size.height,
                  child: Chewie(controller: video.chewieController),
                ),
              ),
            );
          } else {
            return const Center(
                child: CircularProgressIndicator(color: Colors.blue));
          }
        },
      ),
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

class VideoItem {
  final String url;
  final double? aspectRatio;
  late final VideoPlayerController controller;
  late final ChewieController chewieController;
  late final Future<void> initializeFuture;

  VideoItem(this.url,{this.aspectRatio,}) {

    controller = VideoPlayerController.networkUrl(Uri.parse(url));
    initializeFuture = controller.initialize().then((_) {
      chewieController = ChewieController(
        autoInitialize: true,
        isLive: false,
        showControls: false,
        videoPlayerController: controller,
        autoPlay: false,
        looping: true,
        aspectRatio: aspectRatio?? 9/16,
      );
    });
  }

  void dispose() {
    controller.dispose();
    chewieController.dispose();
  }
}
