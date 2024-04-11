import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  int _currentIndex = 0;

  List<Widget> _screen = [VideoScreen(), RecipeScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Favorite",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            backgroundColor: Color.fromARGB(255, 237, 86, 59),
            floating: true,
            expandedHeight: 100,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              right: 20,
              left: 20,
              top: 10,
              bottom: 5,
            ),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _currentIndex = 0;
                      });
                    },
                    child: Text('Video'),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(170, 20),
                      backgroundColor: Color.fromARGB(255, 237, 86, 59),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _currentIndex = 1;
                      });
                    },
                    child: Text('Recipe'),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(170, 20),
                      backgroundColor: Color.fromARGB(255, 237, 86, 59),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          _screen[_currentIndex],
        ],
      ),
    );
  }
}

class VideoScreen extends StatefulWidget {
  VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  List<String> _judulVideo = [
    "Relaxation Recovery Cooldown",
    "Full Body Cooldown",
    "Do This and Get Fit",
    "Slim Legs",
  ];

  List<String> _imageVideo = [
    "https://static.chloeting.com/videos/61bbf91852c5c9bf0f2550fb/fc26bde0-5ee2-11ec-b99f-c33e6b9468db.jpeg",
    "https://static.chloeting.com/videos/61bbf02a2cb3b78eb6ac2beb/a98805d0-5edd-11ec-b8cd-2976cd667d03.jpeg",
    "https://static.chloeting.com/videos/61bbfe1c2cb3b78eb6ac2c23/f989c480-5ee5-11ec-9a04-3fd984621d67.jpeg",
    "https://static.chloeting.com/videos/61bbd5ba2d47479a9df23558/e7b18440-5ecd-11ec-b8cd-2976cd667d03.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 1),
                )
              ],
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      _imageVideo[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    _judulVideo[index],
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          );
        },
        childCount: _judulVideo.length,
      ),
    );
  }
}

class RecipeScreen extends StatefulWidget {
  RecipeScreen({super.key});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  List<String> _judulRecipe = [
    "Baked Avocado Eggs",
    "Vegan Mocha Yogurt Bowl",
    "Scrambled Eggs with Shrimps",
    "One Pot Rice Cooker Fried Rice",
    "High Protein Cottage Cheese Pancakes",
    "Easy Microwave Baked Potato",
    "Vegan 'Scallop' and Cherry Tomato Pasta",
  ];

  List<String> _imageRecipe = [
    "https://static.chloeting.com/recipes/6200d5a52e702a81e5803c59/images/baked-avocado-eggs-1.webp",
    "https://static.chloeting.com/recipes/64215da10b0e98db5eafe951/images/vegan-mocha-yogurt-bowl-1679908260906-1.webp",
    "https://static.chloeting.com/recipes/62ce761fb88c73c70d95b4d9/images/scrambled-eggs-with-shrimps-1.webp",
    "https://static.chloeting.com/recipes/6458633750181861834e8f59/images/one-pot-rice-cooker-fried-rice-1683514170037-1.webp",
    "https://static.chloeting.com/recipes/641d676f6a4b8d9f710d4ab2/images/high-protein-cottage-cheese-pancakes-1679648626879-1.webp",
    "https://static.chloeting.com/recipes/63fd4196b0fc5ec5bd7649d3/images/easy-microwave-baked-potato-1677541785445-1.webp",
    "https://static.chloeting.com/recipes/6200b7f6f6b3f08bdababb83/images/vegan-scallop-and-cherry-tomato-pasta-1.webp",
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 1),
                )
              ],
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      _imageRecipe[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    _judulRecipe[index],
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          );
        },
        childCount: _judulRecipe.length,
      ),
    );
  }
}
