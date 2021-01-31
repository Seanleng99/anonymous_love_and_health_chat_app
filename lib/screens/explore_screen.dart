import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExploreScreen extends StatefulWidget {
  static const routeName = '/explore_screen';
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Exploring More Friends....',
        style: GoogleFonts.openSans(
          color: Colors.black,
          fontSize: 18.0,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
