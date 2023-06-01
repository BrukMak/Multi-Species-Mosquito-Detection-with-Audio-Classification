import 'package:flutter/material.dart';
import 'package:mosdetector/features/mosqiuto/presentation/screens/mosqiuto_detail_page.dart';

import '../../../../core/shared_widgets/appBar.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/images.dart';
import '../../../../core/utils/ui_converter.dart';
// import '../widgets/recent_cards.dart';

class RecentPage extends StatefulWidget {
  const RecentPage({super.key});

  @override
  State<RecentPage> createState() => _RecentPageState();
}

class _RecentPageState extends State<RecentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CHSAppBar.build(context, 'Recent', () {}, true),
      body: SafeArea(
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, ind) {
              return GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0XFFF1F3FC),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.only(
                            top: 5,
                            bottom: 5,
                            left: UIConverter.getComponentWidth(context, 30),
                            right: UIConverter.getComponentWidth(context, 30)),
                        width: UIConverter.getComponentWidth(context, 370),
                        height: UIConverter.getComponentHeight(context, 108),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                              //           11:03 pm
                              // Wed , Apr 12, 2023
                              width:
                                  UIConverter.getComponentWidth(context, 110),
                              height:
                                  UIConverter.getComponentWidth(context, 88),
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                image: DecorationImage(
                                    image: NetworkImage(demo),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            SizedBox(
                              width: UIConverter.getComponentWidth(context, 8),
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Aedes Aegypti Mosquitoes",
                                  style: TextStyle(
                                      color: cardTitleColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  "11:03 pm",
                                  style: TextStyle(
                                      color: cardSubTitleColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "Wed , Apr 12, 2023",
                                  style: TextStyle(
                                      color: cardSubTitleColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        // onTap();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MosquitoesDetail())
                                );
                      })
                  //  RecentCard(
                  //   onTap: (){
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => MosquitoesDetail()));
                  // },)
                  ;
            }),
      ),
    );
  }
}
