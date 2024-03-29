import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sinau/data/popup_confirmation.dart';
import 'package:sinau/data/tap.dart';
// import 'package:sinau/data/widget_confirm';
import 'package:sinau/firebase/auth_service.dart';
import 'package:sinau/screens/pages/profile_edit.dart';
import 'package:sinau/widgets/colors.dart';

class ProfilePagee extends StatefulWidget {
  const ProfilePagee({super.key});

  @override
  State<ProfilePagee> createState() => _ProfilePageeState();
}

class _ProfilePageeState extends State<ProfilePagee> {
  String name = '';
  String member = '';
  DateTime? currentBackPressTime;

  @override
  void initState() {
    super.initState();
    getStatus();
    _startPurchase();
  }

  void getStatus() async {
    final tes = await AuthService().getStatus();

    setState(() {
      member = tes.toString();
    });
  }

  Future<void> _startPurchase() async {
    // Simulasi panggilan Firebase
    await Future.delayed(Duration(seconds: 2));
    // Implementasi logika pembelian dan pembaruan ke Firebase di sini
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    String? userId = auth.currentUser?.uid;
    //final Completer<void> _purchaseCompleter = Completer<void>();

    return doubleTap(
      child: Scaffold(
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   title: Text('Profil Saya'),
        //   backgroundColor: Colors.lightBlue,
        // ),

        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Informasi Pengguna',
                          style: GoogleFonts.plusJakartaSans(
                              color: black,
                              fontSize: 30.0,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                CircleAvatar(
                  radius: 60.0,
                  backgroundImage: AssetImage('assets/icons/appicon.png'),
                ),
                SizedBox(height: 20.0),
                FutureBuilder(
                    future: FirebaseFirestore.instance
                        .collection('users')
                        .doc(userId)
                        .get(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      } else {
                        final user = snapshot.data!;
                        return Column(
                          children: [
                            Text(
                              '${user['name']}',
                              style: GoogleFonts.plusJakartaSans(
                                  color: black,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              '${user['email']}',
                              style: GoogleFonts.plusJakartaSans(
                                  color: Colors.grey,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 20.0),
                            buildMember(
                                'Membership',
                                '${user['member']}' == 'null'
                                    ? 'Gratis'
                                    : '${user['member']}'),
                            buildInfoCard(
                                'Nomor Telepon',
                                '${user['hp']}' == 'null'
                                    ? 'Silahkan Update Data !'
                                    : '${user['hp']}'),
                            buildInfoCard(
                                'Alamat',
                                '${user['alamat']}' == 'null'
                                    ? 'Silahkan Update Data !'
                                    : '${user['alamat']}'),
                            buildInfoCard(
                                'Tanggal Lahir',
                                '${user['birth']}' == ''
                                    ? 'Silahkan Update Data !'
                                    : '${user['birth']}'),
                            SizedBox(height: 1.0),
                            (member == 'Gratis')
                                ? InkWell(
                                    onTap: () async {
                                      print('Tombol Beli Ditekan');
                                      PurchaseConfirmationDialog();
                                      bool? result =
                                          await PurchaseConfirmationDialog.show(
                                              context);

                                      if (result != null && result) {
                                        final FirebaseFirestore firestore =
                                            FirebaseFirestore.instance;
                                        FirebaseAuth auth =
                                            FirebaseAuth.instance;
                                        String? userId = auth.currentUser?.uid;
                                        final docUser = firestore
                                            .collection('users')
                                            .doc(userId);

                                        docUser.update({
                                          'member': 'VIP',
                                        });

                                        print('Pembelian dikonfirmasi');

                                        // Tampilkan CircularProgressIndicator selama 1 detik
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            // Tampilkan CircularProgressIndicator
                                            return AlertDialog(
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  CircularProgressIndicator(),
                                                  SizedBox(height: 16),
                                                  Text(
                                                    'Menunggu...',
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts
                                                        .plusJakartaSans(),
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                        );

                                        // Tunggu sebelum menampilkan AlertDialog selanjutnya
                                        await Future.delayed(
                                            Duration(seconds: 1));

                                        // Tutup dialog CircularProgressIndicator
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop();

                                        // Update variabel 'member' menjadi 'VIP'
                                        setState(() {
                                          member = 'VIP';
                                        });

                                        // Tambahkan AlertDialog baru setelah pembelian dikonfirmasi
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text(
                                                'Terimakasih!',
                                                textAlign: TextAlign.center,
                                              ),
                                              content: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    'Terimakasih atas pembelian Anda!',
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts
                                                        .plusJakartaSans(),
                                                  ),
                                                  SizedBox(height: 8),
                                                  Text(
                                                    'Status Member Anda kini adalah :',
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts
                                                        .plusJakartaSans(),
                                                  ),
                                                  Text(
                                                    'User VIP',
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts
                                                        .plusJakartaSans(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                ],
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    print('Menekan tombol OK');
                                                    Navigator.of(context,
                                                            rootNavigator: true)
                                                        .pop(); // Tutup dialog terakhir
                                                    print(
                                                        'Dialog terakhir ditutup');

                                                    // Navigasi kembali ke halaman sebelumnya
                                                    //Navigator.of(context).pop();
                                                    print(
                                                        'Navigasi kembali ke halaman sebelumnya');
                                                  },
                                                  child: Text('OK'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      } else {
                                        print('Pembelian dibatalkan');
                                      }
                                    },
                                    child: Container(
                                      width: 200,
                                      height: 40,
                                      margin:
                                          EdgeInsets.symmetric(vertical: 8.0),
                                      padding: EdgeInsets.all(12.0),
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 14, 250, 171),
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Center(
                                        child: Text(
                                          'Beli Membership',
                                          style: GoogleFonts.plusJakartaSans(
                                              color: Color.fromARGB(
                                                  255, 109, 3, 3),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                  )
                                : InkWell(
                                    onTap: () async {
                                      print('Tombol Batal Ditekan');
                                      CancelConfirmationDialog();
                                      bool? result =
                                          await CancelConfirmationDialog.show(
                                              context);
                                      if (result!) {
                                        final FirebaseFirestore firestore =
                                            FirebaseFirestore.instance;

                                        FirebaseAuth auth =
                                            FirebaseAuth.instance;

                                        String? userId = auth.currentUser?.uid;

                                        final docUser = firestore
                                            .collection('users')
                                            .doc(userId);

                                        docUser.update({
                                          'member': 'Gratis',
                                        });
                                        print('Pembatalan dikonfirmasi');

                                        // Tampilkan CircularProgressIndicator selama 1 detik
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            // Tampilkan CircularProgressIndicator
                                            return AlertDialog(
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  CircularProgressIndicator(),
                                                  SizedBox(height: 16),
                                                  Text(
                                                    'Menunggu...',
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts
                                                        .plusJakartaSans(),
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                        );

                                        // Tunggu sebelum menampilkan AlertDialog selanjutnya
                                        await Future.delayed(
                                            Duration(seconds: 1));

                                        // Tutup dialog CircularProgressIndicator
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop();

                                        // Update variabel 'member' menjadi 'VIP'
                                        setState(() {
                                          member = 'Gratis';
                                        });

                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text(
                                                'Terimakasih!',
                                                textAlign: TextAlign.center,
                                              ),
                                              content: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    'Status Member Anda kini adalah :',
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts
                                                        .plusJakartaSans(),
                                                  ),
                                                  Text(
                                                    'User Gratis',
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts
                                                        .plusJakartaSans(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                ],
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    print('Menekan tombol OK');
                                                    Navigator.of(context,
                                                            rootNavigator: true)
                                                        .pop(); // Tutup dialog terakhir
                                                    print(
                                                        'Dialog terakhir ditutup');

                                                    // Navigasi kembali ke halaman sebelumnya
                                                    //Navigator.of(context).pop();
                                                    print(
                                                        'Navigasi kembali ke halaman sebelumnya');
                                                  },
                                                  child: Text('OK'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      } else {
                                        print('Pembatalan dibatalkan');
                                      }
                                    },
                                    child: Container(
                                      width: 200,
                                      height: 40,
                                      margin:
                                          EdgeInsets.symmetric(vertical: 8.0),
                                      padding: EdgeInsets.all(12.0),
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 223, 110, 4),
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Center(
                                        child: Text(
                                          'Batalkan Membership',
                                          style: GoogleFonts.plusJakartaSans(
                                              color: Color.fromARGB(
                                                  255, 255, 196, 196),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                  ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/edit-profile');
                              },
                              child: Text(
                                'Edit Profil',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                // Logouts();
                                bool? confirmed =
                                    await Logouts.showLogoutConfirmationDialog(
                                        context);
                                if (confirmed!) {
                                  print('Akun Keluar');
                                  await FirebaseAuth.instance.signOut();
                                  Navigator.pushNamed(context, '/login');
                                } else {
                                  print('Logout Dibatalkan');
                                  // Navigator.pushNamed(context, '/profile');
                                }
                                ;
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                              ),
                              child: Text(
                                'Logout',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        );
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );

    //);
  }

  Widget buildInfoCard(String label, String value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.plusJakartaSans(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),
          ),
          Text(
            value,
            style: GoogleFonts.plusJakartaSans(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  Widget buildMember(String label, String value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.plusJakartaSans(
                color: Color.fromARGB(255, 109, 3, 3),
                fontSize: 14,
                fontWeight: FontWeight.w700),
          ),
          Text(
            value,
            style: GoogleFonts.plusJakartaSans(
                color: Colors.blueGrey,
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
