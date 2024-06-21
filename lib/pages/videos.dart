import 'package:flutter/material.dart';
import 'package:activewell_new/services/favoriteVideo_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TenMinVideos {
  String title, image;
  Uri url;
  TenMinVideos({
    required this.title,
    required this.image,
    required this.url,
  });
}

List<TenMinVideos> tenMinVideoList = [
  TenMinVideos(
    title: "10 Min Intense Abs",
    image:
        "https://static.chloeting.com/videos/663517d500c230367fe429e6/ed1cabb0-0c79-11ef-854a-c15ecb281560.jpeg",
    url: Uri.parse('https://youtu.be/aeVsOW1LKyQ'),
  ),
  TenMinVideos(
    title: "10 Min Daily Abs",
    image:
        "https://static.chloeting.com/videos/6584905afaede632c94fe126/23b147a0-a92c-11ee-9277-3b937f16846b.jpeg",
    url: Uri.parse('https://youtu.be/DUvXoAwR-8k'),
  ),
  TenMinVideos(
    title: "Toned Arms",
    image:
        "https://static.chloeting.com/videos/65849175be23b57ce10a677b/6abe4220-aea3-11ee-8b18-8b55a7ba3b1c.jpeg",
    url: Uri.parse('https://youtu.be/LE6RidrBMdM'),
  ),
  TenMinVideos(
    title: "Standing Abs",
    image:
        "https://static.chloeting.com/videos/65d02d0887b4dd6dfaacfd5a/9b987f00-cfa5-11ee-9701-cfed4f69f9be.jpeg",
    url: Uri.parse('https://youtu.be/oZkq0BZpDXY'),
  ),
  TenMinVideos(
    title: "10 Min HIIT",
    image:
        "https://static.chloeting.com/videos/63ae0fd749cf64962cb573f5/18930070-959b-11ed-9436-59d29cd71f8d.jpeg",
    url: Uri.parse('https://youtu.be/bYlWxYP6b9s'),
  ),
  TenMinVideos(
    title: "Core & Arms",
    image:
        "https://static.chloeting.com/videos/62c4a9cfb88c73c70d9d55d4/84970330-fca7-11ec-a798-935d9eee8a63.jpeg",
    url: Uri.parse('https://youtu.be/k8-Voj9GfDw'),
  ),
];

class TwentyMinVideos {
  String title, image;
  Uri url;
  TwentyMinVideos({
    required this.title,
    required this.image,
    required this.url,
  });
}

List<TwentyMinVideos> twentyMinVideoList = [
  TwentyMinVideos(
    title: "Full Body Flat Tummy",
    image:
        "https://static.chloeting.com/videos/61bbef772d47479a9df2358d/00a25fa0-2dd5-11ef-8a2f-57a8e8858c98.jpeg",
    url: Uri.parse('https://youtu.be/CGmr02bfHUo'),
  ),
  TwentyMinVideos(
    title: "Do This and Get Fit",
    image:
        "https://static.chloeting.com/videos/61bbfe1c2cb3b78eb6ac2c23/f989c480-5ee5-11ec-9a04-3fd984621d67.jpeg",
    url: Uri.parse('https://youtu.be/ixKRye1PqXU'),
  ),
  TwentyMinVideos(
    title: "Complete Full Body Workout",
    image:
        "https://static.chloeting.com/videos/61bbb9f2017bbb985e15f8b6/24cf9610-22d4-11ef-981d-4940af0f8fe6.jpeg",
    url: Uri.parse('https://youtu.be/LeOHID-EDA0'),
  ),
  TwentyMinVideos(
    title: "Weight Loss Full Body HIIT",
    image:
        "https://static.chloeting.com/videos/61bc29dc37778b5b830c6803/0d48b430-5f00-11ec-9fce-4781ba46fa9b.jpeg",
    url: Uri.parse('https://youtu.be/uvNsr4Fy-DU'),
  ),
  TwentyMinVideos(
    title: "Full Body No Jumping",
    image:
        "https://static.chloeting.com/videos/61ce510934185a9a5617671e/fc539460-69d1-11ec-88d2-07e5364d275e.jpeg",
    url: Uri.parse('https://youtu.be/gvV65CCDMvg'),
  ),
  TwentyMinVideos(
    title: "Cardio Abs",
    image:
        "https://static.chloeting.com/videos/63ae0f463e8cb6226b08a251/35fd68f0-8a9a-11ed-8ba9-1dd291b341e8.jpeg",
    url: Uri.parse('https://youtu.be/kFqVB3v9Jk0'),
  ),
];

class StandingVideos {
  String title, image;
  Uri url;
  StandingVideos({
    required this.title,
    required this.image,
    required this.url,
  });
}

