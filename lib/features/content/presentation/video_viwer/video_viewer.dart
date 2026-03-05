import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoViwer extends StatefulWidget {
  final String videoUrl;
  const VideoViwer({super.key, required this.videoUrl});

  @override
  State<VideoViwer> createState() => _VideoViwerState();
}

class _VideoViwerState extends State<VideoViwer> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initVideo();
  }

  Future<void> _initVideo() async {
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    await _controller.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      aspectRatio: 16 / 9,
      autoPlay: true,
      looping: true,
      showControls: true,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.green,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.lightBlueAccent,
      ),
    );
    setState(() => _isInitialized = true);
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _chewieController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Content Video')),
      body: Center(
        child: _isInitialized
            ? AspectRatio(
                aspectRatio: 16 / 9,
                child: Chewie(controller: _chewieController),
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
