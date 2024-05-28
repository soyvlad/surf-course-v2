import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:palitra_app/assets/text_strings.dart';
import 'package:palitra_app/detaled_color_screen.dart';
import 'package:palitra_app/entity/color_entity.dart';
import 'package:palitra_app/utils/extensions/string_hex.dart';

// Виджет с основным контентом (Color gridview).
class ContentWidget extends StatelessWidget {
  final List<ColorEntity> data;
  const ContentWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.80,
          mainAxisSpacing: 40,
          crossAxisSpacing: 22),
      itemCount: data.length,
      itemBuilder: (_, i) => _ColorWidget(
        colorData: data[i],
      ),
    );
  }
}

// Ячейка с цветом
class _ColorWidget extends StatelessWidget {
  final ColorEntity colorData;

  const _ColorWidget({required this.colorData});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Center(
      child: GestureDetector(
        onTap: () => onTap(context),
        onLongPress: () => onLongPress(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox.square(
              dimension: 100,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: colorData.value.hexToColor(),
                ),
              ),
            ),
            Text(colorData.name, style: theme.bodySmall),
            Text(colorData.value, style: theme.bodySmall),
          ],
        ),
      ),
    );
  }

  void onTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => DetailedColorScreen(colorData: colorData)));
  }

  void onLongPress(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: colorData.value));
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text(AppTexts.copied),
    ));
  }
}
