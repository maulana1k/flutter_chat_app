import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class FeedCard extends StatelessWidget {
  const FeedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: const Key('1'),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).colorScheme.primary,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(FluentIcons.arrow_reply_20_filled, color: Colors.white),
                Text('Reply', style: TextStyle(color: Colors.white)),
              ],
            ),
          ],
        ),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          return false;
        } else if (direction == DismissDirection.endToStart) {
          return false;
        }
        return null;
      },
      resizeDuration: const Duration(milliseconds: 100),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade200, width: 0.5))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      'https://berita.yodu.id/wp-content/uploads/2023/02/profil-onic-kayes.jpg'),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Felicia Angelique',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(' ∙ 4m', style: TextStyle(color: Colors.grey))
                        ],
                      ),
                      Text(
                          'Ujan gini enaknya tidur Ujan gini enaknya tidur Ujan gini enaknya tidur Ujan gini enaknya tidur',
                          style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                IconButton(
                    style: const ButtonStyle(visualDensity: VisualDensity.compact),
                    onPressed: () {},
                    icon:
                        Icon(FluentIcons.heart_16_regular, color: Colors.grey.shade400, size: 20)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
