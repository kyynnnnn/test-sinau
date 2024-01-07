import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sinau/firebase/auth_service.dart';
import 'package:sinau/widgets/colors.dart';

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

    print(tes);

    setState(() {
      member = tes.toString();

      if (member == "VIP") {
        lenght = 3;
        print('tes');
      } else {
        lenght = 1;
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
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              height: 258,
                              margin: EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(
                                  color: blue,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              child: Padding(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
