import 'dart:async';
import 'package:blood_donation_app/constants.dart';
import 'package:blood_donation_app/helper/show_snack_bar.dart';
import 'package:blood_donation_app/pages/admin_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app_settings/app_settings.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  static String id = 'SettingsPage';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  bool hasInternet = false;
  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Container(
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
            children: [
              GestureDetector(
                onTap: () {
                  AppSettings.openWIFISettings();
                },
                child: SettingsWidget(
                  color: Colors.grey,
                  text: 'Turn on WIFI',
                  icon: Icons.wifi,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  hasInternet = await InternetConnectionChecker().hasConnection;

                  final text = hasInternet
                      ? 'You are in online mode 📱 '
                      : 'You are in offline mode 📵';
                  final color = hasInternet ? Colors.green : Colors.red;

                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            ' Connexion Status 📶 ',
                            style: TextStyle(
                                fontFamily: 'Alkatra',
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                          content: Text(
                            text,
                            style: optionStyle,
                          ),
                          backgroundColor: color,
                        );
                      });
                },
                child: SettingsWidget(
                  color: Colors.grey,
                  text: 'Check Internet Connexion',
                  icon: Icons.check,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'DeveloperPage');
                },
                child: SettingsWidget(
                  color: Colors.grey,
                  text: 'About Developer',
                  icon: Icons.developer_board,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  showSnackBar(
                      context, 'LogOut with Successefull', Colors.green);
                  Navigator.of(context).pushReplacementNamed('LoginPage');
                },
                child: SettingsWidget(
                  color: kPrimaryColor,
                  text: 'Log Out',
                  icon: Icons.logout_rounded,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsWidget extends StatelessWidget {
  Color? color;
  String? text;
  IconData? icon;
  SettingsWidget({required this.color, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: kPrimaryColor, width: 2),
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 22,
            ),
            Text('$text', style: optionStyle),
          ],
        ),
      ),
    );
  }
}
