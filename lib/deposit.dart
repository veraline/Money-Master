import 'package:flutter/material.dart';
import 'depositnextpage.dart';
class DepositPage extends StatelessWidget {
  const DepositPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor:const  Color(0xFFFAFAFA),
        leading: GestureDetector(
            onTap: () {
              // Go back to the previous page
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new, color: Colors.black,)
        ),
        titleSpacing: 2,
        title: const Text("Send to Wallet", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),),
      ),
      body:   SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: TextField(
                decoration: InputDecoration(
                  // labelText: 'Enter G-kala mobile number',
                  hintText: 'Enter G-kala mobile number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.grey), // Change the color here
                  ),


                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextField(
                decoration: InputDecoration(
                  // labelText: 'Enter G-kala mobile number',
                  hintText: 'Amount',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.grey), // Change the color here
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextField(
                decoration: InputDecoration(
                  // labelText: 'Enter G-kala mobile number',
                  hintText: 'Enter Assistant Id',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.grey), // Change the color here
                  ),
                ),
              ),
            ),

           Padding(
             padding: const EdgeInsets.only(top: 425),
             child: GestureDetector(
               onTap: (){
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => const DepositNextPage()),
                 );
               },
               child: Container(
                 width: 365,
                 height: 56,
                 decoration: BoxDecoration(
                   color: const Color(0xFF6AC269),
                   borderRadius: BorderRadius.circular(20)
                 ),
                 child: const Center(
                     child: Text('Next', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),)
                 ),
               ),
             ),
           )
          ],
        ),
      ),
    );
  }
}
