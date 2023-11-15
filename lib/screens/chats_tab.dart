import 'package:chat_app/screens/chats_tile.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class ChatsTab extends StatelessWidget {
  const ChatsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            scrolledUnderElevation: 0,
            backgroundColor: Colors.white,
            title: Text('Chats',
                style: const TextStyle(fontWeight: FontWeight.bold).copyWith(fontSize: 28)),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(FluentIcons.search_20_filled)),
              IconButton(onPressed: () {}, icon: const Icon(FluentIcons.compose_20_filled)),
              IconButton(onPressed: () {}, icon: const Icon(FluentIcons.more_vertical_20_filled)),
            ],
          ),
        ];
      },
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    const Text('All chats', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(width: 8),
                    Badge(
                      backgroundColor: cs.primary,
                      label: const Text('14'),
                    )
                  ],
                ),
              ),
              const ChatsTile(),
              const ChatsTile(),
              const ChatsTile(),
            ],
          ),
        ),
      ),
    );
  }
}
