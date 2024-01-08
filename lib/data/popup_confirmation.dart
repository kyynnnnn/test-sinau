import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PurchaseConfirmationDialog {
  static Future<bool?> show(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Konfirmasi Pembelian',
            textAlign: TextAlign.center,
            style: GoogleFonts.plusJakartaSans(),
          ),
          content: Text(
            'Apakah Anda yakin ingin membeli Membership VIP seharga Rp.59.000?',
            textAlign: TextAlign.center,
            style: GoogleFonts.plusJakartaSans(),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(
                'Batal',
                textAlign: TextAlign.center,
                style: GoogleFonts.plusJakartaSans(),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(
                'Beli',
                textAlign: TextAlign.center,
                style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
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
          title: Text(
            'Konfirmasi Pembatalan',
            textAlign: TextAlign.center,
            style: GoogleFonts.plusJakartaSans(),
          ),
          content: Text(
            'Apakah Anda yakin ingin membatalkan Membership VIP?',
            textAlign: TextAlign.center,
            style: GoogleFonts.plusJakartaSans(),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(
                'Tidak',
                textAlign: TextAlign.center,
                style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(
                'Ya',
                textAlign: TextAlign.center,
                style: GoogleFonts.plusJakartaSans(),
              ),
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
          title: Text(
            'Konfirmasi Logout',
            textAlign: TextAlign.center,
            style: GoogleFonts.plusJakartaSans(),
          ),
          content: Text(
            'Apakah Anda benar-benar ingin logout?',
            textAlign: TextAlign.center,
            style: GoogleFonts.plusJakartaSans(),
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text(
                  'Batal',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                )),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(
                'Logout',
                textAlign: TextAlign.center,
                style: GoogleFonts.plusJakartaSans(),
              ),
            ),
          ],
        );
      },
    );
  }
}

// class Confirm {
//   void _showPurchaseAlertDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Terimakasih!'),
//           content: Text('Terimakasih atas pembelian Anda!'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 // Tambahkan ini jika Anda ingin menyegarkan halaman
//                 setState(() {
//                   // Tambahkan perubahan status atau logika penyegaran halaman di sini
//                 });
//               },
//               child: Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

class YourButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  YourButtonWidget({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // Tampilan tombol pembelian
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Text('Beli'),
      ),
    );
  }
}
