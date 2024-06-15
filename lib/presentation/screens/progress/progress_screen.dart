import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProgressScreen extends StatelessWidget {
  static const name = 'progress_screen ';
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Indicaors'),
      ),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Center(
        child: Column(
      children: [
        SizedBox(height: 20),
        Text('Circular progress indicador'),
        SizedBox(height: 20),
        CircularProgressIndicator(
          strokeWidth: 4,
          strokeAlign: 1,
          backgroundColor: colors.primaryFixedDim,
          color: colors.primary,
        ),
        SizedBox(height: 20),
        SizedBox(height: 20),
        _ControlledProgressIndicator(),
      ],
    ));
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return StreamBuilder<double>(
        stream: Stream.periodic(Duration(seconds: 1), (value) {
          return (value * 2) / 100;
        }).takeWhile((value) => value <= 100),
        builder: (context, snapshot) {
          final double progressValue = snapshot.data ?? 0;
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    value: progressValue,
                    strokeWidth: 4,
                    strokeAlign: 1,
                    backgroundColor: colors.primaryFixedDim,
                    color: colors.primary,
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: LinearProgressIndicator(
                      value: progressValue,
                    ),
                  )
                ],
              ));
        });
  }
}
