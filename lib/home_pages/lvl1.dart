import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sinau/data/popup_confirmation.dart';
import 'package:sinau/firebase/auth_service.dart';
import 'package:sinau/widgets/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';

class pageLvl1 extends StatefulWidget {
  const pageLvl1({super.key});

  @override
  State<pageLvl1> createState() => _pageLvl1State();
}

class _pageLvl1State extends State<pageLvl1> {
  String member = '';
  int lenght = 0;

  @override
  void initState() {
    super.initState();
    getNamed();
  }

  void getNamed() async {
    final tes = await AuthService().getStatus();

    final docLength = AuthService().getLength1();

    print(tes);

    setState(() {
      member = tes.toString();

      if (member == "Gratis") {
        lenght = 1;
        print('tes');
      } else {
        docLength.then((value) {
          setState(() {
            lenght = value;
            print(value);
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('materi').snapshots(),
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
                  final users = snapshot.data!.docs;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 72.0,
                      ),
                      IconButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        alignment: Alignment.centerLeft,
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: black,
                          size: 24.0,
                        ),
                      ),
                      Text(
                        'Bahasa Jawa Tingkat Dasar',
                        style: GoogleFonts.plusJakartaSans(
                            color: black,
                            fontWeight: FontWeight.w700,
                            fontSize: 24),
                      ),
                      const SizedBox(
                        height: 32.0,
                      ),
                      Text(
                        'Salam dan Ungkapan Umum',
                        style: GoogleFonts.plusJakartaSans(
                            color: black,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: lenght,
                          itemBuilder: (context, index) {
                            final user = users[index];
                            return Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 258,
                                  margin: EdgeInsets.only(bottom: 15),
                                  decoration: BoxDecoration(
                                      color: blue,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                  child: Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          user['title'],
                                          style: GoogleFonts.plusJakartaSans(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Contoh kalimat: ',
                                          style: GoogleFonts.plusJakartaSans(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          user['contoh'],
                                          style: GoogleFonts.plusJakartaSans(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Arti kalimat: ',
                                          style: GoogleFonts.plusJakartaSans(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          user['arti'],
                                          style: GoogleFonts.plusJakartaSans(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        const SizedBox(
                                          height: 24,
                                        ),
                                        Text(
                                          user['deskripsi'],
                                          style: GoogleFonts.plusJakartaSans(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                (member == "Gratis")
                                    ? InkWell(
                                        onTap: () async {
                                          print('Tombol Beli Ditekan');
                                          PurchaseConfirmationDialog();
                                          bool? result =
                                              await PurchaseConfirmationDialog
                                                  .show(context);
                                          if (result!) {
                                            final FirebaseFirestore firestore =
                                                FirebaseFirestore.instance;

                                            FirebaseAuth auth =
                                                FirebaseAuth.instance;

                                            String? userId =
                                                auth.currentUser?.uid;

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
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      CircularProgressIndicator(),
                                                      SizedBox(height: 16),
                                                      Text(
                                                        'Menunggu...',
                                                        textAlign:
                                                            TextAlign.center,
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
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        'Terimakasih atas pembelian Anda!',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: GoogleFonts
                                                            .plusJakartaSans(),
                                                      ),
                                                      SizedBox(height: 8),
                                                      Text(
                                                        'Status Member Anda kini adalah :',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: GoogleFonts
                                                            .plusJakartaSans(),
                                                      ),
                                                      Text(
                                                        'User VIP',
                                                        textAlign:
                                                            TextAlign.center,
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
                                                        setState(() {
                                                          getNamed();
                                                        });
                                                        print(
                                                            'Menekan tombol OK');
                                                        Navigator.of(context,
                                                                rootNavigator:
                                                                    true)
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
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 75,
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    begin: Alignment.bottomLeft,
                                                    end: Alignment.topRight,
                                                    colors: [green, lightBlue]),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10))),
                                            child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "Berlangganan untuk dapatkan akses penuh dalam aplikasi!",
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts
                                                      .plusJakartaSans(
                                                          color: Colors.white,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                ))),
                                      )
                                    : Text("")
                              ],
                            );
                          },
                        ),
                      ),
                      //(users.length == )
                    ],
                  );
                }
              }),
        ),
      ),
    );
  }
}
