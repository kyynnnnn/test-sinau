import 'package:flutter/material.dart';

class PurchaseConfirmationDialog {
  static Future<bool?> show(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi Pembelian'),
          content: Text(
              'Apakah Anda yakin ingin membeli Membership VIP seharga Rp.59.000?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text('Beli'),
            ),
          ],
        );
      },
    );
  }
}

class CancelConfirmationDialog {
  static Future<bool?> show(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi Pembatalan'),
          content: Text('Apakah Anda yakin ingin membatalkan Membership VIP?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('Tidak'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text('Ya'),
            ),
          ],
        );
      },
    );
  }
}

// class PurchaseButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () async {
//         bool? result = await PurchaseConfirmationDialog.show(context);

//         if (result != null && result) {
//           print('Pembelian dikonfirmasi');
//         } else {
//           print('Pembelian dibatalkan');
//         }
//       },
//       child: Container(
//         width: 100,
//         height: 50,
//         color: Colors.blue,
//         child: Center(
//           child: Text(
//             'Beli',
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//       ),
//     );
//   }
// }

class Logouts {
  static Future<bool?> showLogoutConfirmationDialog(
      BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi Logout'),
          content: Text('Apakah Anda benar-benar ingin logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}
