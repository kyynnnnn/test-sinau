// import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sinau/data/home_menu.dart';
import 'package:sinau/widgets/colors.dart';

class ListViewCustom extends StatelessWidget {
  const ListViewCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listMenu.length,
        itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              width: 361.0,
              height: 110.0,
              decoration: BoxDecoration(
                //border: Border.all(color: green, width: 2.0),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.green,
                    Colors.greenAccent,
                  ],
                ),
                //color: Color.fromARGB(255, 138, 255, 21),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/lvl${index + 1}');
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5.0)),
                        child: Image(
                          image: AssetImage(listMenu[index].pic.toString()),
                        ),
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            listMenu[index].name.toString(),
                            overflow: TextOverflow.clip,
                            maxLines: 2,
                            softWrap: false,
                            style: GoogleFonts.plusJakartaSans(
                                color: black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
