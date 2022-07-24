// import 'dart:convert';

// import 'package:flutter/material.dart';
// import '../net/spiders_call.dart';
// import '../main.dart';

// // class SpiderBody extends StatefulWidget {
// //   @override
// //   State<StatefulWidget> createState() {
// //     // TODO: implement createState
// //     throw UnimplementedError();
// //   }

// // }
// final call = INatCalls();

// // final mapResponse = json.decode(response.body);
// // final listOfResults = mapResponse['results'];

// class SpiderBody extends StatelessWidget {
//   const SpiderBody({Key? key}) : super(key: key);

//   void initState() {
//     call.getResponse();
//   }

//   @override
//   Widget build(Object context) {
//     return SingleChildScrollView(
//       child: Column(
//         // mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           // Image.network(listOfResults[0]['default_photo']['url'].toString()),
//           Text(
//             "Spiders Observed in Bermuda in 2022: ${mapResponse['total_results'].toString()}",
//             style: const TextStyle(fontSize: 24),
//           ),

//           //CHANGE THIS TO LIST BUILDER
//           ListView.builder(
//             itemCount: listOfResults.length,
//             shrinkWrap: true,
//             itemBuilder: (context, index) {
//               return Container(
//                 padding: const EdgeInsets.all(10),
//                 height: 100,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     // Image.network(
//                     //     listOfResults[index]['images']['url']),
//                     Text(
//                       "Species: ${listOfResults[index]['species_guess']}",
//                     ),
//                     Text(
//                       "Name: ${listOfResults[index]['taxon']['name']}",
//                     ),
//                     Text(
//                       "Species ID: ${listOfResults[index]['id']}",
//                     ),
//                     // Text(listOfResults[index]['description'])
//                   ],
//                 ),
//               );
//             },
//           )

//           // Text(
//           //   "Species: ${listOfResults[0]['species_guess'].toString()}",
//           // ),
//           // Text(listOfResults[0]['description'])
//         ],
//       ),
//     );
//   }
// }
