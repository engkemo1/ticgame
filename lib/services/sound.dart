// import 'package:audioplayers/audioplayers.dart';
//
// class SoundService {
//  bool? _enableSound$;
//
//   AudioPlayer? _fixedPlayer;
//   AudioCache? _player;
//
//   SoundService() {
//     _enableSound$ =true;
//     _fixedPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
//     _player = AudioCache(fixedPlayer: _fixedPlayer);
//     _player!.loadAll(['x.mp3', 'o.mp3', "click.mp3"]);
//   }
//
//   playSound(String sound) {
//     bool isSoundEnabled = _enableSound$!;
//     if (isSoundEnabled) {
//       _player!.play("$sound.mp3");
//     }
//   }
// }
//
//
