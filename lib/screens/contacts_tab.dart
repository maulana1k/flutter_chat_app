import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class ContactsTab extends StatefulWidget {
  const ContactsTab({super.key});

  @override
  State<ContactsTab> createState() => _ContactsTabState();
}

class _ContactsTabState extends State<ContactsTab> {
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
                title: Text('Contacts',
                    style: const TextStyle(fontWeight: FontWeight.bold).copyWith(fontSize: 28)),
                actions: [
                  IconButton(onPressed: () {}, icon: const Icon(FluentIcons.add_16_regular)),
                ],
                bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(kToolbarHeight - 10),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                          color: Colors.grey[100], borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(FluentIcons.search_16_regular, color: Colors.grey[500], size: 20),
                          const SizedBox(width: 4),
                          Text('Search', style: TextStyle(color: Colors.grey[500], fontSize: 16))
                        ],
                      ),
                    ))),
          ];
        },
        body: const SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            SizedBox(height: 16),
            ContactList(),
            ContactList(),
            ContactList(),
          ]),
        ));
  }
}

class ContactList extends StatelessWidget {
  const ContactList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      onTap: () {},
      leading: const CircleAvatar(radius: 26),
      title: const Text('Felicia Angelique', style: TextStyle(fontSize: 18)),
      subtitle: const Text('Felicia Angelique'),
    );
  }
}
