import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/products.dart';

class basket extends StatelessWidget {
  const basket({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, products products, widget) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Toplam tutar: ""${products.totalPrice}" r"$"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 40),
              child: GridView.builder(
                itemCount: products.basket!.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 15 / 17.2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Container(
                    width: 157,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        "${products.basket![index]["image"]}",
                                      ),
                                      fit: BoxFit.cover))),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "${products.basket![index]["title"]}",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 7,
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "${products.basket![index]["description"]}",
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xff9095A6)),
                            )),
                        Row(
                          children: [
                            Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  r"$"
                                  "${products.basket![index]["price"]}",
                                  style: TextStyle(
                                      fontSize: 15, color: Color(0xff5B41FF)),
                                )),
                            SizedBox(
                              width: 74,
                            ),
                            IconButton(
                                highlightColor: Color(0xff5B41FF),
                                splashColor:
                                    Color(0xff5B41FF).withOpacity(0.2),
                                splashRadius: 20,
                                onPressed: () {
                                  
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "${products.basket![index]["title"]} ürünü sepetten çıkarıldı"),
                                          duration:
                                              Duration(milliseconds: 1500),
                                          action: SnackBarAction(
                                            label: "Tamam",
                                            onPressed: (() {}),
                                          )));
                                  products.deleteBasket(index);
                                  //print(products.product![index]);
                                },
                                icon: Container(
                                    child: Icon(
                                  Icons.remove,
                                  color: Color(0xff5B41FF),
                                  size: 25,
                                )))
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
