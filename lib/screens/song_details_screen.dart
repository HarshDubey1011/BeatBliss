import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:beatbliss/controllers/songs_detail_controller.dart';
import 'package:beatbliss/controllers/song_controller.dart';
import 'package:beatbliss/model/song_model.dart';

class SongDetailsScreen extends StatelessWidget {
  final SongsController songsController = Get.put(SongsController());
  SongDetailsScreen({super.key, required this.song});

  final Song song;
  final SongDetailsController songDetailsController =
      Get.put(SongDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Now Playing'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Album Art Placeholder (Replace with actual image)
            Container(
              width: 200,
              height: 200,
              color: Colors.grey,
              child: const Center(
                child: Icon(
                  Icons.music_note,
                  size: 100,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Song Title
            Text(
              song.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Artist Name
            Text(song.artist, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 30),
            IconButton(
              icon: Icon(
                song.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: song.isFavorite ? Colors.red : null,
              ),
              onPressed: () {
                songsController.toggleFavorite(song);
              },
            ),
            // Playback Controls
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.skip_previous),
                  onPressed: songDetailsController.skip,
                ),
                IconButton(
                  icon: Obx(
                    () => Icon(
                      songDetailsController.isPlaying.value
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                  ),
                  onPressed: songDetailsController.playPause,
                ),
                IconButton(
                  icon: const Icon(Icons.skip_next),
                  onPressed: songDetailsController.skip,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
