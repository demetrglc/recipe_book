import 'dart:ui';

import 'package:cookbook/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/product_data.dart';

class ItemCard extends StatelessWidget {
  final Product product;

  const ItemCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 180,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.35),
            BlendMode.multiply,
          ),
          image: AssetImage(product.image.toString()),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Align(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                product.title.toString(),
                style: TextStyle(fontSize: 19, color: Colors.white),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            alignment: Alignment.center,
          ),
          Align(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        product.second.toString() + " dk",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                )
              ],
            ),
            alignment: Alignment.bottomLeft,
          )
        ],
      ),
    );

    // Padding(
    //     padding: const EdgeInsets.only(
    //       //Çerçevenin boyutunu ayarlıyor

    //       left: 1.0,
    //       right: 1.0,
    //     ),
    //     child: Card(
    //       shadowColor: Colors.black,
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(50.0), //burası ilee..
    //       ),
    //       elevation: 12.0,
    //       child: Column(children: [
    //         ClipRRect(
    //           borderRadius: BorderRadius.only(
    //             topLeft: Radius.circular(15.0), //
    //             topRight: Radius.circular(15.0), //
    //             //burası aynı olsunki alt bölüm görünmesin
    //           ),
    //           child: Container(
    //             color: Colors.white,
    //             child: Image.asset(
    //               product.image.toString(),
    //               height:
    //                   100.0, //Burası card lardaki textleri aynı hizaya koyuyor?
    //               width: 170.0,
    //               fit: BoxFit.fitWidth,
    //             ),
    //           ),
    //         ),
    //         Container(
    //           padding: EdgeInsets.all(10.0),
    //           width: 160.0,
    //           child: Column(
    //             children: [
    //               Center(
    //                 child: Text(product.title.toString(),
    //                     style: GoogleFonts.crimsonPro(
    //                         textStyle: TextStyle(
    //                             fontSize: 20, fontWeight: FontWeight.w500))),
    //               ),
    //               Row(
    //                 children: [
    //                   Padding(
    //                     padding: const EdgeInsets.only(left: 24),
    //                     child: Text('Detaylar için '),
    //                   ),
    //                   Icon(
    //                     (Icons.touch_app_sharp),
    //                     color: themeColor,
    //                   ),
    //                 ],
    //               )
    //             ],
    //           ),
    //         ),
    //       ]),
    //     ),
    //   );
  }
}
