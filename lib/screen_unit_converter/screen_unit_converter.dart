import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:screen_messenger/screen_unit_converter/card_widget.dart';

class ScreenUnitConverter extends StatelessWidget {
  ScreenUnitConverter({super.key});
  List<CardItem> cardList = CardItem.getCardsList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        //alignment: Alignment.bottomRight,
        children: [
          Positioned(
            top: -380,
            left: -170,
            right: 80,
            child: CircleAvatar(
              radius: 480,
              backgroundColor: Colors.purple,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 28, right: 28, top: 120, bottom: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Welcome',
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Dhipu Mathew',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (context, index) =>
                        CardWidget(cardItem: cardList[index]),
                    itemCount: cardList.length,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
