import 'package:flutter/material.dart';

class products extends ChangeNotifier {
  bool tiklanma = false;
  List? product = [
    {
      "image":"https://productimages.hepsiburada.net/s/303/550/110000294674129.jpg",
      "title":"Apple Watch Se",
      "description":"Cellular 44MM Midnight Alüminyum Kasa",
      "price":700
    },
    {
      "image":"https://productimages.hepsiburada.net/s/298/1100/110000288245936.jpg",
      "title":"Apple Watch",
      "description":"Series 8 Gps + Cellular 45MM Midnight Aluminium Case",
      "price":899
    },
    {
      "image":"https://productimages.hepsiburada.net/s/128/1100/110000078217825.jpg",
      "title":"Apple Watch Nike Se",
      "description":"40MM Uzay Grisi Alüminyum Kasa ve Antrasit/siyah Nike Spor Kordon",
      "price":755
    },
    {
      "image":"https://productimages.hepsiburada.net/s/47/1100/10852098670642.jpg",
      "title":"Samsung Galaxy Fit2",
      "description":"40MM Uzay Grisi Alüminyum Kasa ve Antrasit/siyah ",
      "price":499
    },
    {
      "image":"https://productimages.hepsiburada.net/s/111/1100/110000057989950.jpg",
      "title":"Samsung Galaxy Watch 4",
      "description":"40MM Uzay Grisi Alüminyum Kasa ve Antrasit/siyah ",
      "price":599
    },
    {
      "image":"https://productimages.hepsiburada.net/s/273/1100/110000258157344.jpg",
      "title":"Samsung Galaxy Watch 5 ",
      "description":"40MM Uzay Grisi Alüminyum Kasa ve Antrasit/siyah ",
      "price":799
    },
  ];
  void tiklandi(){
    if (tiklanma == false) {
                                tiklanma = true;
                               // print(tiklanma);
                              } else {
                                tiklanma = false;
                               // print(tiklanma);
                              }
  }
}