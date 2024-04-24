import 'dart:io';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Video_Gallery extends StatefulWidget {
  File? file_;
  Video_Gallery({
    required this.file_,
  });
  @override
  State<Video_Gallery> createState() => _Video_GalleryState(file_: file_);
}

class _Video_GalleryState extends State<Video_Gallery> {
  File? file_;
  _Video_GalleryState({
    required this.file_,
  });
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.file(file_!)
      ..initialize().then((_) {
        setState(() {});
      });

  }

  @override
  Widget build(BuildContext context) {
    final chewieController = ChewieController(
      videoPlayerController: _controller!,
      autoPlay: true,
      looping: true,
    );
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.purple.shade900,title: Text("Video Gallery"),),
      body: Center(
        child: _controller!.value.isInitialized
            ? AspectRatio(
          aspectRatio: _controller!.value.aspectRatio,
          child: Chewie(
            controller: chewieController,
          ),
        )
            : Container(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }
}