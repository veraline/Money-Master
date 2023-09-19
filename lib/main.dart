import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'home.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WorkThrough(),
    );
  }
}

class WorkThrough extends StatelessWidget {
  const WorkThrough({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/woman3.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0, // Position at the bottom of the screen
            left: 0,
            right: 0,
            child: Container(
                decoration:const BoxDecoration(
                  color: Color(0xFF6AC269),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(80))
                ),
              height: MediaQuery.of(context).size.height / 2.4, // Half of the screen height
             // Adjust the color as needed
              child:  Column(
                children: [
                 const Padding(
                    padding: EdgeInsets.only(right: 80, top: 60),
                    child: Text('Bank with zero stress.', style: TextStyle(fontSize: 30, color: Colors.white),),
                  ),
                  const   Padding(
                       padding: EdgeInsets.only(right: 235, top: 5),
                       child: Text('Dial *995*', style: TextStyle(fontSize: 30, color: Colors.white),),
                     ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20, right: 40),
                    child: Text('For your G-kala Mobile Wallet or visit', style: TextStyle(fontSize: 20, color: Colors.white),),
                  ),

                 const  Padding(
                    padding: EdgeInsets.only(top: 5, right: 130),
                    child: Text('your nearest G-kala Agent', style: TextStyle(fontSize: 20, color: Colors.white),),
                  ),


           const    SizedBox(height: 20,),


                     Padding(
                      padding: const EdgeInsets.only(right: 155),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const  WelcomePage()),
                          );
                        },
                        child: Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Center(
                              child: Text('Open Account', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                          ),
                        ),
                      ),
                    ),


                ],
              )
            ),
          ),
        ],
      ),
    );
  }
}

