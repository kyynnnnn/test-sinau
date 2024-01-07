import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class pageLvl1 extends StatefulWidget {
  const pageLvl1({super.key});

  @override
  State<pageLvl1> createState() => _pageLvl1State();
}

class _pageLvl1State extends State<pageLvl1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('materi')
                  .doc('U5hHWqaIPcFrQ7YwppNI')
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
                  return Container(
                    child: Column(
                      children: [
                        Text(
                          user['title'],
                          style: GoogleFonts.plusJakartaSans(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          user['contoh'],
                          style: GoogleFonts.plusJakartaSans(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          user['deskripsi'],
                          style: GoogleFonts.plusJakartaSans(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          user['arti'],
                          style: GoogleFonts.plusJakartaSans(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  );
                }
              }),
        ),
      ),
    );
  }
}
