// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_sound/flutter_sound.dart';
// import 'package:mosdetector/features/mosqiuto/presentation/screens/mosqiuto_detail_page.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:path/path.dart' as path;
// import '../../../../core/shared_widgets/appBar.dart';
// import '../../../../core/shared_widgets/primary_button.dart';
// import '../../../../core/utils/colors.dart';
// import '../../../../core/utils/ui_converter.dart';
// import '../bloc/mosqiuto_bloc.dart';
// import 'package:record/record.dart';
// import 'dart:async';

// class RecorderPage extends StatefulWidget {
//   const RecorderPage({super.key});

//   @override
//   State<RecorderPage> createState() => _RecorderPageState();
// }

// class _RecorderPageState extends State<RecorderPage> {
//   // final recorder = FlutterSoundRecorder();
//   final recorder = Record();
//   bool isRecording = false;
//   bool isRecorderReady = false;
//   String finalAudioFile = "";
//   Timer? timer;
//   Duration duration = Duration.zero;

//   @override
//   void initState() {
//     super.initState();
//     initRecorder();
//   }

//   @override
//   void dispose() {
//     // recorder.closeRecorder();

//     super.dispose();
//   }

//   void startTimer() {
//     timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
//       setState(() {
//         duration += Duration(seconds: 1);
//       });
//     });
//     isRecording = true;
//   }

//   void stopTimer() {
//     timer?.cancel();
//     isRecording = false;
//   }

//   Future initRecorder() async {
//     final status = await Permission.microphone.request();
//     final storageStatus = await Permission.storage.request();

//     if (status != PermissionStatus.granted ||
//         storageStatus != PermissionStatus.granted) {
//       throw 'Microphone permission not granted';
//     }

//     // await recorder.openRecorder();

//     isRecorderReady = true;

//     // recorder.setSubscriptionDuration(const Duration(milliseconds: 500));
//   }

//   Future record() async {
//     startTimer();
//     // if (!isRecorderReady) return;
//     // await recorder.startRecorder(toFile: 'audio.wav', codec: Codec.pcm16WAV);
//     await recorder.start(
//         path: './audio.wav',
//         encoder: AudioEncoder.pcm16bit, // by default
//         bitRate: 1411200, // by default
//         samplingRate: 44100);
//   }

//   Future stop() async {
//     stopTimer();
//     var wavFilePath = await recorder.stop();
//     // if (!isRecorderReady) return;
//     // if (!isRecorderReady) return Future.value();

//     // final paths = await recorder.stopRecorder();
//     // print("path to recorded file >> : $paths");
//     // final audioFile = File(paths!);

//     // final appDir = await getApplicationDocumentsDirectory();
//     // final wavFilePath = path.join(appDir.path, '${DateTime.now()}audio.wav');

//     // if (!audioFile.existsSync()) {
//     //   throw 'Error: Recorded audio file does not exist';
//     // }

//     // await convertTo16BitWAV(paths, wavFilePath);
//     // audioFile.copySync(wavFilePath);

//     // print('Recorded audio copied to $wavFilePath');

//     return File(wavFilePath!);
//   }

//   // Future resume() async {
//   //   if (!isRecorderReady) {
//   //     return;
//   //   }

//   //   await recorder.resumeRecorder();
//   //   print("resume");
//   // }

//   // Future pause() async {
//   //   if (!isRecorderReady) {
//   //     return;
//   //   }
//   //   await recorder.pauseRecorder();
//   //   print("puased");
//   // }

