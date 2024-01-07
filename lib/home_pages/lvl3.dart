import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sinau/data/popup_confirmation.dart';
import 'package:sinau/firebase/auth_service.dart';
import 'package:sinau/widgets/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';

class pageLvl3 extends StatefulWidget {
  const pageLvl3({super.key});

  @override
  State<pageLvl3> createState() => _pageLvl3State();
}

class _pageLvl3State extends State<pageLvl3> {
  String member = '';
  int lenght = 0;

  @override
  void initState() {
    super.initState();
    getNamed();
  }

  void getNamed() async {
    final tes = await AuthService().getStatus();

    final docLength = AuthService().getLength3();

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
                  FirebaseFirestore.instance.collection('materi3').snapshots(),
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
                        'Bahasa Jawa Tingkat Lanjut',
                        style: GoogleFonts.plusJakartaSans(
                            color: black,
                            fontWeight: FontWeight.w700,
                            fontSize: 24),
                      ),
                      const SizedBox(
                        height: 32.0,
                      ),
                      Text(
                        'Krama Alus',
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
                                  height: 375,
                                  margin: EdgeInsets.only(bottom: 15),
                                  decoration: BoxDecoration(
                                      color: green,
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
                                              color: black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          user['deskripsi'],
                                          style: GoogleFonts.plusJakartaSans(
                                              color: black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Contoh kalimat: ',
                                          style: GoogleFonts.plusJakartaSans(
                                              color: black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          user['contoh1'],
                                          style: GoogleFonts.plusJakartaSans(
                                              color: black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          user['arti1'],
                                          style: GoogleFonts.plusJakartaSans(
                                              color: black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.italic),
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        Text(
                                          user['contoh2'],
                                          style: GoogleFonts.plusJakartaSans(
                                              color: black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          user['arti2'],
                                          style: GoogleFonts.plusJakartaSans(
                                              color: black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.italic),
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        Text(
                                          user['contoh3'],
                                          style: GoogleFonts.plusJakartaSans(
                                              color: black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          user['arti3'],
                                          style: GoogleFonts.plusJakartaSans(
                                              color: black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.italic),
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
                    ],
                  );
                }
              }),
        ),
      ),
    );
  }
}
