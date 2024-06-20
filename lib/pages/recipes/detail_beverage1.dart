import 'package:flutter/material.dart';

class detailBeverage1 extends StatefulWidget {
  const detailBeverage1({super.key});

  @override
  State<detailBeverage1> createState() => _detailBeverage1State();
}

class _detailBeverage1State extends State<detailBeverage1> {
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
                            "https://static.chloeting.com/recipes/6379e20bcab051845d4f5649/images/sugar-free-lemonade-1668932113353-2.webp",
                            width: 300,
                            height: 400,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Text(
                            "Sugar-Free Lemonade",
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
                          "15 menit",
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
                          "Menyegarkan, memuaskan dahaga dan sumber vitamin C. Jika Anda menyukai limun dingin di hari yang hangat, Anda harus mencoba versi bebas gula ini. Hanya 2 bahan yang dibutuhkan!",
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
                          "5 lemon besar, 180gr pemanis erythritol buah biksu, 1L Air, Es.",
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
                          "1. Tambahkan pemanis erythritol monkfruit dan sekitar 1 gelas air ke dalam panci. Panaskan campuran dan aduk sampai pemanis erythritol monkfruit benar-benar larut. Angkat dari api dan sisihkan hingga dingin. 2. Jus lemon. Saring untuk membuang biji apa pun. Anda dapat menyimpan pulp jika Anda suka memiliki pulp di limun Anda. 3. Campurkan jus lemon dan air. Pemanis dengan sirup erythritol monkfruit secukupnya. 4. Sajikan dengan es dan irisan lemon ekstra. ",
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
