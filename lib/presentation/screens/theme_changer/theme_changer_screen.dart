import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const String name = 'theme_changer';
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode = ref.watch(isDarkModeProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Theme changer'),
          actions: [
            IconButton(
              // icon: const Icon(Icons.light_mode),
              icon: Icon(
                  isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode),
              onPressed: () {
                ref.read(isDarkModeProvider.notifier).state = !isDarkMode;
              },
            ),
          ],
        ),
        body: _ThemChangerView());
  }
}

class _ThemChangerView extends ConsumerWidget {
  const _ThemChangerView();

  @override
  Widget build(BuildContext context, ref) {
    final List<Color> colors = ref.watch(colorListProvider);

    final int selectedColor = ref.watch(selectedColorProvider);

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colors[index];
        return RadioListTile(
          title: Text(
            'Este color',
            style: TextStyle(color: color),
          ),
          subtitle: Text('#${color.value.toRadixString(16)}'),
          activeColor: color,
          value: index,
          groupValue: selectedColor,
          onChanged: (value) {
            ref.read(selectedColorProvider.notifier).state = index;
          },
        );
      },
    );
  }
}
