// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import http package
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_app/coinCard.dart';
import 'package:my_app/coinModel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void signOutUser(BuildContext context) async {
    // Show a CircularProgressIndicator
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent the user from dismissing the dialog
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // Perform the sign-out operation
    await FirebaseAuth.instance.signOut();

    // Close the CircularProgressIndicator dialog
    Navigator.pop(context); // Dismiss the dialog

    // Navigate back to the previous screen
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('CryptoTracker',
            style: TextStyle(color: Colors.white, fontSize: 25)),
        backgroundColor: Colors.orange,
        automaticallyImplyLeading: false, // Hide the back arrow icon
        actions: [
          IconButton(
            onPressed: () => signOutUser(context),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Coin> coinList; // Declare coinList

  Future<List<Coin>> fetchCoin() async {
    coinList = [];
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false'));

    if (response.statusCode == 200) {
      List<dynamic> values = json.decode(response.body);
      if (values.isNotEmpty) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            coinList.add(Coin.fromJson(map));
          }
        }
      }
      setState(() {}); // Trigger a rebuild
      return coinList;
    } else {
      throw Exception('Failed to load coins');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCoin(); // Fetch coins when the widget initializes
    Timer.periodic(const Duration(seconds: 10), (timer) => fetchCoin());
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: coinList.length,
      itemBuilder: (context, index) {
        return CoinCard(
          name: coinList[index].name,
          symbol: coinList[index].symbol,
          imageUrl: coinList[index].imageUrl,
          price: coinList[index].price.toDouble(),
          change: coinList[index].change.toDouble(),
          changePercentage: coinList[index].changePercentage.toDouble(),
        );
      },
    );
  }
}
