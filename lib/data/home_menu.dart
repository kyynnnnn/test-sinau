class Menu {
  String? pic, name;

  Menu({
    required this.pic,
    required this.name,
  });
}

List<Menu> listMenu = <Menu>[
  Menu(pic: "assets/images/menu1.png", name: "Bahasa Jawa Tingkat Dasar"),
  Menu(pic: "assets/images/menu2.png", name: "Bahasa Jawa Tingkat Menengah"),
  Menu(pic: "assets/images/menu3.png", name: "Bahasa Jawa Tingkat Lanjut"),
  Menu(pic: "assets/images/menu4.png", name: "Materi Aksara Jawa (Huruf Jawa)")
];

// import 'package:flutter/material.dart';

// class Menu {
//   final String pic;
//   final String name;

//   Menu({required this.pic, required this.name});
// }

// class Sinau extends StatelessWidget {
//   List<Menu> listMenu = <Menu>[
//     Menu(pic: "assets/images/menu1.png", name: "Bahasa Jawa Tingkat Dasar"),
//     Menu(pic: "assets/images/menu2.png", name: "Bahasa Jawa Tingkat Menengah"),
//     Menu(pic: "assets/images/menu3.png", name: "Bahasa Jawa Tingkat Lanjut"),
//     Menu(
//         pic: "assets/images/menu4.png", name: "Materi Aksara Jawa (Huruf Jawa)")
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: ListView.builder(
//           itemCount: listMenu.length,
//           itemBuilder: (context, index) {
//             return InkWell(
//               onTap: () {
//                 // Tambahkan logika untuk mengarahkan ke halaman masing-masing
//                 navigateToMenuPage(context, listMenu[index]);
//               },
//               child: ListTile(
//                 leading: Image.asset(
//                   listMenu[index].pic,
//                   width: 50,
//                   height: 50,
//                 ),
//                 title: Text(listMenu[index].name),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   void navigateToMenuPage(BuildContext context, Menu menu) {
//     // Tambahkan logika navigasi ke halaman masing-masing di sini
//     // Misalnya, Anda bisa menggunakan Navigator.push
//     // Navigator.push(context, MaterialPageRoute(builder: (context) => MenuPage(menu: menu)));
//     print('Navigasi ke halaman: ${menu.name}');
//   }
// }
