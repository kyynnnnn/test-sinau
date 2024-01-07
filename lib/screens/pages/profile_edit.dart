import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sinau/widgets/colors.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController nomorController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController birthController = TextEditingController();

  @override
  void initState() {
    super.initState();
    existData();
  }

  void existData() async {
    final docRef = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid);

    final snapshot = await docRef.get();

    final user = snapshot.data()!;

    setState(() {
      nameController.text = user['name'] == '' ? '' : user['name'];
      nomorController.text = user['hp'] == '' ? '' : user['hp'];
      alamatController.text = user['alamat'] == '' ? '' : user['alamat'];
      birthController.text = user['birth'] == '' ? '' : user['birth'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: (50),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.keyboard_arrow_left)),
                    Text(
                      'Edit Profil',
                      style: GoogleFonts.plusJakartaSans(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                //////////NAMA/////////
                Text(
                  'Nama',
                  style: GoogleFonts.plusJakartaSans(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 60.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: gray)),
                  child: TextField(
                    controller: nameController,
                    style: GoogleFonts.plusJakartaSans(
                        color: black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: "Masukkan Nama",
                      hintStyle: GoogleFonts.plusJakartaSans(
                          color: gray,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                /////////NO TELP////////
                Text(
                  'No Telepon',
                  style: GoogleFonts.plusJakartaSans(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 60.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: gray)),
                  child: TextField(
                    controller: nomorController,
                    style: GoogleFonts.plusJakartaSans(
                        color: black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: "Masukkan Nomor Telepon",
                      hintStyle: GoogleFonts.plusJakartaSans(
                          color: gray,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),

                /////////ALAMAT////////
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'ALAMAT',
                  style: GoogleFonts.plusJakartaSans(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 60.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: gray)),
                  child: TextField(
                    controller: alamatController,
                    style: GoogleFonts.plusJakartaSans(
                        color: black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: "Masukkan Alamat",
                      hintStyle: GoogleFonts.plusJakartaSans(
                          color: gray,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),

                /////////TGL Lahir////////
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Tanggal Lahir',
                  style: GoogleFonts.plusJakartaSans(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 60.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: gray)),
                  child: TextField(
                    controller: birthController,
                    style: GoogleFonts.plusJakartaSans(
                        color: black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: "Masukkan Tanggal Lahir",
                      hintStyle: GoogleFonts.plusJakartaSans(
                          color: gray,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: 50.0,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      final FirebaseFirestore firestore =
                          FirebaseFirestore.instance;

                      FirebaseAuth auth = FirebaseAuth.instance;

                      String? userId = auth.currentUser?.uid;

                      final docUser = firestore.collection('users').doc(userId);

                      docUser.update({
                        'name': nameController.text,
                        'hp': nomorController.text,
                        'alamat': alamatController.text,
                        'birth': birthController.text,
                      });

                      Navigator.pushNamed(context, '/home');
                    },
                    child: Text(
                      "Simpan",
                      style: GoogleFonts.plusJakartaSans(
                          color: black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
