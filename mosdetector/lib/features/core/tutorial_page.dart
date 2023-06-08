import 'package:flutter/material.dart';

import '../../core/shared_widgets/appBar.dart';
import '../../core/utils/ui_converter.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CHSAppBar.build(context, "Tutorials", (){}, false),
      body: Center(

        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                Text(
                  '1. Grant microphone permission: Once the app is installed, users will need to grant permission for the app to access their devices microphone. This is necessary for the app to detect mosquito sounds.',
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: 20),
                Text(
                  '2. Click on the ‘Start’ button.',
                  style: TextStyle(fontSize: 12),
                ),
                Container(
                  width: UIConverter.getComponentWidth(context, 327),
                  height: UIConverter.getComponentHeight(context, 212),

                  child: Image.asset('assets/images/start image.png'),
                ),
                SizedBox(height: 20),
                Text(
                  '3. Place the device near the suspected area: To detect the presence of a mosquito, users need to place their device near the area where they suspect mosquitoes are present. This could be a room or an outdoor area.',
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: 20),
                Text(
                  '4. Press the record button: The app will begin recording audio from the device’s microphone.',
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: 20),

                Container(
                  width: UIConverter.getComponentWidth(context, 327),
                  height: UIConverter.getComponentHeight(context, 212),

                  child: Image.asset('assets/images/record_image.png'),
                ),
                const SizedBox(height: 20),

                const Text(
                  '5. Initiate mosquito detection: Users can then start the mosquito detection process by pressing the "detect" button on the app. ',
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: 20),
              ],
            )
            ),
          ),
        )
        ,
      backgroundColor: Colors.white,
    );
  }
}