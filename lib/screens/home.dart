import 'dart:developer';

import 'package:chat_app/screens/chats_tab.dart';
import 'package:chat_app/screens/contacts_tab.dart';
import 'package:chat_app/screens/feeds_tab.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  final List<Widget> pages = [const ChatsTab(), const FeedsTab(), const ContactsTab()];
  void onChangePage(index) {
    log(pageIndex.toString());
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final colorScheme = Theme.of(context).colorScheme;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        // statusBarColor: colorScheme.primary,
        // systemNavigationBarColor: const Color(0xfffafafa),
        ));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: pages.elementAt(pageIndex),
      bottomNavigationBar: Navbar(pageIndex: pageIndex, onChangePage: onChangePage),
    );
  }
}

class Navbar extends StatefulWidget {
  final int pageIndex;
  final Function(int) onChangePage;
  const Navbar({super.key, required this.pageIndex, required this.onChangePage});
  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    var cs = Theme.of(context).colorScheme;

    return Container(
      decoration:
          BoxDecoration(border: Border(top: BorderSide(color: Colors.grey.shade200, width: 0.5))),
      child: NavigationBar(
          onDestinationSelected: widget.onChangePage,
          selectedIndex: widget.pageIndex,
          backgroundColor: Colors.white,
          height: 50,
          elevation: 0,
          indicatorColor: Colors.transparent,
          animationDuration: const Duration(milliseconds: 0),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          destinations: [
            NavigationDestination(
                icon: const Icon(FluentIcons.chat_20_regular, size: 26),
                selectedIcon: Icon(FluentIcons.chat_20_filled, color: cs.primary, size: 26),
                label: 'Chats'),
            NavigationDestination(
                icon: const Icon(FluentIcons.shifts_activity_20_regular, size: 26),
                selectedIcon:
                    Icon(FluentIcons.shifts_activity_20_filled, color: cs.primary, size: 26),
                label: 'Chats'),
            NavigationDestination(
                icon: const Icon(FluentIcons.book_contacts_20_regular, size: 26),
                selectedIcon:
                    Icon(FluentIcons.book_contacts_20_filled, color: cs.primary, size: 26),
                label: 'Chats')
          ]),
    );
  }
}
