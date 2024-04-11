import 'package:flutter/material.dart';

class RecipesPage extends StatefulWidget {
  RecipesPage({Key? key}) : super(key: key);

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  int _currentIndex = 0;

  List<Widget> _screen = [MealScreen(), BeverageScreen(), SnackScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 35),
                    child: Text(
                      "Recipes",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
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
              right: 18,
              left: 18,
              top: 10,
              bottom: 5,
            ),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _currentIndex = 0;
                        });
                      },
                      child: Text('Meal'),
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                            Size(150, 35)), // lebar minimum tombol
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 237, 86, 59)),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _currentIndex = 1;
                        });
                      },
                      child: Text('Beverage'),
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                            Size(150, 35)), // Menentukan lebar minimum tombol
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 237, 86, 59)),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _currentIndex = 2;
                        });
                      },
                      child: Text('Snack'),
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                            Size(150, 35)), // Menentukan lebar minimum tombol
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 237, 86, 59)),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
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

class MealScreen extends StatefulWidget {
  MealScreen({super.key});

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
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

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 0.5,
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
                    aspectRatio: 3 / 4,
                    child: Image.network(
                      _imageMeal[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    _judulMeal[index],
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          );
        },
        childCount: _judulMeal.length,
      ),
    );
  }
}

class BeverageScreen extends StatefulWidget {
  BeverageScreen({super.key});

  @override
  State<BeverageScreen> createState() => _BeverageScreenState();
}

class _BeverageScreenState extends State<BeverageScreen> {
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

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 0.5,
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
                    aspectRatio: 3 / 4,
                    child: Image.network(
                      _imageBeverage[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    _judulBeverage[index],
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          );
        },
        childCount: _judulBeverage.length,
      ),
    );
  }
}

class SnackScreen extends StatefulWidget {
  SnackScreen({super.key});

  @override
  State<SnackScreen> createState() => _SnackScreenState();
}

class _SnackScreenState extends State<SnackScreen> {
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
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 0.5,
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
                    aspectRatio: 3 / 4,
                    child: Image.network(
                      _imageSnack[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    _judulSnack[index],
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          );
        },
        childCount: _judulSnack.length,
      ),
    );
  }
}
