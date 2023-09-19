import 'package:flutter/material.dart';
import 'depositnextpage.dart';

class Airtime extends StatelessWidget {
  const Airtime({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFFAFAFA),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios, color: Colors.black,)),
        title: const Text('Airtime', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600)),
        titleSpacing: 2,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Mobile Number',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.grey)
                  )
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Network',
                  suffixIcon: const Icon(Icons.arrow_drop_down),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.grey)
                  )
              ),
            ),

          ),

          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Amount',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.grey)
                  )
              ),
            ),

          ),

          Padding(
            padding: const EdgeInsets.only(top: 440),
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
    );
  }
}
