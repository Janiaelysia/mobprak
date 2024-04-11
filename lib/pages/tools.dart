import 'package:activewell_new/common/color_extension.dart';
import 'package:activewell_new/common_widget/round_button.dart';
import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class ToolsPage extends StatefulWidget {
  const ToolsPage({super.key});

  @override
  State<ToolsPage> createState() => _ToolsPageState();
}

class _ToolsPageState extends State<ToolsPage> {
  //buat grafik heart rate (linear bar data)
  List<int> showingTooltipOnSpots = [21];

  List<FlSpot> get allSpots => const [
        FlSpot(0, 55),
        FlSpot(1, 55),
        FlSpot(2, 54),
        FlSpot(3, 53),
        FlSpot(4, 53),
        FlSpot(5, 53),
        FlSpot(6, 52),
        FlSpot(7, 53),
        FlSpot(8, 52),
        FlSpot(9, 52),
        FlSpot(10, 51.5),
        FlSpot(11, 51),
        FlSpot(12, 51),
        FlSpot(13, 50),
        FlSpot(14, 50),
        FlSpot(15, 49),
        FlSpot(16, 49),
        FlSpot(17, 48),
        FlSpot(18, 47),
        FlSpot(19, 46),
        FlSpot(20, 46),
        FlSpot(21, 45),
        FlSpot(22, 45),
        FlSpot(23, 44),
        FlSpot(24, 45),
        FlSpot(25, 45),
      ];
  //end of grafik heart rate

