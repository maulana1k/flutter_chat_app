// import 'dart:ui';

import 'package:chat_app/screens/chat_room.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatsTile extends StatelessWidget {
  const ChatsTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cs = Theme.of(context).colorScheme;
    return InkWell(
      onTap: () {
        Navigator.push(context, CupertinoPageRoute(builder: (context) => const ChatRoom()));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 26,
              backgroundImage: NetworkImage('https://bit.ly/dan-abramov'),
            ),
            const SizedBox(width: 18),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Erick Ganteng',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16, color: cs.onBackground)),
                  Text(
                    'Lagi sibuk gak?',
                    style: TextStyle(fontSize: 15, color: cs.secondary),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Text('4h', style: TextStyle(color: cs.secondary, fontSize: 14)),
                Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(shape: BoxShape.circle, color: cs.primary),
                    child: const Text('1', style: TextStyle(color: Colors.white, fontSize: 12)))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
