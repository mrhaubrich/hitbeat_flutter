import 'package:equatable/equatable.dart';

class PlayPauseButtonState extends Equatable {
  final bool isPlaying;

  const PlayPauseButtonState(this.isPlaying);

  PlayPauseButtonState toggle() {
    return PlayPauseButtonState(!isPlaying);
  }

  @override
  List<Object?> get props => [
        isPlaying,
      ];
}
