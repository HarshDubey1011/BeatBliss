// favorites_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:beatbliss/controllers/song_controller.dart';
import 'package:beatbliss/model/song_model.dart';
import 'package:beatbliss/screens/song_details_screen.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({super.key});
  final SongsController songsController = Get.put(SongsController());

  @override
  Widget build(BuildContext context) {
    final List<Song> favoriteSongs =
        songsController.songs.where((song) => song.isFavorite).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Songs'),
      ),
      body: favoriteSongs.isEmpty
          ? const Center(
              child: Text('No favorite songs.'),
            )
          : ListView.builder(
              itemCount: favoriteSongs.length,
              itemBuilder: (context, index) {
                final song = favoriteSongs[index];
                return InkWell(
                  onTap: () {
                    // Navigate to SongDetailsScreen when a song is clicked
                    Get.to(() => SongDetailsScreen(song: song));
                  },
                  child: ListTile(
                    title: Text(song.title),
                    subtitle: Text(song.artist),
                    trailing: IconButton(
                      icon: Icon(
                          song.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: song.isFavorite ? Colors.red : null),
                      onPressed: () {
                        songsController.toggleFavorite(song);
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
