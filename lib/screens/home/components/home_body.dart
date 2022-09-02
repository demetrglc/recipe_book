import 'package:cookbook/constants.dart';
import 'package:cookbook/models/products.dart';
import 'package:cookbook/models/product_data.dart';
import 'package:cookbook/screens/details/details_screen.dart';
import 'package:cookbook/search/searh_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'item_card.dart';

List<Product> allItems = [];

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with TickerProviderStateMixin {
  ScrollController _scrollController = ScrollController();
  int _currentMax = 10;
  List<Product> product = [];
  late TabController _tabController;
  int selectBtn = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _getInitialList();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print("over scrooll");
        _getMoreList();
      }
    });
  }

  _getInitialList() {
    print("Get more list");

    for (int i = 0; i < 10; i++) {
      product.add(products2[i]);
    }

    if (mounted) {
      // default: true dur. Ekran oluşturulduysa(build) false durumundadır *ekran çizilirken. Yeniden birşeyler çizmek istediğimizde hata verir bunun için set state ile yazarız. Screenshot alındı kadın dostu.
      setState(() {});
    }
  }

  _getMoreList() {
    if (_tabController.index == 1) {
      print("Get more list");
      for (int i = _currentMax; i < _currentMax + 10; i++) {
        if (i >= products1.length) return;
        product.add(products2[i]);
      }
      _currentMax = _currentMax + 10;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(75),
          child: AppBar(
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(),
                      child: GestureDetector(
                          child: Icon(
                            Icons.search,
                            color: Color.fromARGB(255, 255, 255, 255),
                            size: 32,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => SearchPage())));
                          }),
                    ),
                  ),
                ),
              ],
              elevation: 0,
              title: Padding(
                padding: const EdgeInsets.only(top: 17, left: 5),
                child: Text(
                  'Lezzetlerimiz...',
                  style:
                      GoogleFonts.lobster(textStyle: TextStyle(fontSize: 38)),
                ),
              ),
              backgroundColor: themeColor),
        ),
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Container(
                width: 370,
                child: Text(
                  "Top 5",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    topScrollCard(
                      myProduct: products1[0],
                    ),
                    topScrollCard(
                      myProduct: products2[1],
                    ),
                    topScrollCard(
                      myProduct: products4[0],
                    ),
                    topScrollCard(
                      myProduct: products1[0],
                    ),
                  ],
                ),
              ),
            ),

            // SizedBox(
            //   height: 50,
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            //   child: Text(
            //     "Gaziantep Mutfağı",
            //     style: kBigTitleTextStyle,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: SizedBox(
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(24)),
                    child: TabBar(
                        indicator: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 255, 255, 255)),
                            color: themeColor,
                            borderRadius: BorderRadius.circular(20)),
                        indicatorWeight: 4,
                        indicatorColor: themeColor,
                        isScrollable: true,
                        unselectedLabelColor: Color.fromARGB(255, 0, 0, 0),
                        labelColor: Color.fromARGB(255, 255, 255, 255),
                        controller: _tabController,
                        //-----------
                        tabs: <Widget>[
                          tab('Tepsi Yemekleri'),
                          tab('Kazan Yemekleri'),
                          tab('Tatlılar'),
                          tab('Çorbalar'),
                        ]),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: TabBarView(controller: _tabController, children: [
              Cook(),
              Cook(),
              Cook(),
              Cook(),
            ])),
          ],
        ),
      ),
    );
  }
  //****************************************/

  Tab tab(String isim) {
    return Tab(
      child: Text(
        isim.toString(),
        style: GoogleFonts.oswald(textStyle: TextStyle(fontSize: 17)),
      ),
    );
  }

  Widget Cook() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
            controller: _scrollController,
            itemCount: product.length, //26 ağustos hatası çözüldü
            itemBuilder: (context, index) {
              if (index == product.length) {
                return CupertinoActivityIndicator();
              }
              return GestureDetector(
                onTap: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              DetailsScreen(product: product[index]))));
                }),
                child: ItemCard(
                  product: product[index],
                ),
              );
            }),
      ),
    );
  }
}

class topScrollCard extends StatefulWidget {
  const topScrollCard({Key? key, required this.myProduct}) : super(key: key);
  final Product myProduct;
  @override
  State<topScrollCard> createState() => _topScrollCardState();
}

class _topScrollCardState extends State<topScrollCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 236, 199, 199)),
          height: 125,
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                    child: Column(
                  children: [
                    Text(
                      'Family place',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color.fromARGB(255, 43, 40, 40),
                      ),
                    ),
                    Text(
                      "Bon a potiet",
                      style: TextStyle(
                          fontSize: 15, color: Color.fromARGB(255, 93, 92, 92)),
                    ),
                    Icon(Icons.room_service),
                    Text("30-40 service"),
                  ],
                )),
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                child: Image.asset(
                  widget.myProduct.image ?? "assets/images/baklava2.jpg",
                  height: 125.0,
                  width: 125.0,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
