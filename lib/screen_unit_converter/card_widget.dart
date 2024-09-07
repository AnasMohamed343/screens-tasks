import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  CardItem cardItem;
  CardWidget({required this.cardItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          //padding: const EdgeInsets.all(18),
          margin: EdgeInsets.symmetric(vertical: 3, horizontal: 12),
          height: 130,
          width: 100,
          decoration: BoxDecoration(
            border: Border.all(
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Image.asset(
                cardItem.imagePath,
                height: 50,
                width: 80,
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                cardItem.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardItem {
  String imagePath;
  String title;

  CardItem(this.imagePath, this.title);

  static List<CardItem> getCardsList() {
    return [
      CardItem('assets/images/unit_converter_icons/area.jpg', 'Area'),
      CardItem('assets/images/unit_converter_icons/currency.jpg', 'Currency'),
      CardItem('assets/images/unit_converter_icons/Date.jpg', 'Date'),
      CardItem('assets/images/unit_converter_icons/Mileage.jpg', 'Mileage'),
      CardItem('assets/images/unit_converter_icons/length.png', 'Length'),
      CardItem('assets/images/unit_converter_icons/power.png', 'Power'),
      CardItem('assets/images/unit_converter_icons/pressure.png', 'Pressure'),
      CardItem('assets/images/unit_converter_icons/speed.png', 'Speed'),
      CardItem(
          'assets/images/unit_converter_icons/Temperature.png', 'Temperature'),
      CardItem('assets/images/unit_converter_icons/time.png', 'Time'),
      CardItem('assets/images/unit_converter_icons/volume.png', 'Volume'),
      CardItem('assets/images/unit_converter_icons/weight.png', 'Weight'),
    ];
  }
}
