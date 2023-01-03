import 'package:flutter/material.dart';

class Constants extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPress;
  const Constants(
      {Key? key,
      required this.title,
      this.color = Colors.grey,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
