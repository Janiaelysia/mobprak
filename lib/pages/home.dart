import 'package:activewell_new/common/color_extension.dart';
import 'package:activewell_new/pages/videos.dart';
import 'package:activewell_new/pages/recipes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // Creating static data in lists

  List<String> catNames = [
    "Journey",
    'Programs',
    'Videos',
    'Recipes',
  ];

  static List<String> catPages = [
    '/journey',
    '/programs',
    '/videos',
    '/recipes',
  ];

  List<String> catRoutes = [
    "JourneyPage",
    "ProgramPage",
    "VideosPage",
    "RecipesPage",
  ];

  List<String> imgList = [
    'Journey',
    'Program',
    'Video',
    'Recipe',
  ];

  List<String> thumbList = [
    "https://static.chloeting.com/videos/61bbfe1c2cb3b78eb6ac2c23/f989c480-5ee5-11ec-9a04-3fd984621d67.jpeg",
    "https://static.chloeting.com/videos/61bbf59552c5c9bf0f2550eb/d42ae580-2de0-11ef-8a2f-57a8e8858c98.jpeg",
    "https://static.chloeting.com/videos/62c4a9cfb88c73c70d9d55d4/84970330-fca7-11ec-a798-935d9eee8a63.jpeg",
    "https://static.chloeting.com/videos/65849175be23b57ce10a677b/6abe4220-aea3-11ee-8b18-8b55a7ba3b1c.jpeg",
  ];

  List<String> thumbTitle = [
    "Do This and Get Fit",
    "Warm Up",
    "Core & Arms",
    "Toned Arms",
  ];

  List<String> recList = [
    "https://static.chloeting.com/recipes/6379e20bcab051845d4f5649/images/sugar-free-lemonade-1668932113353-2.webp",
    "https://static.chloeting.com/recipes/62ce6c1387e357875647b592/images/lemon-garlic-chicken-zoodles-1.jpeg",
    "https://activewell.arduino22.cloud/storage/recipe_image/9wenOQlVL04QTizTIUm7ZSAOn8DeOOf0pBxvbysC.jpg",
    "https://static.chloeting.com/recipes/6200b658f6b3f08bdababb66/images/low-sugar-honey-soy-chicken-1.jpeg",
  ];

  List<String> recTitle = [
    "Sugar-Free Lemonade",
    "Lemon Garlic Chicken Zoodles",
    "Tuna Potato Egg Salad",
    "Low-Sugar Honey Soy Chicken",
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return ListView(
            children: [
              Container(
                padding:
                    EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 237, 86, 59),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Icon(
                    //       Icons.dashboard,
                    //       size: 30,
                    //       color: Colors.white,
                    //     ),
                    //     Icon(
                    //       Icons.notifications,
                    //       size: 30,
                    //       color: Colors.white,
                    //     ),
                    //   ],
                    // ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(left: 3, bottom: 15),
                      child: Text(
                        "Hi, ${snapshot.data!.data()!['fname']}",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          wordSpacing: 2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VideosPage()),
                            );
                          },
                          child: Container(
                            height: 40,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: TColor.primaryColor1,
                            ),
                            child: Center(
                              child: Text(
                                "Videos",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RecipesPage()),
                            );
                          },
                          child: Container(
                            height: 40,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: TColor.primaryColor1,
                            ),
                            child: Center(
                              child: Text(
                                "Recipe",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // GridView.builder(
                    //   itemCount: catNames.length,
                    //   shrinkWrap: true,
                    //   physics: NeverScrollableScrollPhysics(),
                    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //     crossAxisCount: 4,
                    //     childAspectRatio: 1.1,
                    //   ),

                    //   //logo di menu
                    //   itemBuilder: (context, index) {
                    //     return GestureDetector(
                    //       onTap: () {
                    //         Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) => RecipesPage()),
                    //         );
                    //       },
                    //       child: Container(
                    //         height: 40,
                    //         width: 120,
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(20),
                    //           color: TColor.primaryColor1,
                    //         ),
                    //         child: Center(
                    //           child: Text(
                    //             "Recipe",
                    //             style: TextStyle(
                    //               fontSize: 20,
                    //               fontWeight: FontWeight.w600,
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //     InkWell(
                    //       onTap: () {
                    //         Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) => VideosPage()),
                    //         );
                    //       },
                    //       child: Container(
                    //         height: 40,
                    //         width: 120,
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(20),
                    //           color: TColor.primaryColor1,
                    //         ),
                    //         child: Center(
                    //           child: Text(
                    //             "Videos",
                    //             style: TextStyle(
                    //               fontSize: 20,
                    //               fontWeight: FontWeight.w600,
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // // GridView.builder(
                    // //   itemCount: catNames.length,
                    // //   shrinkWrap: true,
                    // //   physics: NeverScrollableScrollPhysics(),
                    // //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    // //     crossAxisCount: 4,
                    // //     childAspectRatio: 1.1,
                    // //   ),

                    // //   //logo di menu
                    // //   itemBuilder: (context, index) {
                    // //     return GestureDetector(
                    // //       onTap: () {
                    // //         print(catNames[index]);
                    // //         Navigator.pushNamed(context, catPages[index]);
                    // //       },
                    // //       child: Column(
                    // //         children: [
                    // //           Container(
                    // //             height: 45,
                    // //             width: 50,
                    // //             decoration: BoxDecoration(
                    // //               image: DecorationImage(
                    // //                 image: AssetImage(
                    // //                   "images/${imgList[index]}.png",
                    // //                 ),
                    // //                 fit: BoxFit.cover,
                    // //               ),
                    // //             ),
                    // //           ),
                    // //           SizedBox(height: 10),
                    // //           Container(
                    // //             margin: EdgeInsets.only(bottom: 15),
                    // //             child: Text(
                    // //               catNames[index],
                    // //               style: TextStyle(
                    // //                 fontSize: 10,
                    // //                 fontWeight: FontWeight.w500,
                    // //                 color: Colors.black.withOpacity(0.7),
                    // //               ),
                    // //             ),
                    // //           ),
                    // //         ],
                    // //       ),
                    // //     );
                    // //   },
                    // // ),
                    // SizedBox(height: 20),

                    //grid videos
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Videos",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigasi ke VideosPage()
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VideosPage()),
                            );
                          },
                          child: Text(
                            "See All",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 237, 86, 59),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),

                    //isi videos
                    Container(
                      height: 290,
                      width: 500, // Adjustable
                      child: ListView.builder(
                        itemCount: imgList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              padding: EdgeInsets.only(
                                right: 10,
                                left: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xFFF5F3FF),
                              ),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      top: 20,
                                      left: 10,
                                      right: 10,
                                      bottom: 20,
                                    ),
                                    child: Image.network(
                                      "${thumbList[index]}",
                                      width: 300,
                                      height: 200,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      thumbTitle[index],
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black.withOpacity(0.6),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20),

                    //grid recipes
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recipes",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigasi ke RecipesPage()
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RecipesPage()),
                            );
                          },
                          child: Text(
                            "See All",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 237, 86, 59),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),

                    //isi recipes
                    Container(
                      width: 500,
                      height: 500,
                      child: ListView.builder(
                        itemCount: imgList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              padding: EdgeInsets.only(
                                right: 10,
                                left: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xFFF5F3FF),
                              ),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      top: 20,
                                      left: 10,
                                      right: 10,
                                      bottom: 20,
                                    ),
                                    child: Image.network(
                                      "${recList[index]}",
                                      width: 300,
                                      height: 400,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      recTitle[index],
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black.withOpacity(0.6),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          );
        }
        return CircularProgressIndicator();
      }),
    );
  }
}
