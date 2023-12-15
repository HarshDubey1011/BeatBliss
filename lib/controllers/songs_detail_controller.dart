// song_details_controller.dart

import 'package:get/get.dart';

class SongDetailsController extends GetxController {
  var isPlaying = false.obs;

  void playPause() {
    isPlaying.toggle();
    // Implement play/pause logic here
  }

  void skip() {
    // Implement skip logic here
    print('Skipping to the next song');
  }
}
