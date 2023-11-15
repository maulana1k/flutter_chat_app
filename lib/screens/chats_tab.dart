import 'package:chat_app/screens/chats_tile.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class ChatsTab extends StatelessWidget {
  const ChatsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            scrolledUnderElevation: 0,
            backgroundColor: Colors.white,
            title: Text('Chats',
                style: const TextStyle(fontWeight: FontWeight.bold).copyWith(fontSize: 32)),
            actions: [
              IconButton(
                  onPressed: () {}, iconSize: 28, icon: const Icon(FluentIcons.compose_20_filled)),
            ],
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight - 10),
                child: Container(
                  padding: const EdgeInsets.all(6),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(FluentIcons.search_16_filled, color: Colors.grey[500], size: 22),
                      const SizedBox(width: 4),
                      Text('Search', style: TextStyle(color: Colors.grey[500], fontSize: 18))
                    ],
                  ),
                )),
          ),
        ];
      },
      body: const SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              ChatsTile(),
              ChatsTile(),
              ChatsTile(),
            ],
          ),
        ),
      ),
    );
  }
}
