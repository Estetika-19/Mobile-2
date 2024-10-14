import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(const StopwatchApp());

class StopwatchApp extends StatefulWidget {
  const StopwatchApp({super.key});

  @override
  State<StopwatchApp> createState() => _StopwatchAppState();
}

class _StopwatchAppState extends State<StopwatchApp> {
  final StopwatchTimer _stopwatchTimer = StopwatchTimer();

  @override
  void initState() {
    super.initState();
    _stopwatchTimer.startStream();
  }

  @override
  void dispose() {
    _stopwatchTimer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stopwatch'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: StreamBuilder<String>(
                stream: _stopwatchTimer.timeStream,
                initialData: "00:00:00",
                builder: (context, snapshot) {
                  return Text(
                    snapshot.data!,
                    style: const TextStyle(
                        fontSize: 48, fontWeight: FontWeight.bold),
                  );
                },
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _stopwatchTimer.toggle();
                    });
                  },
                  child: Text(_stopwatchTimer.isRunning ? 'Stop' : 'Start'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _stopwatchTimer.reset();
                    });
                  },
                  child: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StopwatchTimer {
  final Stopwatch _stopwatch = Stopwatch();
  late Timer _timer;
  bool isRunning = false;
  final StreamController<String> _timeController = StreamController<String>();

  // Accessor for the time stream
  Stream<String> get timeStream => _timeController.stream;

  // Start or stop the stopwatch
  void toggle() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
      _timer.cancel();
      isRunning = false;
    } else {
      _stopwatch.start();
      isRunning = true;
      _startTimer();
    }
  }

  // Reset the stopwatch
  void reset() {
    _stopwatch.reset();
    _timeController.sink.add("00:00:00");
  }

  // Timer to periodically update the formatted time every second
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _timeController.sink.add(_formatTime(_stopwatch.elapsed));
    });
  }

  // Format time in HH:MM:SS
  String _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String hours = twoDigits(duration.inHours.remainder(60));
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }

  // Start the time stream when the app initializes
  void startStream() {
    _timeController.sink.add("00:00:00");
  }

  // Dispose the stream controller when no longer needed
  void dispose() {
    _timeController.close();
  }
}
