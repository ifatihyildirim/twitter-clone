import 'package:flutter/cupertino.dart';
import 'package:twitter/theme/pallete.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final Color textColor = Pallete.backgroundColor;
  final Color backgroundColor = Pallete.whiteColor;

  const RoundedButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: backgroundColor,
      onPressed: onPressed,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      borderRadius: BorderRadius.circular(30),
      child: Text(
        label,
        style: TextStyle(color: textColor, fontSize: 16),
      ),
    );
  }
}
