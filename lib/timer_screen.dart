import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'timer_provider.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stopwatch'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<TimerProvider>(
              builder: (context, timer, child) {
                return Text(
                  timer.formattedTime,
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<TimerProvider>(
                  builder: (context, timer, child) {
                    return ElevatedButton(
                      onPressed: timer.isRunning ? timer.stop : timer.start,
                      child: Text(timer.isRunning ? 'Stop' : 'Start'),
                    );
                  },
                ),
                const SizedBox(width: 20),
                Consumer<TimerProvider>(
                  builder: (context, timer, child) {
                    return ElevatedButton(
                      onPressed: timer.reset,
                      child: const Text('Reset'),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
} 