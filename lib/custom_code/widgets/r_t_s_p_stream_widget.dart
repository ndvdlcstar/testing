// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class RTSPStreamWidget extends StatefulWidget {
  final String url; // URL des RTSP Streams
  final double? width; // Optionale Breite des Video-Players
  final double? height; // Optionale Höhe des Video-Players

  const RTSPStreamWidget({
    Key? key,
    required this.url,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  _RTSPStreamWidgetState createState() => _RTSPStreamWidgetState();
}

class _RTSPStreamWidgetState extends State<RTSPStreamWidget> {
  late VlcPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VlcPlayerController.network(
      widget.url,
      autoInitialize: true,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return VlcPlayer(
      controller: _controller,
      aspectRatio: 16 / 9, // Standard-Aspect-Ratio für Videos
      placeholder: const Center(child: CircularProgressIndicator()),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
