import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePictureItem extends StatelessWidget {
  double height, width;
  ProfilePictureItem({required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                image: AssetImage('assets/images/profile_pic.jpg'),
                fit: BoxFit.cover,
              )),
        ),
        CircleAvatar(
          radius: 11,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 8,
            backgroundColor: Colors.green,
          ),
        ),
      ],
    );
  }
}
