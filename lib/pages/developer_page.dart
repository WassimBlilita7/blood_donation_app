import 'package:blood_donation_app/constants.dart';
import 'package:blood_donation_app/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DeveloperPage extends StatelessWidget {
  static String id = 'DeveloperPage';
  const DeveloperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('About Developer' , style: optionStyle,),
        centerTitle: true,

      ),
      body: 
      
      Padding(
        padding: const EdgeInsets.all(50),
        child: Container(
          width: double.infinity, 
          height: double.infinity,
          decoration: BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.circular(16),  
            border: Border.all(
              color: kPrimaryColor,  
              width: 3, 
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('The Application Developers 👩🏻‍💻' , style: TextStyle(
                fontFamily: 'Alkatra' ,  
                fontWeight: FontWeight.bold , 
                fontSize: 19
              ),),
              Text('Get to know us more' , style: TextStyle(
                fontFamily: 'Alkatra'
              ),) , 
              SizedBox(height: 80,),
              Image.asset('assets/wassim.png' , height: 80,width: 70,), 
              Text('BLILITA Mohamed Wassim' , style: TextStyle(
                fontFamily: 'Alkatra' , 
                fontSize: 20 , 
                fontWeight: FontWeight.bold, 
              ),),  
              Text('CS Student' , style: TextStyle(
                fontFamily: 'Alkatra' , 
                fontSize: 19
              ),) , 
              Text('Flutter Developer 👨🏻‍💻 ' , style: TextStyle(
                fontFamily: 'Alkatra' , 
                fontSize: 19
              )), 

              SizedBox(height: 50,) , 


              Image.asset('assets/chaima.png' , height: 80,width: 70,), 
              Text('TALHI Chaima' , style: TextStyle(
                fontFamily: 'Alkatra' , 
                fontSize: 20 , 
                fontWeight: FontWeight.bold, 
              ),),  
              Text('CS Student' , style: TextStyle(
                fontFamily: 'Alkatra' , 
                fontSize: 19
              ),) , 
              Text('Flutter Developer 👨🏻‍💻 ' , style: TextStyle(
                fontFamily: 'Alkatra' , 
                fontSize: 19
              )), 

            ],
          ),
          
        ),
      )
      
    );
  }
}
