import 'package:flutter/material.dart';

class PlayerBar extends StatelessWidget {
  const PlayerBar({super.key});

  final ColorFilter greyscale = const ColorFilter.matrix(<double>[
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
  ]);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 75,
      color: const Color.fromARGB(255, 34, 35, 51),
      child: Row(
        children: [
          Flexible(
            child: ListTile(
              leading: ColorFiltered(
                colorFilter: greyscale,
                child: const CircleAvatar(
                  backgroundImage: AssetImage('assets/hitbeat-icon.png'),
                  backgroundColor: Colors.transparent,
                ),
              ),
              title: const Text(
                'Song Title',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: const Text(
                'Artist Name',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
