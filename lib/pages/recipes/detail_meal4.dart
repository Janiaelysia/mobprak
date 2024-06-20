import 'package:flutter/material.dart';

class detailMeal4 extends StatefulWidget {
  const detailMeal4({super.key});

  @override
  State<detailMeal4> createState() => _detailMeal4State();
}

class _detailMeal4State extends State<detailMeal4> {
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
                            "https://static.chloeting.com/recipes/6200b658f6b3f08bdababb66/images/low-sugar-honey-soy-chicken-1.jpeg",
                            width: 300,
                            height: 400,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Text(
                            "Low-Sugar Honey Soy Chicken",
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
                          "40 menit",
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
                          "Ayam kedelai madu versi rendah gula. Saus yang lebih sehat ini lebih rendah gula namun tetap kental dan mengkilat dan enak! ",
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
                          "2 fillet dada ayam, 1/2 sdt kanji dr tepung jagung, 1 sendok teh air, 1 sendok the madu, 2 sdm pemanis erythritol buah biksu, 2 sdm kecap asin, 1/4 sdt bubuk bawang putih, 1 sendok teh minyak wijen. ",
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
                          "1. Dada ayam potong dadu ukuran sedang. 2. Dalam mangkuk besar, tambahkan madu, pemanis eritritol buah biksu, kecap asin, dan minyak wijen, lalu aduk hingga tercampur. Tambahkan ayam potong dadu dan aduk hingga rata. Tutup dan biarkan meresap di lemari es setidaknya selama 30 menit atau semalaman. 3. Panaskan wajan antilengket dengan api sedang, masukkan ayam dan seluruh bumbu marinasi. Masak selama 5-6 menit atau sampai ayam matang, aduk sesekali. 4. Dalam mangkuk kecil, larutkan tepung maizena dalam air. 5. Tambahkan campuran tepung maizena ke dalam wajan dan aduk hingga saus mengental hingga kekentalan yang diinginkan. Jika terlalu kental, tambahkan sedikit air. 6. Angkat dari api dan sajikan segera dengan nasi kukus/nasi kembang kol dan sayuran kukus favorit Anda. ",
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
