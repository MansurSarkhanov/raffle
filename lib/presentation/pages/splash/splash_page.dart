import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/core/constants/path/videos_path.dart';
import 'package:raffle_app/core/constants/routes.dart';
import 'package:raffle_app/core/utilities/extension/videos_path_ext.dart';
import 'package:raffle_app/features/auth/presentation/notifier/auth_notifier.dart';
import 'package:video_player/video_player.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
 late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initVideo();
  }

  Future<void> _initVideo() async {
    _controller = VideoPlayerController.asset(
      VideosPath.raffle_splash_video.toPath,
    );

    await _controller.initialize();
    _controller
      ..setLooping(false)
      ..play();

    setState(() {
      _isInitialized = true;
    });

    Future.delayed(const Duration(seconds: 4), () async {
      if (!mounted) return;

      if (await context.read<AuthNotifier>().checkAuth()) {
        context.replaceNamed(AppRoutes.home.name);
      } else {
        context.replaceNamed(AppRoutes.auth.name);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: VideoPlayer(_controller),
      ),
    );
  }
}
