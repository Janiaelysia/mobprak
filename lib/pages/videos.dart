import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart'; // Import youtube_player_flutter package

class VideosPage extends ConsumerStatefulWidget {
  const VideosPage({super.key});

  @override
  ConsumerState<VideosPage> createState() => _VideosPageState();
}

class _VideosPageState extends ConsumerState<VideosPage>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  late YoutubePlayerController _youtubeController;

  final List<String> _judulTenMin = [
    "10 Min Intense Abs",
    "10 Min Daily Abs",
    "Toned Arms",
    "Standing Abs",
    "10 Min HIIT",
    "Core & Arms",
  ];

  final List<String> _imageTenMin = [
    "https://static.chloeting.com/videos/663517d500c230367fe429e6/ed1cabb0-0c79-11ef-854a-c15ecb281560.jpeg",
    "https://static.chloeting.com/videos/6584905afaede632c94fe126/23b147a0-a92c-11ee-9277-3b937f16846b.jpeg",
    "https://static.chloeting.com/videos/65849175be23b57ce10a677b/6abe4220-aea3-11ee-8b18-8b55a7ba3b1c.jpeg",
    "https://static.chloeting.com/videos/65d02d0887b4dd6dfaacfd5a/9b987f00-cfa5-11ee-9701-cfed4f69f9be.jpeg",
    "https://static.chloeting.com/videos/63ae0fd749cf64962cb573f5/18930070-959b-11ed-9436-59d29cd71f8d.jpeg",
    "https://static.chloeting.com/videos/62c4a9cfb88c73c70d9d55d4/84970330-fca7-11ec-a798-935d9eee8a63.jpeg",
  ];

  final List<String> _urlTenMin = [
    "aeVsOW1LKyQ",
    "aeVsOW1LKyQ",
    "aeVsOW1LKyQ",
    "aeVsOW1LKyQ",
    "aeVsOW1LKyQ",
    "aeVsOW1LKyQ",
  ];

  final List<String> _judulTwentyMin = [
    "Full Body Flat Tummy",
    "Do This and Get Fit",
    "2.000 Reps Workout",
    "Weight Loss Full Body HIIT",
    "Full Body No Jumping",
    "Cardio Abs",
    "1.000 Reps Workout",
  ];

  final List<String> _imageTwentyMin = [
    "https://static.chloeting.com/videos/61bbef772d47479a9df2358d/3ef80df0-5edd-11ec-b182-df31ae6aab45.jpeg",
    "https://static.chloeting.com/videos/61bbfe1c2cb3b78eb6ac2c23/f989c480-5ee5-11ec-9a04-3fd984621d67.jpeg",
    "https://static.chloeting.com/videos/61bbf1bc017bbb985e15f912/98ecd010-5ede-11ec-883e-77d525cedf9b.jpeg",
    "https://static.chloeting.com/videos/61bc29dc37778b5b830c6803/0d48b430-5f00-11ec-9fce-4781ba46fa9b.jpeg",
    "https://static.chloeting.com/videos/61ce510934185a9a5617671e/fc539460-69d1-11ec-88d2-07e5364d275e.jpeg",
    "https://static.chloeting.com/videos/63ae0f463e8cb6226b08a251/35fd68f0-8a9a-11ed-8ba9-1dd291b341e8.jpeg",
    "https://static.chloeting.com/videos/61bbf3532cb3b78eb6ac2bf7/8c4e6a70-5edf-11ec-b8cd-2976cd667d03.jpeg",
  ];

  final List<String> _urlTwentyMin = [
    "aeVsOW1LKyQ",
    "aeVsOW1LKyQ",
    "aeVsOW1LKyQ",
    "aeVsOW1LKyQ",
    "aeVsOW1LKyQ",
    "aeVsOW1LKyQ",
    "aeVsOW1LKyQ",
  ];

  final List<String> _judulStanding = [
    "Lean Arms Workout",
    "Standing Abs",
    "Fat Burn",
    "Calorie Burning HIIT",
    "Standing Abs",
    "Full Body Workout - No Planks",
    "Weight Loss HIIT",
  ];

  final List<String> _imageStanding = [
    "https://static.chloeting.com/videos/61bbdeaac3d293024898b867/00b789d0-2aaa-11ef-ba9e-f5dd36a3fc38.jpeg",
    "https://static.chloeting.com/videos/61bbf2732cb3b78eb6ac2bf4/0666a170-5edf-11ec-b8cd-2976cd667d03.jpeg",
    "https://static.chloeting.com/videos/61bbf2bd2d47479a9df235a2/327be0e0-5edf-11ec-883e-77d525cedf9b.jpeg",
    "https://static.chloeting.com/videos/61bc1df44df7b918c30e8bb3/f49be300-5ef8-11ec-b4e8-6545cdfc138f.jpeg",
    "https://static.chloeting.com/videos/6344d251ed61d9ae54297892/a408c1e0-4ec3-11ed-a3ce-b308361a3e05.jpeg",
    "https://static.chloeting.com/videos/6289a4cfaff22d3c952a8b2d/da43cf30-d979-11ec-8387-814d61d6974c.jpeg",
    "https://static.chloeting.com/videos/61ce4f20173d57799999a755/d8793960-69d0-11ec-88d2-07e5364d275e.jpeg",
  ];

  final List<String> _urlStanding = [
    "aeVsOW1LKyQ",
    "aeVsOW1LKyQ",
    "aeVsOW1LKyQ",
    "aeVsOW1LKyQ",
    "aeVsOW1LKyQ",
    "aeVsOW1LKyQ",
    "aeVsOW1LKyQ",
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _youtubeController = YoutubePlayerController(
      initialVideoId: 'aeVsOW1LKyQ', // ID video from YouTube URL
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _youtubeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: const Text(
              'Videos',
              style: TextStyle(color: Colors.white),
            ),
            pinned: true,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Color.fromARGB(255, 237, 86, 59),
              ),
            ),
            bottom: TabBar(
              labelColor: Color.fromARGB(255, 255, 255, 255),
              indicatorColor: Color.fromARGB(255, 205, 141, 130),
              unselectedLabelColor: Color.fromARGB(255, 252, 157, 141),
              controller: _tabController,
              tabs: const <Widget>[
                Tab(
                  child: Text('10 Mins'),
                ),
                Tab(
                  child: Text('20 Mins +'),
                ),
                Tab(
                  child: Text('Standing'),
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                ListView.builder(
                  itemCount: _judulTenMin.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        _youtubeController.load(_urlTenMin[index]);
                      },
                      child: Container(
                        height: 150,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Image.network(
                                _imageTenMin[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 16,
                              left: 16,
                              child: Text(
                                _judulTenMin[index],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.center,
                                child: YoutubePlayer(
                                  controller: _youtubeController,
                                  showVideoProgressIndicator: true,
                                  progressIndicatorColor: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                ListView.builder(
                  itemCount: _judulTwentyMin.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        _youtubeController.load(_urlTwentyMin[index]);
                      },
                      child: Container(
                        height: 150,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Image.network(
                                _imageTwentyMin[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 16,
                              left: 16,
                              child: Text(
                                _judulTwentyMin[index],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.center,
                                child: YoutubePlayer(
                                  controller: _youtubeController,
                                  showVideoProgressIndicator: true,
                                  progressIndicatorColor: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                ListView.builder(
                  itemCount: _judulStanding.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        _youtubeController.load(_urlStanding[index]);
                      },
                      child: Container(
                        height: 150,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Image.network(
                                _imageStanding[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 16,
                              left: 16,
                              child: Text(
                                _judulStanding[index],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.center,
                                child: YoutubePlayer(
                                  controller: _youtubeController,
                                  showVideoProgressIndicator: true,
                                  progressIndicatorColor: Colors.red,
                                ),
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
