import 'package:flutter/material.dart';

class detailSnack4 extends StatefulWidget {
  const detailSnack4({super.key});

  @override
  State<detailSnack4> createState() => _detailSnack4State();
}

class _detailSnack4State extends State<detailSnack4> {
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
                            "https://static.chloeting.com/recipes/61fe428ce75e851db89820f3/images/strawberry-protein-bliss-balls-1.webp",
                            width: 300,
                            height: 400,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Text(
                            "Strawberry Protein Bliss Balls",
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
                          "10 menit",
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
                          "Bola kebahagiaan yang dikemas protein lezat untuk memuaskan hasrat gula Anda. Ini memiliki keseimbangan karbohidrat, protein dan lemak yang baik dari kurma Medjool, hazelnut dan stroberi untuk membantu Anda kenyang untuk waktu yang lama!",
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
                          "150gr Kurma Medjool, 80g Hazelnut, 70gr bubuk protein nabati, Stroberi, 3 sdm bubuk kakao, 1/4 sdt, garam, Stevia, Air.",
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
                          "1. Rendam kurma dalam air hangat selama 5-10 menit sampai lunak tetapi tidak lembek. 2. Tambahkan kurma lunak, bubuk protein nabati, bubuk kakao, garam dan pemanis ke dalam food processor, lalu proses hingga tercampur rata. 3. Terakhir, tambahkan hazelnut Anda ke food processor dan berikan blitz cepat. Campuran ini akan menjadi lapisan bola kebahagiaan Anda. Jangan terlalu banyak memproses di sini jika Anda menginginkan crunch yang bagus untuk itu. 4. Ambil stroberi Anda dan bungkus satu per satu dalam lapisan lapisan bola kebahagiaan Anda dan selesai!",
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
