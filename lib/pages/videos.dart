import 'package:flutter/material.dart';

class VideosPage extends StatefulWidget {
  VideosPage({Key? key}) : super(key: key);

  @override
  State<VideosPage> createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  int _currentIndex = 0;

  List<Widget> _screen = [TenMinScreen(), TwentyMinScreen(), StandingScreen()];

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
                      "Videos",
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
                      child: Text('10 Mins'),
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
                      child: Text('20 Mins+'),
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
                      child: Text('Standing'),
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

class TenMinScreen extends StatefulWidget {
  TenMinScreen({super.key});

  @override
  State<TenMinScreen> createState() => _TenMinScreenState();
}

class _TenMinScreenState extends State<TenMinScreen> {
  List<String> _judulTenMin = [
    "10 Min Intense Abs",
    "10 Min Daily Abs",
    "Toned Arms",
    "Standing Abs",
    "10 Min HIIT",
    "Core & Arms",
  ];

  List<String> _imageTenMin = [
    "https://static.chloeting.com/videos/663517d500c230367fe429e6/ed1cabb0-0c79-11ef-854a-c15ecb281560.jpeg", //1
    "https://static.chloeting.com/videos/6584905afaede632c94fe126/23b147a0-a92c-11ee-9277-3b937f16846b.jpeg", //2
    "https://static.chloeting.com/videos/65849175be23b57ce10a677b/6abe4220-aea3-11ee-8b18-8b55a7ba3b1c.jpeg", //3
    "https://static.chloeting.com/videos/65d02d0887b4dd6dfaacfd5a/9b987f00-cfa5-11ee-9701-cfed4f69f9be.jpeg", //4
    "https://static.chloeting.com/videos/63ae0fd749cf64962cb573f5/18930070-959b-11ed-9436-59d29cd71f8d.jpeg",
    "https://static.chloeting.com/videos/62c4a9cfb88c73c70d9d55d4/84970330-fca7-11ec-a798-935d9eee8a63.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.125,
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
                Flexible(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.network(
                        _imageTenMin[index],
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  flex: 2,
                  child: Text(
                    _judulTenMin[index],
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          );
        },
        childCount: _judulTenMin.length,
      ),
    );
  }
}

class TwentyMinScreen extends StatefulWidget {
  TwentyMinScreen({super.key});

  @override
  State<TwentyMinScreen> createState() => _TwentyMinScreenState();
}

class _TwentyMinScreenState extends State<TwentyMinScreen> {
  List<String> _judulTwentyMin = [
    "Full Body Flat Tummy",
    "Do This and Get Fit",
    "Complete Full Body Workout",
    "Weight Loss Full Body HIIT",
    "Full Body No Jumping",
    "Cardio Abs",
    "1.000 Reps Workout",
  ];

  List<String> _imageTwentyMin = [
    "https://static.chloeting.com/videos/61bbef772d47479a9df2358d/3ef80df0-5edd-11ec-b182-df31ae6aab45.jpeg",
    "https://static.chloeting.com/videos/61bbfe1c2cb3b78eb6ac2c23/f989c480-5ee5-11ec-9a04-3fd984621d67.jpeg",
    "https://static.chloeting.com/videos/61bbb9f2017bbb985e15f8b6/58abd990-5ebd-11ec-b182-df31ae6aab45.jpeg",
    "https://static.chloeting.com/videos/61bc29dc37778b5b830c6803/0d48b430-5f00-11ec-9fce-4781ba46fa9b.jpeg",
    "https://static.chloeting.com/videos/61ce510934185a9a5617671e/fc539460-69d1-11ec-88d2-07e5364d275e.jpeg",
    "https://static.chloeting.com/videos/61bbd46652c5c9bf0f25508e/1cc34a70-5ecd-11ec-9a04-3fd984621d67.jpeg",
    "https://static.chloeting.com/videos/61bbf3532cb3b78eb6ac2bf7/8c4e6a70-5edf-11ec-b8cd-2976cd667d03.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.125,
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
                Flexible(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.network(
                        _imageTwentyMin[index],
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  flex: 2,
                  child: Text(
                    _judulTwentyMin[index],
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          );
        },
        childCount: _judulTwentyMin.length,
      ),
    );
  }
}

class StandingScreen extends StatefulWidget {
  StandingScreen({super.key});

  @override
  State<StandingScreen> createState() => _StandingScreenState();
}

class _StandingScreenState extends State<StandingScreen> {
  List<String> _judulStanding = [
    "Lean Arms Workout",
    "Standing Abs",
    "Fat Burn",
    "Calorie Burning HIIT",
    "Standing Abs",
    "Full Body Workout - No Planks",
    "Weight Loss HIIT",
  ];

  List<String> _imageStanding = [
    "https://static.chloeting.com/videos/61bbdeaac3d293024898b867/3b4068b0-5ed3-11ec-b99f-c33e6b9468db.jpeg",
    "https://static.chloeting.com/videos/61bbf2732cb3b78eb6ac2bf4/0666a170-5edf-11ec-b8cd-2976cd667d03.jpeg",
    "https://static.chloeting.com/videos/61bbf2bd2d47479a9df235a2/327be0e0-5edf-11ec-883e-77d525cedf9b.jpeg",
    "https://static.chloeting.com/videos/61bc1df44df7b918c30e8bb3/f49be300-5ef8-11ec-b4e8-6545cdfc138f.jpeg",
    "https://static.chloeting.com/videos/6344d251ed61d9ae54297892/a408c1e0-4ec3-11ed-a3ce-b308361a3e05.jpeg",
    "https://static.chloeting.com/videos/6289a4cfaff22d3c952a8b2d/da43cf30-d979-11ec-8387-814d61d6974c.jpeg",
    "https://static.chloeting.com/videos/61ce4f20173d57799999a755/d8793960-69d0-11ec-88d2-07e5364d275e.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.125,
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
                Flexible(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.network(
                        _imageStanding[index],
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  flex: 2,
                  child: Text(
                    _judulStanding[index],
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          );
        },
        childCount: _judulStanding.length,
      ),
    );
  }
}
