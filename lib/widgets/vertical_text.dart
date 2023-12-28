import 'package:flutter/material.dart';
import 'package:my_fave_app/utils/vertical_rotate.dart';

class VerticalText extends StatelessWidget {
  const VerticalText(
    this.text, {
    super.key,
    this.style,
    this.space = 12,
  });

  final String text;
  final TextStyle? style;
  final double space;

  @override
  Widget build(BuildContext context) {
    final splitText = text.split('\n');
    return Row(
      textDirection: TextDirection.rtl,
      children: [
        for (final s in splitText) _textBox(s.runes),
      ],
    );
  }

  Widget _textBox(Runes runes) {
    return Wrap(
      textDirection: TextDirection.rtl,
      direction: Axis.vertical,
      children: [
        for (final rune in runes)
          Row(
            children: [
              SizedBox(width: space),
              _character(String.fromCharCode(rune)),
            ],
          ),
      ],
    );
  }

  Widget _character(String char) {
    if (VerticalRotated.map[char] != null) {
      return Text(VerticalRotated.map[char]!, style: style);
    } else {
      return Text(char, style: style);
    }
  }
}
