import 'package:activewell_new/common/color_extension.dart';
import 'package:activewell_new/common_widget/round_button.dart';
import 'package:activewell_new/models/track_records.dart';
import 'package:activewell_new/services/bmi_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToolsPage extends ConsumerWidget {
  const ToolsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var media = MediaQuery.of(context).size;

    var weightController = TextEditingController();
    var heightController = TextEditingController();

    var bmiList = ref.watch(bmiprovider);

    return Scaffold(
        backgroundColor: TColor.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Upper section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15),
                      Text(
                        "Calculate your BMI!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: TColor.gray,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: media.width * 0.05),
                  // BMI Container
                  Container(
                    height: media.width * 0.48,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: TColor.primaryG),
                      borderRadius: BorderRadius.circular(media.width * 0.075),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "BMI (Body Mass Index)",
                                    style: TextStyle(
                                        color: TColor.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: Text(
                                      bmiList.isNotEmpty
                                          ? bmiList.first.result
                                          : "No data",
                                      style: TextStyle(
                                          color: TColor.white.withOpacity(0.9),
                                          fontSize: 14),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  SizedBox(
                                    width: 120,
                                    height: 35,
                                    child: RoundButton(
                                      title: "Calculate",
                                      type: RoundButtonType.bgSGradient,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      onPressed: () {
                                        // Create pop-up for BMI calculator
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              backgroundColor:
                                                  TColor.primaryColor1,
                                              content: BmiCalculator(
                                                  media: media,
                                                  weightController:
                                                      weightController,
                                                  heightController:
                                                      heightController),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: media.width * 0.2,
                                width: media.width * 0.2,
                                decoration: BoxDecoration(
                                  color: TColor.white,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(
                                  child: Text(
                                    bmiList.isNotEmpty
                                        ? bmiList.first.bmi.toString()
                                        : "N/A",
                                    style: TextStyle(
                                        color: TColor.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: media.width * 0.05),
                  // BMI Records List
                  SizedBox(
                    height: media.width * 1,
                    child: StreamBuilder<List<TrackRecord>>(
                      stream: TrackRecord.getTrackRecords(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.data!.isEmpty) {
                          return Center(child: Text("No data"));
                        } else {
                          return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: TColor.primaryColor1,
                                      borderRadius: BorderRadius.circular(15)),
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "BMI: ",
                                        style: TextStyle(
                                            color: TColor.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Height: ${snapshot.data![index].height}",
                                        style: TextStyle(
                                          color: TColor.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Weight: ${snapshot.data![index].weight}",
                                        style: TextStyle(
                                          color: TColor.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class BmiCalculator extends ConsumerWidget {
  const BmiCalculator({
    super.key,
    required this.media,
    required this.weightController,
    required this.heightController,
  });

  final Size media;
  final TextEditingController weightController;
  final TextEditingController heightController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: media.width * 0.75,
      width: media.width * 1,
      decoration: BoxDecoration(
        color: TColor.primaryColor1,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 25, 15, 2),
            child: Text(
              "BMI Calculator",
              style: TextStyle(
                color: TColor.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 20, 15, 2),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: weightController,
              decoration: InputDecoration(
                hintText: "Enter your weight in Kg",
                hintStyle: TextStyle(
                    color: TColor.gray,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: TColor.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 10, 15, 2),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: heightController,
              decoration: InputDecoration(
                hintText: "Enter your height in Cm",
                hintStyle: TextStyle(
                    color: TColor.gray,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: TColor.white,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (weightController.text.isEmpty ||
                  heightController.text.isEmpty) {
              } else {
                ref.read(bmiprovider.notifier).addRecord(
                    double.parse(heightController.text),
                    double.parse(weightController.text));
              }
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: TColor.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                      color: TColor.primaryColor1,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
