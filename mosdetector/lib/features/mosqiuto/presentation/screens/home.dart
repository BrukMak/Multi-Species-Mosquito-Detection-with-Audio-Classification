import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mosdetector/core/shared_widgets/appBar.dart';
import 'package:mosdetector/core/shared_widgets/primary_button.dart';
import 'package:mosdetector/features/mosqiuto/presentation/screens/recorder_page.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/images.dart';
import '../../../../core/utils/ui_converter.dart';
import '../bloc/mosqiuto_bloc.dart';
import '../widgets/mosqiuto_card.dart';
import 'mosqiuto_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CHSAppBar.build(context, 'Home', () {}, false),
      body: Stack(
        children: [
          BlocConsumer<MosqiutoBloc, MosqiutoState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return SingleChildScrollView(
                padding: EdgeInsets.all(19),
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: UIConverter.getComponentHeight(context, 25),
                    ),
                    const Text(
                      'Mosquitoes Wingbeat Detection',
                      style: TextStyle(
                          color: mainTextColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: UIConverter.getComponentHeight(context, 10),
                    ),
                    Image(
                      image: AssetImage("assets/images/home_page.png"),
                      width: double.infinity,
                      height: UIConverter.getComponentHeight(context, 246),
                    ),
                    const Text(
                      "Explore",
                      style: TextStyle(
                          color: mainTextColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: 15,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 4.0,
                              mainAxisSpacing: 4.0),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.only(
                                top: 10, left: 6, right: 6),
                            width: UIConverter.getComponentWidth(context, 190),
                            height:
                                UIConverter.getComponentHeight(context, 230),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 3,
                                      offset: Offset(0, 3),
                                      spreadRadius: 0.5)
                                ]),
                            child: Column(children: [
                              Container(
                                width:
                                    UIConverter.getComponentWidth(context, 190),
                                height: UIConverter.getComponentHeight(
                                    context, 126),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/mosquito.png'),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width:
                                    UIConverter.getComponentWidth(context, 176),
                                child: const Text("Aedes Aegypti Misquitos",
                                    style: TextStyle(
                                        color: cardTitleColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                    maxLines: 1),
                              ),
                              SizedBox(
                                height:
                                    UIConverter.getComponentHeight(context, 4),
                              ),
                              SizedBox(
                                width:
                                    UIConverter.getComponentWidth(context, 176),
                                child: const Text(
                                    "Aedes aegypti, the yellow fever mosquito that can spread ...",
                                    style: TextStyle(
                                        color: cardSubTitleColor,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500),
                                    maxLines: 1),
                              ),
                            ]),
                          ),
                          onTap: () {
                            print("Ddddddddddddddddddddfffffffffffff");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MosquitoesDetail(
                                          description: description,
                                          name: "Aedes Aegypt",
                                        )));
                          },
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          // PrimaryButton(
          //         text: "Start",
          //         backgroundColor: buttonColor,
          //         onPressed: () => {},
          //         height: UIConverter.getComponentHeight(context, 70),
          //         width: UIConverter.getComponentWidth(context, 180),
          //         fontFamily: "fontFamily",
          //         fontSize: 18,
          //         fontWeight: FontWeight.w500,
          //         textColor: mainTextColor,
          //         borderRadius: 47),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Positioned(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: FloatingActionButton(
                  
                  shape:
                      const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
                  onPressed: () => {},
                  // backgroundColor: buttonColor,
                  child: PrimaryButton(
                      text: "Start",
                      backgroundColor: buttonColor,
                      onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RecorderPage()),
                            )
                          },
                      height: UIConverter.getComponentHeight(context, 70),
                      width: UIConverter.getComponentWidth(context, 180),
                      fontFamily: "fontFamily",
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      textColor: mainTextColor,
                      borderRadius: 0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}