import 'package:flutter/material.dart';
import 'package:mosdetector/core/utils/images.dart';
import 'package:mosdetector/core/utils/ui_converter.dart';

import '../../../../core/shared_widgets/appBar.dart';
import '../../../../core/utils/colors.dart';

class MosquitoesDetail extends StatefulWidget {
  String name;
  String description;
  String url;
  MosquitoesDetail({super.key, required this.description, required this.name, required this.url});

  @override
  State<MosquitoesDetail> createState() => _MosquitoesDetailState();
}

class _MosquitoesDetailState extends State<MosquitoesDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CHSAppBar.build(context, widget.name, () {}, true),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image:  AssetImage(widget.url),
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
            
    
              SizedBox(height: UIConverter.getComponentHeight(context, 13),),
               Text(widget.description,
                  style: const TextStyle(
                      color: cardSubTitleColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  ),
               const SizedBox(height: 10,),
            
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
