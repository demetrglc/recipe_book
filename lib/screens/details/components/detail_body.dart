import 'package:cookbook/constants.dart';
import 'package:cookbook/models/product_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  final Product product;

  Body({Key? key, required this.product}) : super(key: key);
  late double scrWidth;
  late double scrHeight;
  @override
  Widget build(BuildContext context) {
    scrHeight = MediaQuery.of(context).size.height;
    scrWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.amber,
            //kayıtlı renk
            Colors.amber,
          ],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Container(
                width: 100,
                height: 100,
                child: Image.asset('assets/images/chef2.png'),
              ),
            )
          ],
          backgroundColor: Colors.transparent,
          title: Text(product.title.toString()),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: (() => Navigator.pop(context)),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: (SafeArea(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: scrHeight * 0.1),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
              ),
              Positioned(
                top: scrHeight * 0.0,
                right: 0,
                left: 0,
                child: Column(
                  children: [
                    Container(
                      width: 400,
                      height: 250,
                      child: Image.asset(
                        product.image.toString(),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Color.fromARGB(52, 255, 255, 255),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.access_time, color: Colors.blue),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    product.second.toString() + ' dk',
                                    style: TextStyle(
                                      wordSpacing: 1.2,
                                      height: 1.5,
                                      fontSize: 15,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.room_service,
                                    color: Colors.amber,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(product.service.toString() + ' kişilik',
                                      style: TextStyle(
                                        wordSpacing: 1.2,
                                        height: 1.5,
                                        fontSize: 15,
                                      )),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.whatshot,
                                    color: Colors.red,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    ' kalori',
                                    style: TextStyle(
                                      wordSpacing: 1.2,
                                      height: 1.5,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    DividerMethod(),
                  ],
                ),
              ),
              Positioned.fill(
                top: scrHeight * 0.35,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(children: [
                    Text("Malzemeler",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: themeColor)),
                    Container(
                      child: textPadding(),
                    ),
                    Text("Yapılışı",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: themeColor)),
                    Container(
                      child: textPadding(),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  Padding textPadding() {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Color.fromARGB(79, 255, 153, 0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(product.description.toString(),
                    style: TextStyle(
                      wordSpacing: 1.2,
                      height: 1.5,
                      fontSize: 16,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DividerMethod extends StatelessWidget {
  const DividerMethod({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 0.3,
      color: Colors.black54,
    );
  }
}
