import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/timer_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TimerProvider(),
      child: MaterialApp(
        title: 'Timer App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: const TimerScreen(),
      ),
    );
  }
}

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade900,
              Colors.blue.shade500,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TimerDisplay(),
              const SizedBox(height: 40),
              const TimerControls(),
            ],
          ),
        ),
      ),
    );
  }
}

class TimerDisplay extends StatelessWidget {
  const TimerDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TimerProvider>(
      builder: (context, timer, child) {
        return Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            timer.formattedTime,
            style: const TextStyle(
              fontSize: 72,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'monospace',
            ),
          ),
        );
      },
    );
  }
}

class TimerControls extends StatelessWidget {
  const TimerControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TimerProvider>(
      builder: (context, timer, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton.large(
              onPressed: timer.reset,
              backgroundColor: Colors.white.withOpacity(0.3),
              child: const Icon(Icons.refresh, color: Colors.white),
            ),
            const SizedBox(width: 32),
            FloatingActionButton.large(
              onPressed: timer.isRunning ? timer.stop : timer.start,
              backgroundColor: Colors.white.withOpacity(0.3),
              child: Icon(
                timer.isRunning ? Icons.pause : Icons.play_arrow,
                color: Colors.white,
              ),
            ),
          ],
        );
      },
    );
  }
}
