import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:mosdetector/features/mosqiuto/presentation/screens/mosqiuto_detail_page.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/shared_widgets/appBar.dart';
import '../../../../core/shared_widgets/primary_button.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/ui_converter.dart';
import '../bloc/mosqiuto_bloc.dart';

class RecorderPage extends StatefulWidget {
  const RecorderPage({super.key});

  @override
  State<RecorderPage> createState() => _RecorderPageState();
}

class _RecorderPageState extends State<RecorderPage> {
  final recorder = FlutterSoundRecorder();
  bool isRecorderReady = false;
  String finalAudioFile = "";

  @override
  void initState() {
    super.initState();
    initRecorder();
  }

  @override
  void dispose() {
    recorder.closeRecorder();

    super.dispose();
  }

  Future initRecorder() async {
    final status = await Permission.microphone.request();

    if (status != PermissionStatus.granted) {
      throw 'Microphone permission not granted';
    }

    await recorder.openRecorder();

    isRecorderReady = true;

    recorder.setSubscriptionDuration(const Duration(milliseconds: 500));
  }

  Future record() async {
    if (!isRecorderReady) return;
    await recorder.startRecorder(toFile: 'audio', codec: Codec.defaultCodec);
  }

  Future stop() async {
    if (!isRecorderReady) return;

    final path = await recorder.stopRecorder();
    final audioFile = File(path);
    print('Recorded audio to $audioFile');

    return audioFile;
  }

  Future resume() async {
    if (!isRecorderReady) {
      return;
    }

    await recorder.resumeRecorder();
    print("resume");
  }

  Future pause() async {
    if (!isRecorderReady) {
      return;
    }
    await recorder.pauseRecorder();
    print("puased");
  }
  bool something = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MosqiutoBloc, MosqiutoState>(
      listener: (context, state) {
        if (something){
          Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MosquitoesDetail(description: description, name: "Aedes Aegypti Mosquitoes",)));
        }
        
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CHSAppBar.build(context, 'Detection', () {}, true),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Audio Recorder",
                style: TextStyle(
                  color: cardTitleColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder(
                  stream: recorder.onProgress,
                  builder: (context, snapshot) {
                    final duration = snapshot.hasData
                        ? snapshot.data!.duration
                        : Duration.zero;
                    String twoDigits(int n) => n.toString().padLeft(2, '0');

                    final twoDigitMinutes =
                        twoDigits(duration.inMinutes.remainder(60));
                    final twoDigitSeconds =
                        twoDigits(duration.inSeconds.remainder(60));
                    return Text(
                      '$twoDigitMinutes:$twoDigitSeconds',
                      style: const TextStyle(
                          fontSize: 80, fontWeight: FontWeight.bold),
                    );
                  }),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // IconButton(icon: Icon(recorder.isRecording ? Icons.pause : Icons.play_arrow, size: 40),
                  // onPressed: () async {
                  //   if (recorder.isRecording){
                  //     print("is recording....................");
                  //     await pause();
                  //   } else if(recorder.isPaused) {
                  //     print("is paused....................");
                  //     await resume();
                  //   }
                  // },
                  // ),

                  ElevatedButton(
                      child: Icon(
                        recorder.isRecording ? Icons.stop : Icons.mic,
                        size: 40,
                      ),
                      onPressed: () async {
                        // if (recorder.){

                        // }
                        if (recorder.isRecording) {
                          final audioFile = await stop();
                          setState(() {
                            finalAudioFile = audioFile.path;
                          });
                          
                          print('Recorded audio again to $audioFile');
                        } else {
                          await record();
                        }

                        setState(() {});
                      }),
                ],
              ),
              SizedBox(
                height: UIConverter.getComponentHeight(context, 80),
              ),
              PrimaryButton(
                  text: "Detect",
                  backgroundColor: buttonColor,
                  onPressed: () {
                    print("dddddddddddddddddddddd");
                    print(finalAudioFile);
                    setState(() {
                      something = true;
                    });
                    // BlocProvider.of<MosqiutoBloc>(context)
                    //     .add(MosquitoDetectMosquitoesEvent(audio: finalAudioFile));
                  },
                  height: UIConverter.getComponentHeight(context, 70),
                  width: UIConverter.getComponentWidth(context, 180),
                  fontFamily: "Urbanist",
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  textColor: mainTextColor,
                  borderRadius: 12)
            ],
          )),
        );
      },
    );
  }
}
