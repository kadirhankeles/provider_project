import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/basket.dart';
import 'package:provider_project/products.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //bool tiklanma = false;
    List<String> kategori = [
      "Smart Watch",
      "Apple",
      "Samsung",
    ];
    return MultiProvider(
      builder: (context, child) {
        return MaterialApp(
          title: 'Material App',
          home: Consumer(
            builder: (context, products products, widget) {
              return Scaffold(
                  body: SingleChildScrollView(
                    child: Padding(
                                  padding: const EdgeInsets.only(left: 18, right: 18, top: 40),
                                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 60,
                        width: double.infinity,
                        //color: Colors.blue,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("assets/Menu.png"),
                            SizedBox(
                              width: 25,
                            ),
                            Container(
                              height: 40,
                              width: 250,
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    hintText: "Search Prodcut",
                                    hintStyle: TextStyle(fontSize: 13),
                                    prefixIcon: Icon(
                                      Icons.search,
                                      size: 20,
                                    )),
                              ),
                            ),
                            SizedBox(width: 9,),
                            IconButton(
                              splashRadius: 20,
                              onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => basket(),));
                            }, icon: Image(image: AssetImage("assets/basket.png"),height: 20,))
                          ],
                        ),
                      ),
                      Text(
                        "Find your suitable \nwatch now.",
                        style:
                            TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 400,
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: kategori.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                products.tiklandi(index);
                              },
                              child: Container(
                                width: 96,
                                height: 25,
                                child: Center(
                                    child: Text(
                                  "${kategori[index]}",
                                  style: TextStyle(
                                      color: products.tiklanma[index] == true
                                          ? Color(0xff5B41FF)
                                          : Color(0xff9095A6)),
                                )),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        height: 700,
                        width: double.infinity,
                        child: GridView.builder(
                          itemCount: products.product!.length,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 15 / 17.2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                              crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return Container(
                              width: 157,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 1),
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
                                            borderRadius:
                                                BorderRadius.circular(60),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  "${products.product![index]["image"]}",
                                                ),
                                                fit: BoxFit.cover))),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "${products.product![index]["title"]}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "${products.product![index]["description"]}",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xff9095A6)),
                                      )),
                                  Row(
                                    children: [
                                      Container(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text(
                                            r"$"
                                            "${products.product![index]["price"]}",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Color(0xff5B41FF)),
                                          )),
                                          SizedBox(width: 74,),
                                    IconButton(
                                      highlightColor:Color(0xff5B41FF), 
                                      splashColor:Color(0xff5B41FF).withOpacity(0.2),
                                      splashRadius: 20,
                                      onPressed: () {
                                      products.addBasket(products.product![index], context);
                      
                      
                                      //print(products.product![index]);
                                    }, icon: Container(child: Icon(Icons.add,color: Color(0xff5B41FF),size: 25,)))
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                                  ),
                                ),
                  ),
                 
                  );
            },
          ),
        );
      },
      providers: [
        ChangeNotifierProvider(
          create: (context) => products(),
        )
      ],
    );
  }
}
