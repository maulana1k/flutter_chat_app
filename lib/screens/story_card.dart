import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  final bool isOpen;
  const StoryCard({super.key, this.isOpen = false});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 12),
      child: IntrinsicHeight(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  gradient: isOpen
                      ? null
                      : LinearGradient(
                          begin: Alignment.bottomLeft, colors: [cs.primary, cs.primary]),
                  borderRadius: BorderRadius.circular(50)),
              child: GestureDetector(
                onTapUp: (TapUpDetails details) {},
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.white, width: 3),
                  ),
                  child: const CircleAvatar(
                      radius: 32,
                      backgroundImage: NetworkImage(
                          'https://berita.yodu.id/wp-content/uploads/2023/02/profil-onic-kayes.jpg')),
                ),
              ),
            ),
            const SizedBox(height: 6),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Felicia Angelique',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 13),
              ),
            )
          ],
        ),
      ),
    );
  }
}
