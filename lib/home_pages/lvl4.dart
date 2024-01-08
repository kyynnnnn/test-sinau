import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sinau/widgets/colors.dart';

class pageLvl4 extends StatefulWidget {
  const pageLvl4({super.key});

  @override
  State<pageLvl4> createState() => _pageLvl4State();
}

class _pageLvl4State extends State<pageLvl4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('materi4').snapshots(),
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
                    IconButton(
                      padding: const EdgeInsets.all(0),
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
                      'Aksara Jawa (Huruf Jawa)',
                      style: GoogleFonts.plusJakartaSans(
                          color: black,
                          fontWeight: FontWeight.w700,
                          fontSize: 24),
                    ),
                    const SizedBox(
                      height: 32.0,
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
                                height: 600,
                                //margin: const EdgeInsets.only(bottom: 15),
                                decoration: const BoxDecoration(
                                    //color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                child: Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                      Container(
                                        //color: black,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Image.network(
                                          user['img-url'],
                                          fit: BoxFit.fill,
                                        ),
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
    );
  }
}
