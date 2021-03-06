import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';



class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen({Key key}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  bool fulScn = false;
  bool visible = false;
  double val = 0;
  @override
  void initState() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(
      'https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8',
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Use a FutureBuilder to display a loading spinner while waiting for the
        // VideoPlayerController to finish initializing.
        body: SafeArea(
      child: Column(
        children: [
          Container(
            // height: fulScn ? MediaQuery.of(context).size.height -24 : MediaQuery.of(context).size.height * 0.3,
            // width: MediaQuery.of(context).size.width ,
            child: GestureDetector(
              onDoubleTap: () {
                setState(() {
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                  } else {
                    // If the video is paused, play it.
                    _controller.play();
                  }
                });
              },
              onTap: () {
                setState(() {
                  visible = visible ? false : true;
                });
              },
              child: Stack(children: <Widget>[
                Container(
                  margin: EdgeInsets.zero,
                  child: FutureBuilder(
                    future: _initializeVideoPlayerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        print(_controller.value.aspectRatio);
                        // If the VideoPlayerController has finished initialization, use
                        // the data it provides to limit the aspect ratio of the video.
                        return AspectRatio(
                          //aspectRatio: _controller.value.aspectRatio,
                          aspectRatio: fulScn ? 18 / 9 : 16 / 9,
                          // aspectRatio: MediaQuery.of(context).size.width /
                          //     MediaQuery.of(context).size.height,
                          // Use the VideoPlayer widget to display the video.
                          child: VideoPlayer(_controller),
                        );
                      } else {
                        // If the VideoPlayerController is still initializing, show a
                        // loading spinner.
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
                Positioned(
                  width: fulScn
                      ? MediaQuery.of(context).size.width - 50
                      : MediaQuery.of(context).size.width,
                  bottom: 15.0,
                  child: Offstage(
                    offstage: visible,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(
                            _controller.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            // Wrap the play or pause in a call to `setState`. This ensures the
                            // correct icon is shown.
                            setState(() {
                              // If the video is playing, pause it.
                              if (_controller.value.isPlaying) {
                                _controller.pause();
                              } else {
                                // If the video is paused, play it.
                                _controller.play();
                              }
                            });
                          },
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.fullscreen,
                              color: Colors.orange,
                            ),
                            onPressed: () {
                              setState(() {
                                if (!fulScn == true) {
                                  SystemChrome.setEnabledSystemUIOverlays([]);
                                  SystemChrome.setPreferredOrientations(
                                      [DeviceOrientation.landscapeLeft]);
                                  fulScn = true;
                                } else {
                                  SystemChrome.setEnabledSystemUIOverlays(
                                      SystemUiOverlay.values);
                                  SystemChrome.setPreferredOrientations(
                                      [DeviceOrientation.portraitUp]);
                                  fulScn = false;
                                }
                              });
                            }),
                      ],
                    ),
                  ),
                )
              ]),
            ),
          ),
          Offstage(
            offstage: fulScn,
            child: Column(children: [
              SizedBox(
                height: 10.0,
              ),
              Container(
                  child: Text(
                'TAP1234',
                style: TextStyle(fontSize: 20.0),
              )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Container(
                child: Slider(
                    min: 0,
                    max: 360,
                    divisions: 100,
                    value: val,
                    onChanged: (value) {
                      setState(() {
                        val = value;
                      });
                    }),
              ),
              SizedBox(height: 10.0,),
              Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                  Text('Camera Position', style: TextStyle(fontSize: 20.0),),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.2),
                  Text((val.toInt()).toString(), style: TextStyle(fontSize: 20.0),)
                ],
              ),

            ]),
          )
        ],
      ),
    ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
