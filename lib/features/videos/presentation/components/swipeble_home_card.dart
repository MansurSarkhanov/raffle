import 'dart:async';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/core/theme/theme_ext.dart';
import 'package:raffle_app/features/videos/presentation/notifier/video_notifier.dart';
import 'package:raffle_app/features/videos/presentation/notifier/video_state.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:video_player/video_player.dart';

import '../../../../l10n/app_localizations.dart';

class SwipebleHomeCards extends StatefulWidget {
  const SwipebleHomeCards({
    super.key,
    required this.isActive,
  });
  final bool isActive;

  @override
  State<SwipebleHomeCards> createState() => _SwipebleHomeCardsState();
}

class _SwipebleHomeCardsState extends State<SwipebleHomeCards> {
  final PageController controller = PageController();
  late Timer _timer; // Otomatik geçiş için Timer
  int _currentPage = 0;
  List<VideoItem>? videoItems;

  // @override
  // void didUpdateWidget(covariant SwipebleHomeCards oldWidget) {
  //   super.didUpdateWidget(oldWidget);

  //   if (!widget.isActive) {
  //     for (var video in videoItems) {
  //       video.controller.setVolume(0);
  //     }
  //   }
  // }

  @override
  void initState() {
    super.initState();
    context.read<VideoNotifier>().getVideos();

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
      final totalPages = 1 + (videoItems?.length ?? 0);

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
    for (int i = 0; i < (videoItems?.length ?? 0); i++) {
      if (index == i + 1) {
        videoItems![i].controller.play();
      } else {
        videoItems![i].controller.pause();
      }
    }
  }

  @override
  void dispose() {
    for (var video in videoItems ?? []) {
      video.dispose();
    }
    controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant SwipebleHomeCards oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.isActive) {
      for (var video in videoItems ?? <VideoItem>[]) {
        video.controller.setVolume(0.0);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VideoNotifier>(builder: (context, provider, child) {
      if (provider.state is VideoProgress) {
        return CircularProgressIndicator();
      } else if (provider.state is VideoSuccess) {
        final state = provider.state as VideoSuccess;
        videoItems ??= state.vidoes
            ?.map((e) => VideoItem(e.videoUrl, videoMode: e.videoMode))
            .toList();
        final List<Widget> cards = [
          _simpleCard(context),
          ...videoItems!.map((video) => _buildVideoCard(video)).toList()
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    child: cards[index],
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
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
      return SizedBox.shrink();
    });
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
  final String videoMode;
  late final VideoPlayerController controller;
  late final ChewieController chewieController;
  late final Future<void> initializeFuture;

  VideoItem(this.url, {required this.videoMode}) {
    controller = VideoPlayerController.networkUrl(Uri.parse(url));
    initializeFuture = controller.initialize().then((_) {
      chewieController = ChewieController(
        autoInitialize: true,
        isLive: false,
        showControls: false,
        videoPlayerController: controller,
        autoPlay: false,
        looping: true,
        aspectRatio: videoMode == 'Portrait' ? 9 / 16 : 1.5,
      );
    });
  }

  void dispose() {
    controller.dispose();
    chewieController.dispose();
  }
}
