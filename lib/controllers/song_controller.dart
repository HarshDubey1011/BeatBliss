// songs_controller.dart

import 'package:get/get.dart';
import 'package:beatbliss/model/song_model.dart';
import 'package:beatbliss/data/data.dart';
// import 'package:your_api_package/your_api_package.dart'; // Replace with your API package

class SongsController extends GetxController {
  // Add Key? type to the key parameter
  var songs = <Song>[].obs;
  var isLoading = false.obs;
  var page = 1.obs;

  @override
  void onInit() {
    super.onInit();
    // Fetch initial songs
    fetchSongs();
  }

  Future<void> fetchSongs() async {
    try {
      isLoading(true);

      // Replace the following line with your API call logic
      //final songsData = await YourApiProvider.fetchSongs(page.value);

      // Map API response to Song model

      final List<Song> newSongs = fakeMusicList.map((data) {
        print(
            "id: ${data['id']}, title: ${data['title']}, artist: ${data['artist']}");
        return Song(
          id: data['id'],
          title: data['title'],
          artist: data['artist'],
        );
      }).toList();

      songs.addAll(newSongs);
      page.value++;
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Failed to fetch songs.');
    } finally {
      isLoading(false);
    }
  }

  void toggleFavorite(Song song) {
    song.isFavorite = !song.isFavorite;
    update();
  }
}
