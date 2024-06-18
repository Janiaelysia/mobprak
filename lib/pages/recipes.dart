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
    "Miso Salmon Nourish Bowl",
    "Healthy Bulgogi Rice Bowl",
    "Vegan Chicken Nuggets",
    "Chipolata Veggie Bake",
    "One Pot Chicken Veggie Soup",
    "Vegan Cream of Mushroom Soup",
  ];

  List<String> _imageMeal = [
    "https://static.chloeting.com/recipes/6200b37d382ba4ec17393dbd/images/miso-salmon-nourish-bowl-1.webp",
    "https://static.chloeting.com/recipes/61fe31172a18c23f7d7f8f9e/images/healthy-bulgogi-rice-bowl-1.webp",
    "https://static.chloeting.com/recipes/61ffb4e12a18c23f7d7f99cf/images/vegan-chicken-nuggets-1.jpeg",
    "https://static.chloeting.com/recipes/61ff9985e75e851db89828e5/images/chipolata-veggie-bake-1.jpeg",
    "https://static.chloeting.com/recipes/61ff7d1e2a18c23f7d7f9554/images/one-pot-chicken-veggie-soup-1.jpeg",
    "https://static.chloeting.com/recipes/6299ad825db2ecae8ed41774/images/vegan-cream-of-mushroom-soup-1.jpeg",
  ];

  List<String> _judulBeverage = [
    "Sugar-Free Lemonade",
    "Milk Tea With Coffee Jelly",
    "Banana-Free Chocolate Protein Smoothie",
    "Best Vegan Matcha Latte",
    "Matcha Latte With Mini Taro Balls",
    "Pumpkin Spice Latte",
    "3-Ingredient Strawberry Boba",
  ];

  List<String> _imageBeverage = [
    "https://static.chloeting.com/recipes/6379e20bcab051845d4f5649/images/sugar-free-lemonade-1668932111579-1.jpeg",
    "https://static.chloeting.com/recipes/62bc002599cef88f385586f8/images/milk-tea-with-coffee-jelly-1.jpeg",
    "https://static.chloeting.com/recipes/61fe471de75e851db8982189/images/banana-free-chocolate-protein-smoothie-1.jpeg",
    "https://static.chloeting.com/recipes/61fe48d5e75e851db89821d0/images/best-vegan-matcha-latte-1.jpeg",
    "https://static.chloeting.com/recipes/62c24b49ea2d41402929f11c/images/matcha-latte-with-mini-taro-balls-1.jpeg",
    "https://static.chloeting.com/recipes/6200ee602e702a81e5804ea8/images/pumpkin-spice-latte-1.jpeg",
    "https://static.chloeting.com/recipes/62c3a3736f991137b34ceb32/images/3-ingredient-strawberry-boba-1.jpeg",
  ];

  List<String> _judulSnack = [
    "Baked Avocado Eggs",
    "Vegan Mocha Yogurt Bowl",
    "Scrambled Eggs with Shrimps",
    "One Pot Rice Cooker Fried Rice",
    "High Protein Cottage Cheese Pancakes",
    "Easy Microwave Baked Potato",
    "Vegan 'Scallop' and Cherry Tomato Pasta",
  ];

  List<String> _imageSnack = [
    "https://static.chloeting.com/recipes/6200d5a52e702a81e5803c59/images/baked-avocado-eggs-1.webp",
    "https://static.chloeting.com/recipes/64215da10b0e98db5eafe951/images/vegan-mocha-yogurt-bowl-1679908260906-1.webp",
    "https://static.chloeting.com/recipes/62ce761fb88c73c70d95b4d9/images/scrambled-eggs-with-shrimps-1.webp",
    "https://static.chloeting.com/recipes/6458633750181861834e8f59/images/one-pot-rice-cooker-fried-rice-1683514170037-1.webp",
    "https://static.chloeting.com/recipes/641d676f6a4b8d9f710d4ab2/images/high-protein-cottage-cheese-pancakes-1679648626879-1.webp",
    "https://static.chloeting.com/recipes/63fd4196b0fc5ec5bd7649d3/images/easy-microwave-baked-potato-1677541785445-1.webp",
    "https://static.chloeting.com/recipes/6200b7f6f6b3f08bdababb83/images/vegan-scallop-and-cherry-tomato-pasta-1.webp",
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
                    return Container(
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
                    );
                  },
                ),
                ListView.builder(
                  itemCount: _judulBeverage.length,
                  itemBuilder: (context, index) {
                    return Container(
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
                    );
                  },
                ),
                ListView.builder(
                  itemCount: _judulSnack.length,
                  itemBuilder: (context, index) {
                    return Container(
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
