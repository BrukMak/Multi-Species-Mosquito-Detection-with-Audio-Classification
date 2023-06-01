import 'package:flutter/material.dart';
import 'package:mosdetector/core/utils/images.dart';
import 'package:mosdetector/core/utils/ui_converter.dart';

import '../../../../core/shared_widgets/appBar.dart';
import '../../../../core/utils/colors.dart';

class MosquitoesDetail extends StatefulWidget {
  MosquitoesDetail({super.key});

  @override
  State<MosquitoesDetail> createState() => _MosquitoesDetailState();
}

class _MosquitoesDetailState extends State<MosquitoesDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CHSAppBar.build(context, 'Aedes Aegypti', () {
        Navigator.pop(context);
      }, false),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: const NetworkImage(demo),
              width: double.infinity,
              height: UIConverter.getComponentHeight(context, 266),
            ),
            SizedBox(
              height: UIConverter.getComponentHeight(context, 23),
            ),
            Padding(
              padding: EdgeInsets.only(left: UIConverter.getComponentWidth(context, 41), right: UIConverter.getComponentWidth(context, 41), bottom: UIConverter.getComponentHeight(context, 13), top: UIConverter.getComponentHeight(context, 13)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
            
              const Text(
                "Aedes Aegypti Mosquitoes",

                style: TextStyle(
                    color: cardTitleColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: UIConverter.getComponentHeight(context, 13),),
               const Text(
                "Celebrity status” isn’t generally something bestowed upon an insect. And yet one mosquito, Aedes aegypti, has been a part of the Zika headlines almost daily for much of the last year, garnering nearly as much attention from the press as the presidential candidates during this election year.",
                  style: TextStyle(
                      color: cardSubTitleColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  ),
               const SizedBox(height: 10,),
               const Text(
                "No other mosquito species has had such a dramatic impact on human history. Also known as the Yellow Fever Mosquito, Aedes aegypti was the first mosquito implicated as a vector of human disease. Experiments in the 1880’s by Cuban physician, Carlos Finlay, demonstrated that when one of these mosquitoes took a blood meal from a patient with Yellow Fever, it could transmit the disease to a healthy person just a couple days later during a subsequent bite. Initially, few people – including members of the scientific community – took the idea seriously, finding it hard to believe that such a small insect could kill a full grown person. It took a couple of decades and many additional experiments to finally prove Finlay’s theory.",
                  style: TextStyle(
                      color: cardSubTitleColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  ),
              const SizedBox(height: 10,),

              const Text(
                "Today, many mosquito species have demonstrated the ability to be competent vectors of a variety of mosquito-borne diseases affecting not only humans but also many other animals. Aedes aegypti not only carries Yellow Fever, but is also a vector of West Nile virus, chikungunya, dengue, and more recently making the news as the primary vector of the Zika virus. While a vaccine exists now to protect us from Yellow Fever, vaccines for the other diseases are still under development and keeping a close eye on the Aedes aegypti species remains a top priority in many Integrated Mosquito Management (IMM) programs.",
                  style: TextStyle(
                      color: cardSubTitleColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
