import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:hitbeat_flutter/business_logic/player/track.dart';
import 'package:localstorage/localstorage.dart';

class Player {
  final List<Track> _tracks = [];
  int _currentTrackIndex = 0;

  AudioPlayer? _audioPlayer;

  Player() {
    _init();
  }

  void _init() async {
    _tracks.add(mockTrack);
    _tracks.add(mockTrack2);
    _tracks.add(mockTrack);
    final storage = LocalStorage('my_data.json');
    await storage.ready;
    initializeAudioPlayer();
    final playerId = _audioPlayer?.playerId;
    storage.setItem('playerId', playerId);

    // await _audioPlayer?.setSourceUrl(mockTrack.path);
    await _audioPlayer?.setSourceAsset(mockTrack.path);
    debugPrint('Player initialized');
  }

  void initializeAudioPlayer() {
    _audioPlayer?.onPlayerComplete.listen((event) {
      skip();
    });
  }

  void addTrack(Track track) async {
    _tracks.add(track);

    if (_tracks.length == 1) {
      if (_audioPlayer?.state == PlayerState.stopped) {
        await _audioPlayer?.setSourceAsset(mockTrack.path);
      }
    }
  }

  Future<void> skip() async {
    if (_currentTrackIndex + 1 < _tracks.length) {
      _currentTrackIndex++;
      await _audioPlayer?.stop();
      await _audioPlayer?.setSourceAsset(mockTrack.path);
      await _audioPlayer?.resume();
    }
  }

  Future<void> seek(Duration position) async {
    await _audioPlayer?.seek(position);
  }

  Track get currentTrack => _tracks[_currentTrackIndex];

  List<Track> get tracks => _tracks;

  Future<void> resume() async {
    await _audioPlayer?.resume();
  }

  Future<void> pause() async {
    await _audioPlayer?.pause();
  }

  PlayerState get state => _audioPlayer?.state ?? PlayerState.disposed;

  Stream<Track?> get currentTrackStream async* {
    yield currentTrack;

    Track innerCurrentTrack = currentTrack;

    while (true) {
      await Future.delayed(const Duration(milliseconds: 100));
      if (innerCurrentTrack != currentTrack) {
        innerCurrentTrack = currentTrack;
        yield currentTrack;
      }
    }
  }

  Stream<Duration?> get positionStream async* {
    StreamController<Duration?> controller = StreamController.broadcast();

    _audioPlayer?.onPositionChanged.listen((event) {
      controller.add(event);
    });

    yield* controller.stream;
  }

  Stream<PlayerState?> get playingStateStream async* {
    StreamController<PlayerState?> controller = StreamController.broadcast();

    _audioPlayer?.onPlayerStateChanged.listen((event) {
      controller.sink.add(event);
    });

    yield* controller.stream;
  }

  Stream<Duration?> get durationStream async* {
    StreamController<Duration?> controller = StreamController.broadcast();

    _audioPlayer?.onDurationChanged.listen((event) {
      controller.sink.add(event);
    });

    yield* controller.stream;
  }

  void dispose() {
    _audioPlayer?.dispose();
    debugPrint('Player disposed');
  }
}
