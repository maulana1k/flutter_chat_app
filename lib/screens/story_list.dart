import 'package:chat_app/screens/story_card.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class StoryList extends StatelessWidget {
  const StoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(width: 16),
        Container(
          margin: const EdgeInsets.only(right: 12, top: 4),
          child: Stack(
            children: [
              const CircleAvatar(radius: 32),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(FluentIcons.add_16_filled, size: 16, color: Colors.white)),
                ),
              )
            ],
          ),
        ),
        const StoryCard(),
        const StoryCard(),
        const StoryCard(),
        const StoryCard(),
        const StoryCard(),
        const StoryCard(),
      ]),
    );
  }
}
