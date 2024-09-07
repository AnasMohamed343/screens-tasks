import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:screen_messenger/chat_item.dart';
import 'package:screen_messenger/profile_picture_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.black12,
            radius: 23,
            child: Icon(
              Icons.list,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.black12,
              radius: 23,
              child: Icon(
                Icons.edit,
                color: Colors.black,
              ),
            ),
          ),
        ],
        title: Text(
          'Chats',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
            child: TextField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                        color: Colors.black12,
                        width: 0,
                        style: BorderStyle.none),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                        color: Colors.black12,
                        width: 0,
                        style: BorderStyle.none),
                  ),
                  hintText: 'search',
                  hintStyle: TextStyle(color: Colors.black38),
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: Colors.black38,
                  fillColor: Colors.black12,
                  filled: true,
                  border: InputBorder.none),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: SizedBox(
              height: 100,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Column(
                        children: [
                          ProfilePictureItem(
                            height: 70,
                            width: 75,
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            'Anas',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          )
                        ],
                      ),
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 15,
                    );
                  },
                  itemCount: 20),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => Column(
                      children: [
                        ChatItem(),
                      ],
                    ),
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 8,
                  );
                },
                itemCount: 20),
          ),
        ],
      ),
    );
  }
}
