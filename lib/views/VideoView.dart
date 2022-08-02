import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
 
class VideoView extends StatefulWidget {
  
  final String videoID;
  final String title;

  VideoView(
    this.videoID,
    this.title
  ); 
 
  @override
  _VideoViewState createState() => _VideoViewState();
}
 
class _VideoViewState extends State<VideoView> {
  late final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: widget.videoID,
    flags: const YoutubePlayerFlags(
      autoPlay: true,
    ),
  );
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      
      body: SafeArea(
        child: Flexible(
          child: YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.red,
                progressColors: ProgressBarColors(
                  playedColor: Colors.red,
                  handleColor: Colors.red
                ),
                topActions: [
                  IconButton(onPressed: () {
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back), color: Colors.white,),

                  Expanded(child: Text(widget.title, style: TextStyle(color: Colors.white),))
                ],
              ),
              builder: (context, player) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // some widgets
                    player,
                    //some other widgets
                  ],
                );
              }),
        ),
      ),
    );
  }
}