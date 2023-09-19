import 'package:flutter/material.dart';

class DepositNextPage extends StatelessWidget {
  const DepositNextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFFAFAFA),
        titleSpacing: 2,
        leading: GestureDetector(
            onTap: () {
              // Go back to the previous page
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios, color: Colors.black,)
        ),
        title: const Text('Confirm', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: 360,
                height: 325,
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F1F1),
                  borderRadius: BorderRadius.circular(20)
                ),
                child:const Center(
                    child:  Text('Confirmation text')
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 230, left: 20, right: 20),
              child: GestureDetector(
                onTap: (){
                  _showPinBottomSheet(context);
                },
                child: Container(
                  width: 365,
                  height: 56,
                  decoration: BoxDecoration(
                    color: const Color(0xFF6AC269),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: const Center(
                      child:  Text("Accept", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),)
                  ),

                ),
              ),
            ),

             GestureDetector(
               onTap: () {
                 // Go back to the previous page
                 Navigator.pop(context);
               },
               child: Container(
                width: 365,
                height: 56,
                decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(20)
                ),
                child: const Center(
                    child:  Text("Cancel", style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.w600),)
                ),

            ),
             ),
          ],
        ),
      ),


    );
  }
}


void _showPinBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 400,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
           const  Text(
              'Enter 4-Digit PIN',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            PinEntryWidget(),
            const SizedBox(height: 10,)
            // Create a PinEntryWidget for PIN input
            // SizedBox(height: 100),
            // GestureDetector(
            //   onTap: (){
            //     _showPinBottomSheet(context);
            //   },
            //   child: Container(
            //     width: 365,
            //     height: 56,
            //     decoration: BoxDecoration(
            //         color: const Color(0xFF6AC269),
            //         borderRadius: BorderRadius.circular(20)
            //     ),
            //     child: const Center(
            //         child:  Text("Continue", style: TextStyle(color: Colors.white, fontSize: 18),)
            //     ),
            //
            //   ),
            // ),
            //
            // GestureDetector(
            //   onTap: () {
            //     // Go back to the previous page
            //     Navigator.pop(context);
            //   },
            //   child: Container(
            //     width: 365,
            //     height: 56,
            //     decoration: BoxDecoration(
            //
            //         borderRadius: BorderRadius.circular(20)
            //     ),
            //     child: const Center(
            //         child:  Text("Cancel", style: TextStyle(color: Colors.red, fontSize: 18),)
            //     ),
            //
            //   ),
            // ),



          ],
        ),
      );
    },
  );
}


class PinEntryWidget extends StatefulWidget {
  @override
  State<PinEntryWidget> createState() => _PinEntryWidgetState();
}

class _PinEntryWidgetState extends State<PinEntryWidget> {
  String pin = '';

  void _onButtonPressed(String digit) {
    if (pin.length < 4) {
      setState(() {
        pin += digit;
      });
    }
  }

  void _onDeletePressed() {
    if (pin.isNotEmpty) {
      setState(() {
        pin = pin.substring(0, pin.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 4; i++)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CirclePinIndicator(isFilled: i < pin.length),
              ),
          ],
        ),
        SizedBox(height: 20),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 2,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 2.0,
          ),
          itemCount: 11, // 0 to 9
          itemBuilder: (context, index) {
            if (index == 10) {
              return GestureDetector(
                onTap: () {
                  _onDeletePressed();
                },
                child: CirclePinInputButton(
                  text: 'DEL',
                ),
              );
            } else if (index == 10) {
              return const SizedBox.shrink(); // An empty space for layout
            } else {
              return GestureDetector(
                onTap: () {
                  _onButtonPressed(index.toString());
                },
                child: CirclePinInputButton(
                  text: index.toString(),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}

class CirclePinIndicator extends StatelessWidget {
  final bool isFilled;

  CirclePinIndicator({required this.isFilled});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isFilled ? Color(0xFF6AC269) : Colors.grey,
      ),
    );
  }
}

class CirclePinInputButton extends StatelessWidget {
  final String text;

  CirclePinInputButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[300],
        ),
        child: Center(

          child: text == 'DEL'
              ? const Icon(Icons.backspace, size: 24, ) // Use an icon for "DEL"
              : Text(
            text,
            style: const TextStyle(fontSize: 18), // Adjust the font size
          ),
        ),
      ),
    );
  }
}