// import 'package:cookbook/models/product_data.dart';
// import 'package:flutter/material.dart';
// import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

// class LazyLoadPage extends StatefulWidget {
//   const LazyLoadPage({Key? key}) : super(key: key);

//   @override
//   State<LazyLoadPage> createState() => _LazyLoadPageState();
// }

// class _LazyLoadPageState extends State<LazyLoadPage> {
//   List<Product> data = [];
//   int currentLength = 0;

//   final int increment = 10;
//   bool isLoading = false;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _loadMore();
//   }

//   Future _loadMore() async {
//     setState(() {
//       isLoading = true;
//     });
//     await new Future.delayed(const Duration(seconds: 2));
//     for (var i = currentLength; i <= currentLength + increment; i++) {
//       data.add(Product());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: LazyLoadScrollView(
//       isLoading: isLoading,
//       onEndOfPage: () => _loadMore(),
//       child: ListView.builder(
//         itemCount: data.length,
//         itemBuilder: (context, position) {
//           return DemoItem(position);
//         },
//       ),
//     ));
//   }
// }

// class DemoItem extends StatelessWidget {
//   final int position;
//   const DemoItem(this.position, {Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Container(
//                   color: Colors.deepOrange,
//                   height: 40.0,
//                   width: 40.0,
//                 ),
//                 SizedBox(width: 8.0),
//                 Text("Item $position"),
//               ],
//             ),
//             Text("GeeksforGeeks.org was created with a goal "
//                 "in mind to provide well written, well "
//                 "thought and well explained solutions for selected"
//                 " questions. The core team of five super geeks"
//                 " constituting of technology lovers and computer"
//                 " science enthusiasts have been constantly working"
//                 " in this direction ."),
//           ],
//         ),
//       ),
//     );
//   }
// }