List<StandingVideos> standingVideoList = [
  StandingVideos(
    title: "Lean Arms Workout",
    image:
        "https://static.chloeting.com/videos/61bbdeaac3d293024898b867/00b789d0-2aaa-11ef-ba9e-f5dd36a3fc38.jpeg",
    url: Uri.parse('https://youtu.be/j64BBgBGNIU'),
  ),
  StandingVideos(
    title: "Standing Abs",
    image:
        "https://static.chloeting.com/videos/61bbf2732cb3b78eb6ac2bf4/3c373530-2de0-11ef-9b06-c7b6b0618b61.jpeg",
    url: Uri.parse('https://youtu.be/V4sWpLJcQoU'),
  ),
  StandingVideos(
    title: "Fat Burn",
    image:
        "https://static.chloeting.com/videos/61bbf2bd2d47479a9df235a2/4c9ce690-2de0-11ef-ba9e-f5dd36a3fc38.jpeg",
    url: Uri.parse('https://youtu.be/StN0-7XLuR4'),
  ),
  StandingVideos(
    title: "Calorie Burning HIIT",
    image:
        "https://static.chloeting.com/videos/61bc1df44df7b918c30e8bb3/f49be300-5ef8-11ec-b4e8-6545cdfc138f.jpeg",
    url: Uri.parse('https://youtu.be/xlIKZKO8wao'),
  ),
  StandingVideos(
    title: "Full Body Workout - No Planks",
    image:
        "https://static.chloeting.com/videos/6289a4cfaff22d3c952a8b2d/da43cf30-d979-11ec-8387-814d61d6974c.jpeg",
    url: Uri.parse('https://youtu.be/lX9XDNhxf54'),
  ),
  StandingVideos(
    title: "Weight Loss HIIT",
    image:
        "https://static.chloeting.com/videos/61ce4f20173d57799999a755/d8793960-69d0-11ec-88d2-07e5364d275e.jpeg",
    url: Uri.parse('https://youtu.be/T8o6ti9tbFA'),
  ),
];

class VideosPage extends ConsumerStatefulWidget {
  const VideosPage({super.key});

  @override
  ConsumerState<VideosPage> createState() => _VideosPageState();
}

class _VideosPageState extends ConsumerState<VideosPage>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  late YoutubePlayerController _youtubeController;
  final Uri url = Uri.parse('https://flutter.dev');

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
                  child: Text('10 Mins'), // Ganti ikon menjadi teks "meal"
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
                  itemCount: tenMinVideoList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        print("launch youtube app");
                        await launchUrl(tenMinVideoList[index].url);
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
                                    tenMinVideoList[index].image,
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
                                      tenMinVideoList[index].title,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    width: 80,
                                  ),
                                  Expanded(
                                    child: IconButton(
                                      icon: Icon(Icons.bookmark),
                                      onPressed: () async {
                                        final favoriteVideoProviderNotifier =
                                            ref.read(videoProvider.notifier);
                                        await favoriteVideoProviderNotifier
                                            .addFavoriteVideos(
                                          context,
                                          tenMinVideoList[index].title,
                                          'Sample Description',
                                          tenMinVideoList[index].url.toString(),
                                          tenMinVideoList[index].image,
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
                  itemCount: twentyMinVideoList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        print("launch youtube app");
                        await launchUrl(twentyMinVideoList[index].url);
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
                                    twentyMinVideoList[index].image,
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
                                      twentyMinVideoList[index].title,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    width: 80,
                                  ),
                                  Expanded(
                                    child: IconButton(
                                      icon: Icon(Icons.bookmark),
                                      onPressed: () async {
                                        final favoriteVideoProviderNotifier =
                                            ref.read(videoProvider.notifier);
                                        await favoriteVideoProviderNotifier
                                            .addFavoriteVideos(
                                          context,
                                          twentyMinVideoList[index].title,
                                          'Sample Description',
                                          'http://example.com/video.mp4',
                                          twentyMinVideoList[index].image,
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
                  itemCount: standingVideoList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        print("launch youtube app");
                        await launchUrl(standingVideoList[index].url);
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
                                    standingVideoList[index].image,
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
                                      standingVideoList[index].title,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    width: 80,
                                  ),
                                  Expanded(
                                    child: IconButton(
                                      icon: Icon(Icons.bookmark),
                                      onPressed: () async {
                                        final favoriteVideoProviderNotifier =
                                            ref.read(videoProvider.notifier);
                                        await favoriteVideoProviderNotifier
                                            .addFavoriteVideos(
                                          context,
                                          standingVideoList[index].title,
                                          'Sample Description',
                                          'http://example.com/video.mp4',
                                          standingVideoList[index].image,
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
