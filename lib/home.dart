import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moneymaster/airtime.dart';
import 'package:moneymaster/data.file.dart';
import 'package:moneymaster/deposit.dart';
import 'package:moneymaster/transfer.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late BannerAd _bannerAd; // Use "late" for non-nullable variables

  @override
  void initState() {
    super.initState();

    // Initialize MobileAds once in your app
    MobileAds.instance.initialize();

    // Create and load a BannerAd
    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-4823265874863080/6411172780',
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        // Handle ad events here
        onAdLoaded: (Ad ad) {
          // Ad has loaded successfully
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          // Ad failed to load
        },
        onAdOpened: (Ad ad) {
          // Ad opened
        },
        onAdClosed: (Ad ad) {
          // Ad closed
        },
        onAdImpression: (Ad ad) {
          // Ad impression
        },
      ),
    );

    // Load the ad
    _bannerAd.load();
  }

  @override
  void dispose() {
    // Dispose of the ad when no longer needed
    _bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color(0xFFFAFAFA),
        title: const Text(
          'Hello, Vera',
          style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.settings,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 260),
              child: Text(
                'Current Balance',
                style: TextStyle(fontSize: 17),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 170),
              child: Text(
                'NGN 45,000.00',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigate to another page when the container is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DepositPage()),
                    );
                  },
                  child: Container(
                    width: 108,
                    height: 85.42,
                    decoration: BoxDecoration(
                      color: const Color(0xFF6AC269),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        'Deposit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to another page when the container is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TransferPage()),
                    );
                  },
                  child: Container(
                    width: 108,
                    height: 85.42,
                    decoration: BoxDecoration(
                      color: const Color(0xFF6AC269),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        'Transfer',
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to another page when the container is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Airtime()),
                    );
                  },
                  child: Container(
                    width: 108,
                    height: 85.42,
                    decoration: BoxDecoration(
                      color: const Color(0xFF6AC269),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        'Airtime',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigate to another page when the container is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Data()),
                    );
                  },
                  child: Container(
                    width: 108,
                    height: 85.42,
                    decoration: BoxDecoration(
                      color: const Color(0xFF6AC269),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        'Data',
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 108,
                  height: 85.42,
                  decoration: BoxDecoration(
                    color: const Color(0xFF6AC269),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      'Pay Bills',
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Container(
                  width: 108,
                  height: 85.42,
                  decoration: BoxDecoration(
                    color: const Color(0xFF6AC269),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
             AdsContainer(
               bannerAd: _bannerAd,
             ),
            const SizedBox(height: 10,),
            const Padding(
              padding: EdgeInsets.only(right: 240),
              child: Text('Recent Transaction', style: TextStyle(fontSize: 16)),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                // Create and return the widget for each transaction item
                return const ListTile(
                  leading: Icon(Icons.payment), // You can customize the leading icon
                  title: Text('Transaction Title'), // Replace with actual title
                  subtitle: Text('Transaction Details'), // Replace with actual details
                  trailing: Text('-NGN 100.00'), // Replace with actual amount
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AdsContainer extends StatelessWidget {
  final BannerAd bannerAd;
  const AdsContainer({Key? key, required this.bannerAd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 141,
      width: 355,
      decoration: BoxDecoration(
        color: const Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(20),
      ),
      child:  Center(
        child:AdWidget(ad: bannerAd),
      ),
    );
  }
}
