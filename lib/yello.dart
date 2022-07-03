import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';


class VideoApp extends StatefulWidget {
  final String url;
  final int index;
  VideoApp(this.url,this.index);
  @override
  _VideoAppState createState() => _VideoAppState(url,index);
}

class _VideoAppState extends State<VideoApp> {

  late VideoPlayerController _controller;
final  String url; final int index;
_VideoAppState(this.url,this.index);

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        url)
      ..initialize().then((_) {

        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        setState(() {
          _controller.value.isPlaying
              ? _controller.pause()
              : _controller.play();
          _controller.addListener(() {
            setState(() {});
          });

        });
            },

      child: Card(

        child: _controller.value.isInitialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : Container(height: 20,width: 40,),),
    );



  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}