class Track {
  final String path;
  final String title;

  Track({
    required this.path,
    required this.title,
  });
}

final mockTrack = Track(
  path: 'asset://assets/tracks/track.mp3',
  title: 'Mock Track',
);

final mockTrack2 = Track(
  path: 'asset://assets/tracks/track2.mp3',
  title: 'Mock Track 2',
);
