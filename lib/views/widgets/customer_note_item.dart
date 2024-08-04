import 'package:flutter/material.dart';

class CustomerNoteItem extends StatelessWidget {
  const CustomerNoteItem({
    super.key,
    required this.colorNoteItem,
    required this.titleNoteItem,
    required this.subtitleNoteItem,
    required this.timeNoteItem,
  });

  final Color colorNoteItem;
  final String titleNoteItem, subtitleNoteItem, timeNoteItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12, left: 8),
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: colorNoteItem,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Text(
              titleNoteItem,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                subtitleNoteItem,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete,
                size: 28,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            child: Text(
              timeNoteItem,
              style: TextStyle(
                fontSize: 12,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
