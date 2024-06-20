import 'package:flutter/material.dart';

class detailMeal3 extends StatefulWidget {
  const detailMeal3({super.key});

  @override
  State<detailMeal3> createState() => _detailMeal3State();
}

class _detailMeal3State extends State<detailMeal3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 237, 86, 59),
        title: const Center(
          child: Text(
            "Recipes",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 30, left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    // child: Container(
                    //   width: 135,
                    //   height: 135,
                    //   decoration: BoxDecoration(
                    //     border: Border.all(
                    //         color: Color.fromARGB(255, 237, 237, 237),
                    //         width: 7),
                    //     shape: BoxShape.rectangle,
                    //     image: DecorationImage(
                    //       image: NetworkImage(
                    //           "https://static.chloeting.com/recipes/6200b37d382ba4ec17393dbd/images/miso-salmon-nourish-bowl-1.webp"),
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 10,
                            left: 10,
                            right: 10,
                            bottom: 10,
                          ),
                          child: Image.network(
                            "https://activewell.arduino22.cloud/storage/recipe_image/9wenOQlVL04QTizTIUm7ZSAOn8DeOOf0pBxvbysC.jpg",
                            width: 300,
                            height: 400,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Text(
                            "Tuna Potato Egg Salad",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //durasi
                      SizedBox(height: 35),
                      Container(
                        child: Text(
                          "Durasi Masak:",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: Text(
                          "30 menit",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                      ),

                      //Deskripsi:
                      SizedBox(height: 35),
                      Container(
                        child: Text(
                          "Deskripsi:",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: Text(
                          "Salad telur kentang tuna yang mewah dan kaya protein ini sangat mudah dibuat dan jauh lebih padat nutrisi daripada salad kentang biasa.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                      ),

                      //bahan
                      SizedBox(height: 35),
                      Container(
                        child: Text(
                          "Bahan-bahan:",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: Text(
                          "400 gram kentang, 300 gram tuna, 3 telur, 1 sendok teh minyak zaitun extra virgin, 1 sendok teh air, 2 sdm cuka anggur putih, 1 sendok teh mustard, ¼ bawang merah, 1/4 sdt bubuk bawang putih, Garam, Merica.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                      ),

                      //cara
                      SizedBox(height: 35),
                      Container(
                        child: Text(
                          "Cara Masak:",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: Text(
                          "1. Didihkan air dalam panci besar, lalu rebus kentang selama 10-15 menit atau sampai empuk. Tiriskan dan biarkan dingin sebelum dipotong menjadi kubus berukuran 1 inci.2. Siapkan dressingnya dengan cara mengocok semua bahan dressing dalam wadah kecil hingga tercampur. 3. Masukkan telur dengan hati-hati ke dalam panci berisi air dingin. Pastikan telur terendam air setinggi 1-2 inci. Didihkan air dengan api sedang dan masak telur selama 6-8 menit atau matang sesuai keinginan. Sementara itu, siapkan rendaman es. Jika telur sudah matang, keluarkan dari panci dan segera masukkan ke dalam penangas es. Kupas telur dan potong kecil-kecil.4. Tambahkan kentang cincang, telur, dan tuna yang sudah dikeringkan ke dalam mangkuk besar. Gerimis saus ke seluruh bagian dan aduk hingga tercampur. Bumbui sesuai selera dengan lebih banyak garam dan merica jika perlu. ",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
