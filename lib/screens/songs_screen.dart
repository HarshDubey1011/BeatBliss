import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:beatbliss/model/song_model.dart';
import 'package:beatbliss/controllers/song_controller.dart';
import 'song_details_screen.dart'; // Import the SongDetailsScreen

class SongsScreen extends StatelessWidget {
  SongsScreen({Key? key}) : super(key: key);
  final SongsController songsController = Get.put(SongsController());
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Library',
          style: TextStyle(color: Colors.white), // Text color on the app bar
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        // Use the primary color from the color scheme for the app bar background
      ),
      body: Obx(
        () {
          if (songsController.isLoading.value &&
              songsController.songs.isEmpty) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).colorScheme.primary,
                ),
                // Use the primary color from the color scheme for the loading indicator
              ),
            );
          } else if (songsController.songs.isEmpty) {
            return Center(
              child: Text(
                'No songs available.',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  // Use the color for text on the background from the color scheme
                ),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: songsController.songs.length + 1,
              itemBuilder: (context, index) {
                if (index == songsController.songs.length) {
                  if (songsController.isLoading.value) {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                } else {
                  final song = songsController.songs[index];
                  return InkWell(
                    onTap: () {
                      Get.to(() => SongDetailsScreen(song: song));
                    },
                    child: ListTile(
                      title: Text(
                        song.title,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          // Use the color for text on the surface from the color scheme
                        ),
                      ),
                      subtitle: Text(
                        song.artist,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          song.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: song.isFavorite
                              ? Theme.of(context).colorScheme.primary
                              : null,
                          // Use the secondary variant color for the favorite icon when it's selected
                        ),
                        onPressed: () {
                          songsController.toggleFavorite(song);
                        },
                      ),
                    ),
                  );
                }
              },
              controller: _scrollController
                ..addListener(() {
                  if (_scrollController.position.pixels ==
                      _scrollController.position.maxScrollExtent) {
                    if (!songsController.isLoading.value) {
                      songsController.fetchSongs();
                    }
                  }
                }),
            );
          }
        },
      ),
    );
  }
}
