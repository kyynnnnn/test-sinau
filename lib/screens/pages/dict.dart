import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sinau/data/tap.dart';
import 'package:sinau/widgets/colors.dart';

class kosaKata extends StatefulWidget {
  const kosaKata({super.key});

  @override
  State<kosaKata> createState() => _kosaKataState();
}

class _kosaKataState extends State<kosaKata> {
  @override
  Widget build(BuildContext context) {
    return doubleTap(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('dict').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
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
                        height: 72,
                      ),
                      Text(
                        'Pepak Bahasa Jawa',
                        style: GoogleFonts.plusJakartaSans(
                            color: black,
                            fontWeight: FontWeight.w700,
                            fontSize: 24),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: users.length,
                          itemBuilder: (context, index) {
                            final user = users[index];
                            return Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 300,
                                  margin: EdgeInsets.only(bottom: 15),
                                  decoration: BoxDecoration(
                                      color: green,
                                      borderRadius: const BorderRadius.all(
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
                                          height: 8.0,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              user['kata1'],
                                              style:
                                                  GoogleFonts.plusJakartaSans(
                                                      color: black,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            ),
                                            Text(
                                              user['arti1'],
                                              style:
                                                  GoogleFonts.plusJakartaSans(
                                                      color: black,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              user['kata2'],
                                              style:
                                                  GoogleFonts.plusJakartaSans(
                                                      color: black,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            ),
                                            Text(
                                              user['arti2'],
                                              style:
                                                  GoogleFonts.plusJakartaSans(
                                                      color: black,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              user['kata3'],
                                              style:
                                                  GoogleFonts.plusJakartaSans(
                                                      color: black,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            ),
                                            Text(
                                              user['arti3'],
                                              style:
                                                  GoogleFonts.plusJakartaSans(
                                                      color: black,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              user['kata4'],
                                              style:
                                                  GoogleFonts.plusJakartaSans(
                                                      color: black,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            ),
                                            Text(
                                              user['arti4'],
                                              style:
                                                  GoogleFonts.plusJakartaSans(
                                                      color: black,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              user['kata5'],
                                              style:
                                                  GoogleFonts.plusJakartaSans(
                                                      color: black,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            ),
                                            Text(
                                              user['arti5'],
                                              style:
                                                  GoogleFonts.plusJakartaSans(
                                                      color: black,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              user['kata6'],
                                              style:
                                                  GoogleFonts.plusJakartaSans(
                                                      color: black,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            ),
                                            Text(
                                              user['arti6'],
                                              style:
                                                  GoogleFonts.plusJakartaSans(
                                                      color: black,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              user['kata7'],
                                              style:
                                                  GoogleFonts.plusJakartaSans(
                                                      color: black,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            ),
                                            Text(
                                              user['arti7'],
                                              style:
                                                  GoogleFonts.plusJakartaSans(
                                                      color: black,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              user['kata8'],
                                              style:
                                                  GoogleFonts.plusJakartaSans(
                                                      color: black,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            ),
                                            Text(
                                              user['arti8'],
                                              style:
                                                  GoogleFonts.plusJakartaSans(
                                                      color: black,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  );
                }
              },
            ),
          )),
        ),
      ),
    );
  }
}
