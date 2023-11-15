import 'package:chat_app/screens/feed_card.dart';
import 'package:chat_app/screens/story_list.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class FeedsTab extends StatefulWidget {
  const FeedsTab({super.key});

  @override
  State<FeedsTab> createState() => _FeedsTabState();
}

class _FeedsTabState extends State<FeedsTab> {
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
              title: Text('Activity',
                  style: const TextStyle(fontWeight: FontWeight.bold).copyWith(fontSize: 28)),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(FluentIcons.more_vertical_20_filled)),
              ],
            ),
          ];
        },
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: StoryList(),
            ),
            Divider(color: Colors.grey.shade100, thickness: 7),
            const IntrinsicHeight(
              child: Column(
                children: [
                  FeedCard(),
                  FeedCard(),
                  FeedCard(),
                ],
              ),
            )
          ]),
        ));
  }
}
