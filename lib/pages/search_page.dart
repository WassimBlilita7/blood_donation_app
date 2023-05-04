import 'package:app_settings/app_settings.dart';
import 'package:blood_donation_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class SearchPage extends StatefulWidget {
  SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final Uri _url = Uri.parse('https://www.google.com/maps/search/hopital+setif/@36.2017392,5.3556254,12z');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: 
          Column(
            children: [
              SizedBox(height: 50,),
              GestureDetector(
                  onTap: () {
                    _launchUrl();
                  },
                  child: FindHospital(),
                  ),
                  const SizedBox(height: 40,),

                  Text('If you dont run GPS 🗺️ , Please click here ! ' , style: TextStyle(
                    fontFamily: 'Alkatra',  
                    fontSize: 20
                  ),),
                  SizedBox(height: 20,),

                  ElevatedButton(onPressed:(){
                    AppSettings.openLocationSettings();

                  }, child: Text('Run GPS'),
                  style: ElevatedButton.styleFrom(
                    primary: kPrimaryColor, 
                  )
                    
                     
                  ),
            ],
          ),


              
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}

class FindHospital extends StatelessWidget {
  const FindHospital({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 400,
        decoration: BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: kPrimaryColor, width: 2)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/hospital.png',
                height: 80,
                width: 80,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'Find Hospital',
                style: TextStyle(
                  fontFamily: 'Alkatra',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Find near hospital to you 🏥',
                style: TextStyle(
                  fontFamily: 'Alkatra',
                ),
              )
            ],
          ),
        ));
  }
}

