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
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                scrolledUnderElevation: 0,
                backgroundColor: Colors.white,
                title: Text('Feeds',
                    style: const TextStyle(fontWeight: FontWeight.bold).copyWith(fontSize: 28)),
                actions: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(FluentIcons.more_vertical_20_filled)),
                ],
              ),
            ];
          },
          body: RefreshIndicator(
            onRefresh: () {
              return Future.delayed(const Duration(seconds: 1));
            },
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: StoryList(),
                ),
                // Divider(color: Colors.grey.shade100, thickness: 7),
                IntrinsicHeight(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: const Row(
                          children: [
                            Text('Recent updates', style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                      const FeedCard(),
                      const FeedCard(),
                      const FeedCard(),
                    ],
                  ),
                )
              ]),
            ),
          )),
      floatingActionButton: FloatingActionButton(
        elevation: 3,
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () {},
        child: const Icon(
          FluentIcons.edit_16_filled,
          color: Colors.white,
        ),
      ),
    );
  }
}
