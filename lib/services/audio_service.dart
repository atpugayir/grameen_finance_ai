import 'package:audioplayers/audioplayers.dart';

class AudioService {
  static final AudioPlayer _player = AudioPlayer();

  /// 🔊 Play audio from backend URL
  static Future<void> playFromUrl(String url) async {
    await _player.stop();
    await _player.play(UrlSource(url));
  }

  /// 🎵 Play offline audio from assets
  static Future<void> playFromAsset(String assetPath) async {
    await _player.stop();
    await _player.play(AssetSource(assetPath));
  }
}
