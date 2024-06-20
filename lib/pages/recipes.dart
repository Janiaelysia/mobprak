import 'package:flutter/material.dart';
import 'package:activewell_new/services/favoriteRecipe_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecipesPage extends ConsumerStatefulWidget {
  const RecipesPage({super.key});

  @override
  ConsumerState<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends ConsumerState<RecipesPage>
    with TickerProviderStateMixin {
  // final favoriteRecipeProvider =
  //     StateNotifierProvider<FavoriteRecipeProvider, List<RecipeModel>>((ref) {
  //   // final firestore = FirebaseFirestore.instance;
  //   // final user = FirebaseAuth.instance.currentUser;
  //   return FavoriteRecipeProvider();
  // });

  late final TabController _tabController;

  List<String> _judulMeal = [
    "Vegan Curried Egg Sandwich",
    "Lemon Garlic Chicken Zoodles",
    "Tuna Potato Egg Salad",
    "Low-Sugar Honey Soy Chicken",
  ];

  List<String> _imageMeal = [
    "https://static.chloeting.com/recipes/61fcbd362a18c23f7d7f8af3/images/vegan-curried-egg-sandwich-1.webp",
    "https://static.chloeting.com/recipes/62ce6c1387e357875647b592/images/lemon-garlic-chicken-zoodles-1.jpeg",
    "https://activewell.arduino22.cloud/storage/recipe_image/9wenOQlVL04QTizTIUm7ZSAOn8DeOOf0pBxvbysC.jpg",
    "https://static.chloeting.com/recipes/6200b658f6b3f08bdababb66/images/low-sugar-honey-soy-chicken-1.jpeg",
  ];

  List<String> _judulBeverage = [
    "Sugar-Free Lemonade",
    "3-Ingredient Strawberry Boba",
    "Shamrock Smoothie",
    "Pink Dragon Fruit Smoothie",
  ];

  List<String> _imageBeverage = [
    "https://static.chloeting.com/recipes/6379e20bcab051845d4f5649/images/sugar-free-lemonade-1668932113353-2.webp",
    "https://static.chloeting.com/recipes/62c3a3736f991137b34ceb32/images/3-ingredient-strawberry-boba-1.jpeg",
    "https://static.chloeting.com/recipes/61fe25cc2a18c23f7d7f8e98/images/shamrock-smoothie-1.jpeg",
    "https://static.chloeting.com/recipes/61fe1618e75e851db8981d41/images/pink-dragon-fruit-smoothie-1.jpeg",
  ];

  List<String> _judulSnack = [
    "Pizza Zucchini Bites",
    "Black Olive Tapenade",
    "High Protein Creamy Garlic Chive Dip",
    "Strawberry Protein Bliss Balls",
  ];

  List<String> _imageSnack = [
    "https://static.chloeting.com/recipes/6386ca35e55b159b3e7520fb/images/pizza-zucchini-bites-1669777979081-1.jpeg",
    "https://static.chloeting.com/recipes/6257bb86e9e3489bf46b2f2d/images/black-olive-tapenade-1.jpeg",
    "https://static.chloeting.com/recipes/62afdb9937870d6166688dfe/images/high-protein-creamy-garlic-chive-dip-1.webp",
    "https://static.chloeting.com/recipes/61fe428ce75e851db89820f3/images/strawberry-protein-bliss-balls-1.webp",
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: const Text(
              'Recipes',
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
                  child: Text('Meal'), // Ganti ikon menjadi teks "meal"
                ),
                Tab(
                  child: Text('Beverage'),
                ),
                Tab(
                  child: Text('Snack'),
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                ListView.builder(
                  itemCount: _judulMeal.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        String routeName;
                        switch (index) {
                          case 0:
                            routeName = '/detail_meal1';
                            break;
                          case 1:
                            routeName = '/detail_meal2';
                            break;
                          case 2:
                            routeName = '/detail_meal3';
                            break;
                          case 3:
                            routeName = '/detail_meal4';
                            break;
                          default:
                            routeName = '/';
                        }
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
                                    _imageMeal[index],
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
                                      _judulMeal[index],
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    width: 80,
                                  ),
                                  Expanded(
                                    child: IconButton(
                                      icon: Icon(Icons.bookmark),
                                      onPressed: () async {
                                        final favoriteRecipeProviderNotifier =
                                            ref.read(recipeProvider.notifier);
                                        await favoriteRecipeProviderNotifier
                                            .addFavoriteRecipes(
                                          context,
                                          _judulMeal[index],
                                          _imageMeal[index],
                                        );
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
                  itemCount: _judulBeverage.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        String routeName;
                        switch (index) {
                          case 0:
                            routeName = '/detail_beverage1';
                            break;
                          case 1:
                            routeName = '/detail_beverage2';
                            break;
                          case 2:
                            routeName = '/detail_beverage3';
                            break;
                          case 3:
                            routeName = '/detail_beverage4';
                            break;
                          default:
                            routeName = '/';
                        }
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
                                    _imageBeverage[index],
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
                                      _judulBeverage[index],
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    width: 80,
                                  ),
                                  Expanded(
                                    child: IconButton(
                                      icon: Icon(Icons.bookmark),
                                      onPressed: () async {
                                        final favoriteRecipeProviderNotifier =
                                            ref.read(recipeProvider.notifier);
                                        await favoriteRecipeProviderNotifier
                                            .addFavoriteRecipes(
                                          context,
                                          _judulBeverage[index],
                                          _imageBeverage[index],
                                        );
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
                  itemCount: _judulSnack.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        String routeName;
                        switch (index) {
                          case 0:
                            routeName = '/detail_snack1';
                            break;
                          case 1:
                            routeName = '/detail_snack2';
                            break;
                          case 2:
                            routeName = '/detail_snack3';
                            break;
                          case 3:
                            routeName = '/detail_snack4';
                            break;
                          default:
                            routeName = '/';
                        }
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
                                    _imageSnack[index],
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
                                      _judulSnack[index],
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    width: 80,
                                  ),
                                  Expanded(
                                    child: IconButton(
                                      icon: Icon(Icons.bookmark),
                                      onPressed: () async {
                                        final favoriteRecipeProviderNotifier =
                                            ref.read(recipeProvider.notifier);
                                        await favoriteRecipeProviderNotifier
                                            .addFavoriteRecipes(
                                          context,
                                          _judulSnack[index],
                                          _imageSnack[index],
                                        );
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
    );
  }
}
