import 'package:flutter/material.dart';
import 'package:screen_messenger/profile_picture_item.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: ProfilePictureItem(
            height: 58,
            width: 59,
          ),
        ),
        Column(
          children: [
            Text(
              'Anas Mohamed',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            SizedBox(
              height: 7,
            ),
            Row(
              children: [
                Text(
                  'Me: .......',
                  style: TextStyle(color: Colors.black54, fontSize: 13),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '8 Oct',
                  style: TextStyle(color: Colors.black54, fontSize: 13),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
