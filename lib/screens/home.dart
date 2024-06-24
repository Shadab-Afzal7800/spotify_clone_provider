import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone/model/music.dart';
import 'package:spotify_clone/model/music_operations.dart';
import 'package:spotify_clone/provider/category_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      decoration: const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            topRow(),
            const SizedBox(
              height: 20,
            ),
            categoryGrid(),
            const Text("Made For You"),
            createMusicList()
          ],
        ),
      ),
    ));
  }

  Widget topRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Good Morning",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings_outlined,
              color: Colors.white,
            ))
      ],
    );
  }

  Widget categoryGrid() {
    final cp = Provider.of<CategoryProvider>(context);
    return Expanded(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              childAspectRatio: 5 / 2,
              mainAxisSpacing: 10),
          itemCount: cp.categories.length,
          itemBuilder: (context, index) {
            final songCategory = cp.categories[index];
            return Container(
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[850]),
              child: Row(
                children: [
                  Image.network(
                    songCategory['image'],
                    fit: BoxFit.cover,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        songCategory['name'],
                        style: const TextStyle(color: Colors.white),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }

  Widget createMusic(Music music) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 200,
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Image.network(
                music.image,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              music.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              music.desc,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }

  Widget createMusicList() {
    List<Music> musicList = MusicOperations.getMusic();
    return Expanded(
      child: SizedBox(
        height: 200,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: musicList.length,
            itemBuilder: (context, index) {
              return createMusic(musicList[index]);
            }),
      ),
    );
  }
}
