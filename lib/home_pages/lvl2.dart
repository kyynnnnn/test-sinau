import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sinau/widgets/colors.dart';

class pageLvl2 extends StatefulWidget {
  const pageLvl2({super.key});

  @override
  State<pageLvl2> createState() => _pageLvl2State();
}

class _pageLvl2State extends State<pageLvl2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('materi2').snapshots(),
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
                        'Bahasa Jawa Tingkat Menengah',
                        style: GoogleFonts.plusJakartaSans(
                            color: black,
                            fontWeight: FontWeight.w700,
                            fontSize: 24),
                      ),
                      const SizedBox(
                        height: 32.0,
                      ),
                      Text(
                        'Kata Imbuhan/Tembung Andhahan',
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
                          itemCount: users.length,
                          itemBuilder: (context, index) {
                            final user = users[index];
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              height: 258,
                              margin: EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(
                                  color: green,
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
                                      user['contoh2'],
                                      style: GoogleFonts.plusJakartaSans(
                                          color: black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      user['contoh3'],
                                      style: GoogleFonts.plusJakartaSans(
                                          color: black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      user['contoh4'],
                                      style: GoogleFonts.plusJakartaSans(
                                          color: black,
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
