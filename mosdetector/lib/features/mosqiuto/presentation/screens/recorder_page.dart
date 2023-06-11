
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mosdetector/features/mosqiuto/presentation/screens/error_screen.dart';
import 'package:mosdetector/features/mosqiuto/presentation/screens/name_mapper.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/shared_widgets/appBar.dart';
import '../../../../core/shared_widgets/primary_button.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/ui_converter.dart';
import '../bloc/mosqiuto_bloc.dart';
import 'package:mosdetector/features/mosqiuto/presentation/screens/mosqiuto_detail_page.dart';
import 'package:record/record.dart';

class RecorderPage extends StatefulWidget {
  const RecorderPage({Key? key}) : super(key: key);

  @override
  State<RecorderPage> createState() => _RecorderPageState();
}

class _RecorderPageState extends State<RecorderPage> {
  final Record _recorder = Record();
  bool _isRecording = false;
  bool detectState = false;
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
      detectState = true;
    });

    return recordingFile;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MosqiutoBloc, MosqiutoState>(
      listener: (context, state) {
        
        if (state is MosquitoDetectedState &&
            state.mosquitoModel.name != "Mosquito Not Found") {

              print(state);
              print(state.mosquitoModel.name);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MosquitoesDetail(
                description: dict[state.mosquitoModel.name]!.description,
                name: state.mosquitoModel.name,
                url: dict[state.mosquitoModel.name]!.url,
              ),
            ),
          );
        } else if (state is MosquitoDetectedState &&
            state.mosquitoModel.name == "Mosquito Not Found") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ErrorScreen(
                appBarText: "Mosquito",
                message: "No matching Mosquito found",
              ),
            ),
          );
        } else if (state is MosquitoFailureState) {
         
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ErrorScreen(
                  appBarText: "Error Page",
                  message: "Error while detecting data"),
            ),
          );
        
        }
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
                if (detectState) (state is MosquitoLoadingState ) ? const CircularProgressIndicator(backgroundColor: Colors.red,) : PrimaryButton(
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
