import 'package:blood_donation_app/constants.dart';
import 'package:blood_donation_app/pages/home_page.dart';
import 'package:blood_donation_app/pages/like_page.dart';
import 'package:blood_donation_app/pages/search_page.dart';
import 'package:blood_donation_app/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBar extends StatefulWidget {
  String id = 'NavBar';
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomePage(),
    LikePage(),
    SearchPage(),
    SettingsPage(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kSecondaryColor,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text(
            'Blood Doantion ',
            style: TextStyle(fontFamily: 'Alkatra'),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: _pages.elementAt(_selectedIndex),
        bottomNavigationBar: Container(
          color: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: GNav(
              backgroundColor: Colors.grey,
              color: Colors.black,
              activeColor: kSecondaryColor,
              tabBackgroundColor: kPrimaryColor,
              gap: 10,
              padding: EdgeInsets.all(20),
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: ' Home',
                  textStyle:
                      TextStyle(fontFamily: 'Alkatra', color: kSecondaryColor),
                ),
                GButton(
                  icon: Icons.favorite_border,
                  text: ' Likes',
                  textStyle:
                      TextStyle(fontFamily: 'Alkatra', color: kSecondaryColor),
                ),
                GButton(
                  icon: Icons.search,
                  text: ' Search',
                  textStyle:
                      TextStyle(fontFamily: 'Alkatra', color: kSecondaryColor),
                ),
                GButton(
                  icon: Icons.settings,
                  text: ' Settings',
                  textStyle:
                      TextStyle(fontFamily: 'Alkatra', color: kSecondaryColor),
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ));
  }
}
