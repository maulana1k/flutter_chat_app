import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class FeedCard extends StatelessWidget {
  const FeedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade200, width: 0.5))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(
                    'https://berita.yodu.id/wp-content/uploads/2023/02/profil-onic-kayes.jpg'),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Felicia Angelique',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(' ∙ 4m', style: TextStyle(color: Colors.grey))
                      ],
                    ),
                    const Text(
                        'Ujan gini enaknya tidur Ujan gini enaknya tidur Ujan gini enaknya tidur Ujan gini enaknya tidur',
                        style: TextStyle(fontSize: 15)),
                    Row(
                      children: [
                        IconButton(
                            style: const ButtonStyle(visualDensity: VisualDensity.compact),
                            onPressed: () {},
                            icon: Icon(FluentIcons.heart_16_regular, color: Colors.grey.shade400)),
                        IconButton(
                            style: const ButtonStyle(visualDensity: VisualDensity.compact),
                            onPressed: () {},
                            icon: Icon(FluentIcons.arrow_reply_16_regular,
                                color: Colors.grey.shade400)),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