  List waterArr = [
    {"title": "4pm - now", "subtitle": "1200ml"},
    {"title": "2pm - 4pm", "subtitle": "700ml"},
    {"title": "11am - 2pm", "subtitle": "1000ml"},
    {"title": "9am - 11am", "subtitle": "500ml"},
    {"title": "6am - 8am", "subtitle": "600ml"},
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    //line bar data
    final lineBarsData = [
      LineChartBarData(
        showingIndicators: showingTooltipOnSpots,
        spots: allSpots,
        isCurved: false,
        barWidth: 3,
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(colors: [
            TColor.primaryColor2.withOpacity(0.4),
            TColor.primaryColor1.withOpacity(0.1),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        dotData: FlDotData(show: false),
        gradient: LinearGradient(
          colors: TColor.primaryG,
        ),
      ),
    ];
    //end of line bar data

    final tooltipsOnBar = lineBarsData[0];

    var lineTouchTooltipData = LineTouchTooltipData(
      getTooltipColor: (touchedSpot) => Colors.pink,
      tooltipRoundedRadius: 20,
      getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
        return lineBarsSpot.map((lineBarSpot) {
          return LineTooltipItem(
            lineBarSpot.y.toString(),
            const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          );
        }).toList();
      },
    );
    return Scaffold(
        backgroundColor: TColor.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //bagian paling atas
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Tools",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: TColor.gray,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),

                  // bikin kotak ungu BMI
                  Container(
                    height: media.width * 0.4,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: TColor.primaryG),
                      borderRadius: BorderRadius.circular(media.width * 0.075),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 25),
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
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "You have a normal weight",
                                    style: TextStyle(
                                        color: TColor.white.withOpacity(0.7),
                                        fontSize: 12),
                                  ),
                                  SizedBox(
                                    height: media.width * 0.05,
                                  ),
                                  SizedBox(
                                    width: 120,
                                    height: 35,
                                    child: RoundButton(
                                      title: "View More",
                                      type: RoundButtonType.bgSGradient,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),

                              // pie chart
                              AspectRatio(
                                aspectRatio: 1,
                                child: PieChart(
                                  PieChartData(
                                    pieTouchData: PieTouchData(
                                      touchCallback: (FlTouchEvent event,
                                          pieTouchResponse) {},
                                    ),
                                    startDegreeOffset: 250,
                                    borderData: FlBorderData(
                                      show: false,
                                    ),
                                    sectionsSpace: 1,
                                    centerSpaceRadius: 0,
                                    sections: showingSections(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: media.width * 0.05,
                  ),

                  // today target
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    decoration: BoxDecoration(
                      color: TColor.primaryColor2.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Today Target",
                          style: TextStyle(
                              color: TColor.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 70,
                          height: 25,
                          child: RoundButton(
                            title: "Check",
                            type: RoundButtonType.bgGradient,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),

                  //Activity status
                  Text(
                    "Activity Status",
                    style: TextStyle(
                        color: TColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),

                  SizedBox(
                    height: media.width * 0.02,
                  ),

                  // bawahnya activity status
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      height: media.width * 0.4,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: TColor.primaryColor2.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Body Weight",
                                  style: TextStyle(
                                      color: TColor.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                ShaderMask(
                                  //dari round_button.dart
                                  blendMode: BlendMode.srcIn,
                                  shaderCallback: (bounds) {
                                    return LinearGradient(
                                            colors: TColor.primaryG,
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight)
                                        .createShader(Rect.fromLTRB(
                                            0, 0, bounds.width, bounds.height));
                                  },
                                  child: Text(
                                    "45kg",
                                    style: TextStyle(
                                        color: TColor.white.withOpacity(0.7),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          //line chart
                          LineChart(
                            LineChartData(
                              showingTooltipIndicators:
                                  showingTooltipOnSpots.map((index) {
                                return ShowingTooltipIndicators([
                                  LineBarSpot(
                                    tooltipsOnBar,
                                    lineBarsData.indexOf(tooltipsOnBar),
                                    tooltipsOnBar.spots[index],
                                  ),
                                ]);
                              }).toList(),
                              lineTouchData: LineTouchData(
                                enabled: true,
                                handleBuiltInTouches: false,
                                touchCallback: (FlTouchEvent event,
                                    LineTouchResponse? response) {
                                  if (response == null ||
                                      response.lineBarSpots == null) {
                                    return;
                                  }
                                  if (event is FlTapUpEvent) {
                                    final spotIndex =
                                        response.lineBarSpots!.first.spotIndex;
                                    showingTooltipOnSpots.clear();
                                    setState(
                                      () {
                                        showingTooltipOnSpots.add(spotIndex);
                                      },
                                    );
                                  }
                                },
                                mouseCursorResolver: (FlTouchEvent event,
                                    LineTouchResponse? response) {
                                  if (response == null ||
                                      response.lineBarSpots == null) {
                                    return SystemMouseCursors.basic;
                                  }
                                  return SystemMouseCursors.click;
                                },
                                getTouchedSpotIndicator:
                                    (LineChartBarData barData,
                                        List<int> spotIndexes) {
                                  return spotIndexes.map((index) {
                                    return TouchedSpotIndicatorData(
                                      FlLine(
                                        color: Colors.red,
                                      ),
                                      FlDotData(
                                        show: true,
                                        getDotPainter:
                                            (spot, percent, barData, index) =>
                                                FlDotCirclePainter(
                                          radius: 3,
                                          color: Colors.white,
                                          strokeWidth: 3,
                                          strokeColor: TColor.secondaryColor1,
                                        ),
                                      ),
                                    );
                                  }).toList();
                                },
                                touchTooltipData: LineTouchTooltipData(
                                  tooltipRoundedRadius: 20,
                                  getTooltipItems:
                                      (List<LineBarSpot> lineBarsSpot) {
                                    return lineBarsSpot.map((lineBarSpot) {
                                      return LineTooltipItem(
                                        "${lineBarSpot.x.toInt()} weeks",
                                        const TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      );
                                    }).toList();
                                  },
                                ),
                              ),
                              lineBarsData: lineBarsData,
                              minY: 0,
                              maxY: 100,
                              titlesData: FlTitlesData(
                                show: false,
                              ),
                              gridData: FlGridData(show: false),
                              borderData: FlBorderData(
                                show: true,
                                border: Border.all(
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: media.width * 0.05,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: media.width * 0.95,
                          padding: EdgeInsets.symmetric(
                              vertical: 25, horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: const [
                              BoxShadow(color: Colors.black12, blurRadius: 2)
                            ],
                          ),
                          child: Row(
                            children: [
                              SimpleAnimationProgressBar(
                                height: media.width * 0.85,
                                width: media.width * 0.07,
                                backgroundColor: Colors.grey.shade100,
                                foregrondColor: Colors.purple,
                                ratio: 0.5,
                                direction: Axis.vertical,
                                curve: Curves.fastLinearToSlowEaseIn,
                                duration: const Duration(seconds: 3),
                                borderRadius: BorderRadius.circular(15),
                                gradientColor: LinearGradient(
                                    colors: TColor.primaryG,
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Water Intake",
                                    style: TextStyle(
                                        color: TColor.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  ShaderMask(
                                    //dari round_button.dart
                                    blendMode: BlendMode.srcIn,
                                    shaderCallback: (bounds) {
                                      return LinearGradient(
                                              colors: TColor.primaryG,
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight)
                                          .createShader(Rect.fromLTRB(0, 0,
                                              bounds.width, bounds.height));
                                    },
                                    child: Text(
                                      "4 Liters",
                                      style: TextStyle(
                                          color: TColor.white.withOpacity(0.7),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Real time updates",
                                    style: TextStyle(
                                      color: TColor.gray,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: waterArr.map((wObj) {
                                      var isLast = wObj == waterArr.last;
                                      return Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 4),
                                                width: 10,
                                                height: 10,
                                                decoration: BoxDecoration(
                                                  color: TColor.secondaryColor1
                                                      .withOpacity(0.5),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                              ),
                                              if (!isLast)
                                                DottedDashedLine(
                                                    height: media.width * 0.078,
                                                    width: 0,
                                                    dashColor: TColor
                                                        .secondaryColor1
                                                        .withOpacity(0.5),
                                                    axis: Axis.vertical)
                                            ],
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                wObj["title"].toString(),
                                                style: TextStyle(
                                                  color: TColor.gray,
                                                  fontSize: 10,
                                                ),
                                              ),
                                              ShaderMask(
                                                blendMode: BlendMode.srcIn,
                                                shaderCallback: (bounds) {
                                                  return LinearGradient(
                                                          colors:
                                                              TColor.secondaryG,
                                                          begin: Alignment
                                                              .centerLeft,
                                                          end: Alignment
                                                              .centerRight)
                                                      .createShader(
                                                          Rect.fromLTRB(
                                                              0,
                                                              0,
                                                              bounds.width,
                                                              bounds.height));
                                                },
                                                child: Text(
                                                  wObj["subtitle"].toString(),
                                                  style: TextStyle(
                                                      color: TColor.white
                                                          .withOpacity(0.7),
                                                      fontSize: 12),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      );
                                    }).toList(),
                                  )
                                ],
                              ))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: media.width * 0.05,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // // sleep
                            // Container(
                            //   width: double.maxFinite,
                            //   height: media.width * 0.45,
                            //   padding: const EdgeInsets.symmetric(
                            //       vertical: 25, horizontal: 20),
                            //   decoration: BoxDecoration(
                            //       color: Colors.white,
                            //       borderRadius: BorderRadius.circular(25),
                            //       boxShadow: const [
                            //         BoxShadow(
                            //             color: Colors.black12, blurRadius: 2)
                            //       ]),
                            //   child: Column(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //         Text("Sleep",
                            //             style: TextStyle(
                            //                 color: TColor.black,
                            //                 fontSize: 12,
                            //                 fontWeight: FontWeight.w700)),
                            //         ShaderMask(
                            //           blendMode: BlendMode.srcIn,
                            //           shaderCallback: (bounds) {
                            //             return LinearGradient(
                            //                     colors: TColor.primaryG,
                            //                     begin: Alignment.centerLeft,
                            //                     end: Alignment.centerRight)
                            //                 .createShader(Rect.fromLTRB(0, 0,
                            //                     bounds.width, bounds.height));
                            //           },
                            //           child: Text(
                            //             "8h 20m",
                            //             style: TextStyle(
                            //                 color:
                            //                     TColor.white.withOpacity(0.7),
                            //                 fontWeight: FontWeight.w700,
                            //                 fontSize: 14),
                            //           ),
                            //         ),
                            //         const Spacer(),
                            //         // Image.asset("assets/img/sleep_wave.png",
                            //         //     width: double.maxFinite,
                            //         //     fit: BoxFit.fitWidth)
                            //       ]),
                            // ),
                            // SizedBox(
                            //   height: media.width * 0.05,
                            // ),
                            Container(
                              width: double.maxFinite,
                              height: media.width * 0.95,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 25, horizontal: 20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black12, blurRadius: 2)
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Calories",
                                    style: TextStyle(
                                        color: TColor.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  ShaderMask(
                                    blendMode: BlendMode.srcIn,
                                    shaderCallback: (bounds) {
                                      return LinearGradient(
                                              colors: TColor.primaryG,
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight)
                                          .createShader(Rect.fromLTRB(0, 0,
                                              bounds.width, bounds.height));
                                    },
                                    child: Text(
                                      "760 kCal",
                                      style: TextStyle(
                                          color: TColor.white.withOpacity(0.7),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14),
                                    ),
                                  ),

                                  // const Spacer(),

                                  //circular progress bar
                                  Container(
                                    alignment: Alignment.center,
                                    child: SizedBox(
                                      width: media.width * 0.7,
                                      height: media.width * 0.7,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            width: media.width * 0.18,
                                            height: media.width * 0.18,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  colors: TColor.primaryG),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      media.width * 0.075),
                                            ),
                                            child: FittedBox(
                                              child: Text(
                                                "730kCal\nleft",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: TColor.white,
                                                    fontSize: 11),
                                              ),
                                            ),
                                          ),
                                          SimpleCircularProgressBar(
                                            progressStrokeWidth: 10,
                                            backStrokeWidth: 10,
                                            progressColors: TColor.primaryG,
                                            backColor: Colors.grey.shade100,
                                            valueNotifier: ValueNotifier(50),
                                            startAngle: -180,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  //list buat pie chart
  List<PieChartSectionData> showingSections() {
    return List.generate(
      2,
      (i) {
        var color0 = TColor.secondaryColor1;

        switch (i) {
          case 0:
            return PieChartSectionData(
                color: color0,
                value: 33,
                title: '',
                radius: 55,
                titlePositionPercentageOffset: 0.55,
                badgeWidget: const Text(
                  "20,1",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ));
          case 1:
            return PieChartSectionData(
              color: Colors.white,
              value: 75,
              title: '',
              radius: 45,
              titlePositionPercentageOffset: 0.55,
            );

          default:
            throw Error();
        }
      },
    );
  }
  //end of list pie chart

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(),
      );
}
