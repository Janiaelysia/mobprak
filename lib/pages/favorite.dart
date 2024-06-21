import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:activewell_new/services/favoriteVideo_service.dart';
import 'package:activewell_new/services/favoriteRecipe_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

const Map<String, String> recipeRoutes = {
  'Vegan Curried Egg Sandwich': '/detail_meal1',
  'Lemon Garlic Chicken Zoodles': '/detail_meal2',
  'Tuna Potato Egg Salad': '/detail_meal3',
  'Low-Sugar Honey Soy Chicken': '/detail_meal4',
  'Sugar-Free Lemonade': '/detail_beverage1',
  '3-Ingredient Strawberry Boba': '/detail_beverage2',
  'Shamrock Smoothie': '/detail_beverage3',
  'Pink Dragon Fruit Smoothie': '/detail_beverage4',
  'Pizza Zucchini Bites': '/detail_snack1',
  'Black Olive Tapenade': '/detail_snack2',
  'High Protein Creamy Garlic Chive Dip': '/detail_snack3',
  'Strawberry Protein Bliss Balls': '/detail_snack4',
};

class FavoritePage extends ConsumerStatefulWidget {
  const FavoritePage({super.key});

  @override
  ConsumerState<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends ConsumerState<FavoritePage>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    fetchData();
  }

  Future<void> fetchData() async {
    await ref.read(videoProvider.notifier).getFavoriteVideos();
    await ref.read(recipeProvider.notifier).getFavoriteRecipes();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteVideos = ref.watch(videoProvider);
    final favoriteRecipes = ref.watch(recipeProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: const Text(
              'Favorite',
              style: TextStyle(color: Colors.white),
            ),
            pinned: true,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Color.fromARGB(
                    255, 237, 86, 59), // Set your desired background color here
              ),
            ),
            bottom: TabBar(
              labelColor: Color.fromARGB(255, 255, 255, 255),
              indicatorColor: Color.fromARGB(255, 205, 141, 130),
              unselectedLabelColor: Color.fromARGB(255, 252, 157, 141),
              controller: _tabController,
              tabs: const <Widget>[
                Tab(
                  child: Text('Videos'), // Ganti ikon menjadi teks "meal"
                ),
                Tab(
                  child: Text('Recipes'),
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                ListView.builder(
                  itemCount: favoriteVideos.length,
                  itemBuilder: (context, index) {
                    final video = favoriteVideos[index];
                    return GestureDetector(
                      onTap: () async {
                        print("lanch youtube video ...");
                        final url = Uri.parse(video.videoUrl);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.125,
                        width: MediaQuery.of(context).size.width * 0.8,
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
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                              flex: 2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: AspectRatio(
                                  aspectRatio: 16 / 9,
                                  child: Image.network(
                                    video.thumbnailUrl,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    child: Text(
                                      video.title,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    width: 80,
                                  ),
                                  Expanded(
                                    child: IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () async {
                                        final favoriteVideoProviderNotifier =
                                            ref.read(videoProvider.notifier);
                                        await favoriteVideoProviderNotifier
                                            .deleteFavoriteVideos(
                                                context, video.title);
                                        // Handle save button onPressed event
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                ListView.builder(
                  itemCount: favoriteRecipes.length,
                  itemBuilder: (context, index) {
                    final recipe = favoriteRecipes[index];
                    return GestureDetector(
                      onTap: () {
                        final routeName = recipeRoutes[recipe.title] ?? '/';
                        Navigator.of(context).pushNamed(routeName);
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.125,
                        width: MediaQuery.of(context).size.width * 0.8,
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
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                              flex: 2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: AspectRatio(
                                  aspectRatio: 16 / 9,
                                  child: Image.network(
                                    recipe.imgUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    child: Text(
                                      recipe.title,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    width: 80,
                                  ),
                                  Expanded(
                                    child: IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () async {
                                        final favoriteRecipeProviderNotifier =
                                            ref.read(recipeProvider.notifier);
                                        await favoriteRecipeProviderNotifier
                                            .deleteFavoriteRecipes(
                                                context, recipe.title);
                                        // Handle save button onPressed event
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.watch(videoProvider.notifier).getFavoriteVideos();
          ref.watch(recipeProvider.notifier).getFavoriteRecipes();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
