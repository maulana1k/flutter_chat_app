import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration:
            BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(20)),
        child: const Row(
          children: [
            Iconify(Bx.search, size: 20, color: Colors.grey),
            Expanded(
              child: TextField(
                  decoration: InputDecoration(
                isCollapsed: true,
                hintText: 'Search messages',
                isDense: true,
                border: InputBorder.none,
                hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 12),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
