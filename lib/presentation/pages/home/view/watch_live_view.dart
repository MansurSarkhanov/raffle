import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import '../../../../raffle_co/widgets/campaing_winner_widget.dart';

class WatchLiveScreen extends StatefulWidget {
  final String date;
  final String time;
  final String videoUrl;
  const WatchLiveScreen({super.key, required this.date, required this.time, required this.videoUrl});

  @override
  State<WatchLiveScreen> createState() => _WatchLiveScreenState();
}

class _WatchLiveScreenState extends State<WatchLiveScreen> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  late Future<void> _initializedVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl),
    );
    _initializedVideoPlayerFuture = _videoPlayerController.initialize().then((value) {
      _chewieController = ChewieController(
          videoPlayerController: _videoPlayerController,
          autoPlay: true,
          controlsSafeAreaMinimum: const EdgeInsets.only(left: 90, bottom: 5),
          looping: true,
          deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
          deviceOrientationsOnEnterFullScreen: [DeviceOrientation.portraitUp],
          aspectRatio: 9/16);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: size.height * 0.55,
                width: size.width,
                color: Colors.black,
                child: FutureBuilder(
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 120),
                        child: Chewie(controller: _chewieController),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      );
                    }
                  },
                  future: _initializedVideoPlayerFuture,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * 0.07,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.date,
                              style: const TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                            Text(
                              widget.time,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                                image: DecorationImage(image: AssetImage('assets/images/im_close_white.png'))),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    SizedBox(
                      height: size.height * 0.37,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                              image: DecorationImage(image: AssetImage('assets/images/im_eye.png'))),
                        ),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        const Text(
                          '1234',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04, vertical: size.height * 0.01),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: size.height * 0.02),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Campaings and Winners',
                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    const CamPaingAndWinnerWidget(
                        campaignNumber: '1',
                        prize: 'Campaing: Samsung Galaxy S23 Plus with Raffle Credit',
                        winner: ' Tofiq Mammadov (TM-12345)'),
                    const CamPaingAndWinnerWidget(
                        campaignNumber: '2',
                        prize: 'Campaing: Samsung Galaxy S23 Plus with Raffle Credit',
                        winner: ' Tofiq Mammadov (TM-12345)'),
                    const CamPaingAndWinnerWidget(
                        campaignNumber: '3',
                        prize: 'Campaing: Samsung Galaxy S23 Plus with Raffle Credit',
                        winner: ' Tofiq Mammadov (TM-12345)'),
                    const CamPaingAndWinnerWidget(
                        campaignNumber: '4',
                        prize: 'Campaing: Samsung Galaxy S23 Plus with Raffle Credit',
                        winner: ' Tofiq Mammadov (TM-12345)'),
                    const CamPaingAndWinnerWidget(
                        campaignNumber: '5',
                        prize: 'Campaing: Samsung Galaxy S23 Plus with Raffle Credit',
                        winner: ' Tofiq Mammadov (TM-12345)'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