//   bool something = false;

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<MosqiutoBloc, MosqiutoState>(
//       listener: (context, state) {
//         if (something) {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => MosquitoesDetail(
//                         description: description,
//                         name: "Aedes Aegypti Mosquitoes",
//                       )));
//         }

//         // TODO: implement listener
//       },
//       builder: (context, state) {
//         return Scaffold(
//           appBar: CHSAppBar.build(context, 'Detection', () {}, true),
//           body: Center(
//               child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 "Audio Recorder",
//                 style: TextStyle(
//                   color: cardTitleColor,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Text(
//                 '${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}',
//                 style:
//                     const TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   // IconButton(icon: Icon(recorder.isRecording ? Icons.pause : Icons.play_arrow, size: 40),
//                   // onPressed: () async {
//                   //   if (recorder.isRecording){
//                   //     print("is recording....................");
//                   //     await pause();
//                   //   } else if(recorder.isPaused) {
//                   //     print("is paused....................");
//                   //     await resume();
//                   //   }
//                   // },
//                   // ),

//                   ElevatedButton(
//                       child: Icon(
//                         isRecording ? Icons.stop : Icons.mic,
//                         size: 40,
//                       ),
//                       onPressed: () async {
//                         // if (recorder.){

//                         // }
//                         if (isRecording) {
//                           final audioFile = await stop();
//                           setState(() {
//                             finalAudioFile = audioFile.path;
//                           });

//                           print('Recorded audio again to $audioFile');
//                         } else {
//                           await record();
//                         }

//                         setState(() {});
//                       }),
//                 ],
//               ),
//               SizedBox(
//                 height: UIConverter.getComponentHeight(context, 80),
//               ),
//               PrimaryButton(
//                   text: "Detect",
//                   backgroundColor: buttonColor,
//                   onPressed: () {
//                     print("dddddddddddddddddddddd");
//                     print(finalAudioFile);
//                     setState(() {
//                       something = true;
//                     });
//                     BlocProvider.of<MosqiutoBloc>(context).add(
//                         MosquitoDetectMosquitoesEvent(audio: finalAudioFile));
//                   },
//                   height: UIConverter.getComponentHeight(context, 70),
//                   width: UIConverter.getComponentWidth(context, 180),
//                   fontFamily: "Urbanist",
//                   fontSize: 18,
//                   fontWeight: FontWeight.w500,
//                   textColor: mainTextColor,
//                   borderRadius: 12)
//             ],
//           )),
//         );
//       },
//     );
//   }
// }

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';

import '../../../../core/shared_widgets/appBar.dart';
import '../../../../core/shared_widgets/primary_button.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/ui_converter.dart';
import '../bloc/mosqiuto_bloc.dart';
import 'package:mosdetector/features/mosqiuto/presentation/screens/mosqiuto_detail_page.dart';

class RecorderPage extends StatefulWidget {
  const RecorderPage({Key? key}) : super(key: key);

  @override
  State<RecorderPage> createState() => _RecorderPageState();
}

class _RecorderPageState extends State<RecorderPage> {
  final Record _recorder = Record();
  bool _isRecording = false;
  bool _isRecorderReady = true;
  late String _finalAudioFile;
  Timer? _timer;
  Duration _duration = Duration.zero;

  @override
  void initState() {
    super.initState();
    initRecorder();
  }

  @override
  void dispose() {
    _recorder.stop();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        _duration += Duration(seconds: 1);
      });
    });
    _isRecording = true;
  }

  void stopTimer() {
    _timer?.cancel();
    _isRecording = false;
  }

  Future<void> initRecorder() async {
    final status = await Permission.microphone.request();
    final storageStatus = await Permission.storage.request();

    if (status != PermissionStatus.granted ||
        storageStatus != PermissionStatus.granted) {
      throw 'Microphone permission not granted';
    }

    // _isRecorderReady = await _recorder.hasPermissionToRecord();
    setState(() {});
  }

  Future<void> startRecording() async {
    if (!_isRecorderReady) return;
    final appDir = await getApplicationDocumentsDirectory();
    final wavFilePath = path.join(appDir.path, 'audio.wav');

    print("recording about to start");
    startTimer();
    await _recorder.start(
      path: wavFilePath,
      encoder: AudioEncoder.wav,
    );
  }

  Future<File> stopRecording() async {
    stopTimer();
    final recording = await _recorder.stop();
    print(recording);
    // final appDir = await getApplicationDocumentsDirectory();
    // final wavFilePath = path.join(appDir.path, '_audio.wav');
    final recordingFile = File(recording!);

    // await recordingFile.copy(wavFilePath);

    setState(() {
      _finalAudioFile = recording;
    });

    return recordingFile;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MosqiutoBloc, MosqiutoState>(
      listener: (context, state) {
        // if (state is MosquitoesDetectedState) {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => MosquitoesDetail(
        //         description: state.description,
        //         name: "Aedes Aegypti Mosquitoes",
        //       ),
        //     ),
        //   );
        // }
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
                const SizedBox(height: 20),
                Text(
                  '${_duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${_duration.inSeconds.remainder(60).toString().padLeft(2, '0')}',
                  style: const TextStyle(
                      fontSize: 80, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        if (_isRecording) {
                          final audioFile = await stopRecording();
                          print('Recorded audio saved to: ${audioFile.path}');
                        } else {
                          await startRecording();
                        }
                      },
                      child: Icon(
                        _isRecording ? Icons.stop : Icons.mic,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: UIConverter.getComponentHeight(context, 80)),
                PrimaryButton(
                  text: "Detect",
                  backgroundColor: buttonColor,
                  onPressed: () {
                    BlocProvider.of<MosqiutoBloc>(context).add(
                      MosquitoDetectMosquitoesEvent(audio: _finalAudioFile),
                    );
                  },
                  height: UIConverter.getComponentHeight(context, 70),
                  width: UIConverter.getComponentWidth(context, 180),
                  fontFamily: "Urbanist",
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  textColor: mainTextColor,
                  borderRadius: 12,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
