// import 'package:flutter/material.dart';

// class Popo extends StatelessWidget {
//   static const String id = "Popo";

//   const Popo({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       body: SafeArea(
//         child: CustomScrollView(
//           slivers: <Widget>[
//             SliverAppBar(
//               backgroundColor: Colors.grey[100],
//               title: Container(
//                 color: Colors.grey[100],
//                 height: 500,
//                 width: MediaQuery.of(context).size.width,
//                 child: Center(
//                   child: Text(
//                     "Head",
//                     style: TextStyle(color: Colors.black),
//                   ),
//                 ),
//               ),
//             ),
//             SliverAppBar(
//               pinned: true,
//               backgroundColor: Colors.white,
//               title: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 mainAxisSize: MainAxisSize.max,
//                 children: const <Widget>[
//                   Icon(Icons.dashboard),
//                   Icon(Icons.tv),
//                   Icon(Icons.person),
//                 ],
//               ),
//             ),
//             SliverAnimatedList(
//               itemBuilder: (_, index, ___) {
//                 return ListTile(
//                   title: Text(index.toString()),
//                 );
//               },
//               initialItemCount: 100,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
