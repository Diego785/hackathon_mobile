// import 'package:alerta_temprana_scz/pages/show_alerts/implementation_cards/ui/contact_list_page.dart';
// import 'package:alerta_temprana_scz/pages/show_alerts/implementation_cards/ui/widgets/cards.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     List<double> distances = [5.5, 6, 9.2, 3, 5.1];
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             MaterialButton(
//                 color: Colors.red,
//                 textColor: Colors.white,
//                 child: Text("Show Alerts"),
//                 onPressed: () {
//                   // Navigator.of(context).push(
//                   //     context,
//                   //     MaterialPageRoute(
//                   //         builder: (context) => MicrosListPage(distances)));
//                   // Navigator.of(context).push(MaterialPageRoute(
//                   //     builder: (context) => MicrosListPage(distances)));
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (_) => MicrosListPage()));
//                 }),
//             MaterialButton(
//                 color: Colors.blue,
//                 textColor: Colors.white,
//                 child: Text("Send Notifications"),
//                 onPressed: () {}),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ContactDetailScreen extends StatelessWidget {
//   const ContactDetailScreen(
//       {super.key, required this.color, required this.distance});

//   final Color color;
//   final double distance;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: SafeArea(
//         child: MicrosCard(
//           borderColor: color,
//           distances: distance,
//           dataComplete: true,
//         ),
//       ),
//     );
//   }
// }
