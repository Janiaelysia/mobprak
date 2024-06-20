import 'package:flutter/material.dart';

class detailMeal1 extends StatefulWidget {
  const detailMeal1({super.key});

  @override
  State<detailMeal1> createState() => _detailMeal1State();
}

class _detailMeal1State extends State<detailMeal1> {
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
                            "https://static.chloeting.com/recipes/61fcbd362a18c23f7d7f8af3/images/vegan-curried-egg-sandwich-1.webp",
                            width: 300,
                            height: 400,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Text(
                            "Vegan Curried Egg Sandwich",
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
                          "Salad tahu kari enak & pengganti sandwich telur kari! Bubuk kari memiliki banyak manfaat. Salad ini cocok untuk sandwich, wraps, atau topping untuk kerupuk nasi.",
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
                          "200 gram Tahu keras, 1 sendok teh Mustard kuning, 1 sendok teh tahini, 1 sendok teh jus jeruk nipis, 1,5 sdm bubuk kari, 1 sendok teh bubuk bawang, 1/2 sdt bubuk bawang putih, 1/4 sdt Kunyit, 1/4 sdt paprika, 1/2 sdt garam hitam, 1/4 sdt merica putih, Sejumput lada hitam.",
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
                          "1. Tiriskan tahu dan keringkan dengan handuk kertas. Hancurkan ke dalam mangkuk besar dengan tangan anda. 2. Tambahkan semua bahan lainnya selain roti gandum. Campur hingga tercampur. 3. Tambahkan tahu yang sudah dihancurkan ke dalam wadah pencampur dan aduk hingga tercampur. 4. Susun sandwich dengan melapisi satu potong roti, selada, salad telur kari vegan, dan taburi dengan potongan roti kedua.",
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
